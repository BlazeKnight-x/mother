#!/usr/bin/env python3
"""
Convert object-script .asm files to the new label convention.

include.asm's OBJ_* macros used to require callers to spell out the offset
to a branch target by hand, e.g.:

    OBJ_IS_NOT_TALKING @end-ObjPodunkPippimom
    OBJ_IS_NOT_FLAG $0B,@no_pippi-ObjPodunkPippimom

Now that those macros compute the offset themselves (via OBJ_BASE, or via
the 'object' argument for OBJ_SUBROUTINE), the "-ObjName" part is redundant
and should be removed:

    OBJ_IS_NOT_TALKING @end
    OBJ_IS_NOT_FLAG $0B,@no_pippi

OBJ_BASE is captured by ObjectDef from an explicit name argument (ca65's
.set can't be used for this -- it can't be combined with a forward
reference like '@end', which is how most branch targets are written), so
ObjectDef calls also gain the enclosing object's own label as a new first
argument:

    ObjectDef OBJ_TYPE::SPINNING_NPC, $DA, 4, $150
        -> becomes ->
    ObjectDef ObjPodunkPippimom, OBJ_TYPE::SPINNING_NPC, $DA, 4, $150

This script reads a file line by line. It tracks the most recently seen
top-level (non-'@') label and injects that name into any ObjectDef call,
and for any line invoking one of the affected OBJ_* macros, strips the
"-Identifier" suffix from each label-looking argument on that line.
Everything else -- non-label arguments, comments, other macros -- is left
untouched.
"""

import argparse
import re
import sys
import os

# Every OBJ_* macro in include.asm whose label argument(s) now compute
# their own offset internally, and therefore no longer need "-ObjName"
# spelled out at the call site.
LABEL_INSTRUCTIONS = {
    "OBJ_JUMP", "OBJ_IS_SIGNAL", "OBJ_IS_NOT_TALKING", "OBJ_IS_NOT_CHECKING",
    "OBJ_IS_NOT_TOUCHING", "OBJ_IS_NOT_USING", "OBJ_IS_NOT_CASTING",
    "OBJ_IS_NOT_SELECTED", "OBJ_TAKE_WEAPON", "OBJ_GIVE_MONEY",
    "OBJ_SELECT_CONFWEAPON", "OBJ_IS_NOT_FLAG", "OBJ_NOT_HAS_ITEM",
    "OBJ_NOT_MAX_HEALTH", "OBJ_NOT_CHARACTER_SELECTED", "OBJ_ADD_CHARACTER",
    "OBJ_NOT_MAX_PP", "OBJ_TAKE_MONEY", "OBJ_NO_NEW_MONEY", "OBJ_HAS_STATUS",
    "OBJ_NOT_HAS_CHARACTER", "OBJ_GIVE_ITEM", "OBJ_PICK_CHARACTER_ITEM",
    "OBJ_PICK_CHARACTER_J", "OBJ_REMOVE_ITEM", "OBJ_REMOVE_CHARACTER",
    "OBJ_YESNO_IS_NO", "OBJ_CHOOSE_ITEM", "OBJ_UNSELLABLE",
    "OBJ_INPUT_NUMBER", "OBJ_WITHDRAW", "OBJ_DEPOSIT", "OBJ_CHOOSE_CHARACTER",
    "OBJ_IS_NOT_FACING", "OBJ_HAS_MOVED", "OBJ_CHARA_NOT_HAS_ITEM",
    "OBJ_BELOW_LEVEL", "OBJ_NO_ITEMS", "OBJ_ADD_ITEM_TO_CLOSET",
    "OBJ_NO_ITEMS_CLOSET", "OBJ_CHOOSE_ITEM_CLOSET",
    "OBJ_TAKE_ITEM_FROM_CLOSET", "OBJ_INCOMPLETE_MELODIES",
    "OBJ_COUNTERLESSTHAN", "OBJ_SHOP", "OBJ_NUMBERLESSTHAN", "OBJ_MENU",
    "OBJ_SUBROUTINE",
}

# A label-looking token ("@name" or a plain "Identifier") immediately
# followed by "-Identifier" -- e.g. "@end-ObjFoo" or "Main-ObjFoo" -- with
# the trailing "-Identifier" captured for removal.
_OFFSET_RE = re.compile(r'(@?[A-Za-z_][A-Za-z0-9_]*)-[A-Za-z_][A-Za-z0-9_]*')

# A bare hex ("$31") or decimal ("49") numeral, with nothing else -- i.e. an
# already-computed offset with no symbolic label (common in a
# reverse-engineered codebase where not every jump target has been named
# yet). The macros now subtract their base unconditionally, so a bare
# numeral has to be wrapped as "(BASE + numeral)" to still net out to the
# original raw value.
_BARE_NUMERAL_RE = re.compile(r'^\$[0-9A-Fa-f]+$|^[0-9]+$')

# Mnemonics whose *last two* arguments are label arguments (every other
# affected mnemonic has exactly one, and it's always the last argument).
_TWO_LABEL_ARGS = {"OBJ_MENU"}

# Mnemonics whose label offset is relative to their own first argument
# ('object') rather than OBJ_BASE.
_RELATIVE_TO_FIRST_ARG = {"OBJ_SUBROUTINE"}


def _transform_args(mnemonic: str, rest: str) -> str:
    """Strip '-ObjName' suffixes from label arguments, and wrap any bare
    numeral used as a label argument so the macro's internal subtraction
    still nets out to that original raw value.
    """
    rest = _OFFSET_RE.sub(r'\1', rest)

    n_label_args = 2 if mnemonic in _TWO_LABEL_ARGS else 1
    args = rest.split(',')
    if len(args) < n_label_args:
        return rest

    base = args[0].strip() if mnemonic in _RELATIVE_TO_FIRST_ARG else "OBJ_BASE"

    for i in range(len(args) - n_label_args, len(args)):
        token = args[i].strip()
        if _BARE_NUMERAL_RE.match(token):
            args[i] = args[i].replace(token, f"({base} + {token})", 1)

    return ','.join(args)


# The mnemonic at the start of a code line (leading whitespace, then a bare
# identifier), with the rest of the line captured separately.
_MNEMONIC_RE = re.compile(r'^(\s*)([A-Za-z_][A-Za-z0-9_]*)\b(.*)')

# A top-level (non-cheap-local) label declaration alone on its line, e.g.
# "ObjPodunkPippimom:". Cheap local labels (start with '@') don't count.
_TOP_LABEL_RE = re.compile(r'^([A-Za-z_][A-Za-z0-9_]*):\s*$')

# An ObjectDef invocation, so its argument list can be captured for the
# name injection.
_OBJECTDEF_RE = re.compile(r'^(\s*)(ObjectDef)(\s+)(.*)')


def strip_offsets_in_line(line: str) -> str:
    """Remove the '-ObjName' suffix from label arguments on one line,
    if and only if that line invokes one of LABEL_INSTRUCTIONS.
    Comments (anything after ';') are left untouched.
    """
    code, sep, comment, ending = _split_line(line)

    m = _MNEMONIC_RE.match(code)
    if m:
        indent, mnemonic, rest = m.groups()
        if mnemonic in LABEL_INSTRUCTIONS:
            code = f"{indent}{mnemonic}{_transform_args(mnemonic, rest)}"

    return f"{code}{sep}{comment}{ending}"


def inject_objectdef_name(line: str, current_label: str) -> str:
    """Insert 'current_label, ' as ObjectDef's new first argument, if this
    line invokes ObjectDef and a current label is known.
    """
    if current_label is None:
        return line

    code, sep, comment, ending = _split_line(line)

    m = _OBJECTDEF_RE.match(code)
    if m:
        indent, mnemonic, ws, rest = m.groups()
        code = f"{indent}{mnemonic}{ws}{current_label}, {rest}"

    return f"{code}{sep}{comment}{ending}"


def _split_line(line: str):
    """Split a line into (code, ';' separator, comment, line-ending),
    preserving the exact line ending found.
    """
    ending = ''
    body = line
    for eol in ('\r\n', '\n', '\r'):
        if body.endswith(eol):
            body, ending = body[: -len(eol)], eol
            break
    code, sep, comment = body.partition(';')
    return code, sep, comment, ending


def convert_object_file(in_path: str, out_path: str = None) -> int:
    """Read in_path line by line, inject the enclosing object's name into
    ObjectDef calls, strip redundant '-ObjName' offsets from any line using
    an affected instruction, and write the result to out_path (defaults to
    overwriting in_path). Returns the number of lines that were changed.
    """
    if out_path is None:
        out_path = in_path

    with open(in_path, 'r', encoding='utf-8', newline='') as f:
        lines = f.readlines()

    changed = 0
    new_lines = []
    current_label = None
    for line in lines:
        code = line.partition(';')[0]
        m = _TOP_LABEL_RE.match(code.strip())
        if m and not m.group(1).startswith('@'):
            current_label = m.group(1)

        new_line = strip_offsets_in_line(line)
        new_line = inject_objectdef_name(new_line, current_label)

        if new_line != line:
            changed += 1
        new_lines.append(new_line)

    with open(out_path, 'w', encoding='utf-8', newline='') as f:
        f.writelines(new_lines)

    return changed


if __name__ == "__main__":
    '''
    parser.add_argument("input", help="Path to the .asm file to convert")
    parser.add_argument(
        "-o", "--output",
        help="Where to write the result (default: overwrite the input file)",
    )
    '''

    # for all folders (1, 2, 3)
    for folder in ["1", "2", "3"]:
        # for all file in folder
        # search folder for all .asm files in the folder
        for root, dirs, files in os.walk(f"src/global/objects/{folder}"):
            for file in files:
                if file.endswith(".asm"):
                    input_path = os.path.join(root, file)
                    output_path = input_path  # overwrite the input file
                    changed = convert_object_file(input_path, output_path)
                    print(f"Updated {changed} line(s) -> {output_path}", file=sys.stderr)