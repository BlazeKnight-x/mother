OBJ_BANK_C:
.addr OBJ_GRAVEYARD_HOLEENTRANCE
.addr OBJ_GRAVEYARD_DOOREXIT
.addr OBJ_GRAVEYARD_HOLEEXIT
.addr OBJ_GRAVEYARD_DOORENTRANCE
.addr OBJ_GRAVEYARD_CASKET1
.addr OBJ_GRAVEYARD_CASKET2
.addr OBJ_GRAVEYARD_CASKET3
.addr OBJ_GRAVEYARD_CASKET4
.addr OBJ_GRAVEYARD_PIPPI
.addr 0

OBJ_GRAVEYARD_HOLEENTRANCE:
objectDef OBJ_TYPE::HOLE, $da, DIRECTIONS::UP, $236
doorArgDef $11, $31E, DIRECTIONS::LEFT, $84

OBJ_GRAVEYARD_DOOREXIT:
objectDef OBJ_TYPE::DOOR, $33e, DIRECTIONS::RIGHT, $86
doorArgDef $0, $311, DIRECTIONS::RIGHT, $8B

OBJ_GRAVEYARD_HOLEEXIT:
objectDef OBJ_TYPE::DOOR, $31e, DIRECTIONS::UP, $83
doorArgDef $D, $DA, DIRECTIONS::DOWN, $236

OBJ_GRAVEYARD_DOORENTRANCE:
objectDef OBJ_TYPE::DOOR, $310, DIRECTIONS::LEFT, $8b
doorArgDef $0, $33D, DIRECTIONS::LEFT, $86

OBJ_GRAVEYARD_CASKET1:
objectDef $21, $334, DIRECTIONS::UP, $87
.addr SPRITEDEF_156 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $1B
.byte SCRIPTS::J_CHECK, OBJ_GRAVEYARD_CASKET1_JCHECK0-OBJ_GRAVEYARD_CASKET1
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_CASKET_GENERIC
.byte SCRIPTS::F_SETFLAG, $1F
.byte SCRIPTS::F_SETFLAG, $1B
.byte SCRIPTS::O_SIGNAL, $8
.byte SCRIPTS::M_MOVE
.addr OBJ_GRAVEYARD_CASKET1_MOVE0
    OBJ_GRAVEYARD_CASKET1_JCHECK0:
.byte 0
    OBJ_GRAVEYARD_CASKET1_MOVE0:
moveDef DIRECTIONS::UP, $A, $1
.byte 0

OBJ_GRAVEYARD_CASKET2:
objectDef $21, $336, DIRECTIONS::UP, $85
.addr SPRITEDEF_156 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $1C
.byte SCRIPTS::J_CHECK, OBJ_GRAVEYARD_CASKET2_JCHECK0-OBJ_GRAVEYARD_CASKET2
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_CASKET_GENERIC
.byte SCRIPTS::B_BATTLE, $10
.byte SCRIPTS::F_SETFLAG, $1C
    OBJ_GRAVEYARD_CASKET2_JCHECK0:
.byte 0

OBJ_GRAVEYARD_CASKET3:
objectDef $21, $339, DIRECTIONS::UP, $85
.addr SPRITEDEF_156 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $1D
.byte SCRIPTS::J_CHECK, OBJ_GRAVEYARD_CASKET3_JCHECK0-OBJ_GRAVEYARD_CASKET3
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_CASKET_GENERIC
.byte SCRIPTS::B_BATTLE, $10
.byte SCRIPTS::F_SETFLAG, $1D
    OBJ_GRAVEYARD_CASKET3_JCHECK0:
.byte 0

OBJ_GRAVEYARD_CASKET4:
objectDef $21, $33b, DIRECTIONS::UP, $87
.addr SPRITEDEF_156 ;sprite
.byte SCRIPTS::F_DISAPPEAR, $1E
.byte SCRIPTS::J_CHECK, OBJ_GRAVEYARD_CASKET4_JCHECK0-OBJ_GRAVEYARD_CASKET4
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_CASKET_GENERIC
.byte SCRIPTS::B_BATTLE, $10
.byte SCRIPTS::F_SETFLAG, $1E
    OBJ_GRAVEYARD_CASKET4_JCHECK0:
.byte 0

OBJ_GRAVEYARD_PIPPI:
objectDef OBJ_TYPE::STATIONARY_NPC_CHECKSPAWN, $334, DIRECTIONS::DOWN, $87
.addr SPRITEDEF_20 ;sprite
.byte SCRIPTS::F_APPEAR, $1F
.byte SCRIPTS::J_TALK, OBJ_GRAVEYARD_PIPPI_JTALK0-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_PIPPI
.byte SCRIPTS::J_YESNO, OBJ_GRAVEYARD_PIPPI_JYESNO1-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_BRAVE_YES
.byte SCRIPTS::J_JUMP, OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_JYESNO1:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_BRAVE_NO
.byte SCRIPTS::J_YESNO, OBJ_GRAVEYARD_PIPPI_JYESNO3-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_MEET_YES
.byte SCRIPTS::IJ_HASITEM, $0, OBJ_GRAVEYARD_PIPPI_IJHASITEM4-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::I_PICKITEM, $68
.byte SCRIPTS::J_GIVEITEM, OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::S_PLAYSOUND, $6
.byte SCRIPTS::F_SETFLAG, $62
.byte SCRIPTS::J_JUMP, OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_IJHASITEM4:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_NOROOM2
.byte SCRIPTS::J_JUMP, OBJ_GRAVEYARD_PIPPIJ_JUMP2-OBJ_GRAVEYARD_PIPPI
    OBJ_GRAVEYARD_PIPPI_JYESNO3:
.byte SCRIPTS::DIALOGUE
.word UMSG::PODUNK_PIPPI_MEET_NO
    OBJ_GRAVEYARD_PIPPIJ_JUMP2:
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_PIPPI_LEAVE
.byte SCRIPTS::M_MUSIC, $21
.byte SCRIPTS::T_DELAY, $B4
.byte SCRIPTS::M_MUSIC, $11
.byte SCRIPTS::M_MOVE
.addr OBJ_GRAVEYARD_PIPPI_MOVE0
.byte SCRIPTS::DIALOGUE
.word UMSG::GRAVEYARD_PIPPI_AFRAID
.byte SCRIPTS::M_MOVE
.addr OBJ_GRAVEYARD_PIPPI_MOVE1
.byte SCRIPTS::CJ_ADDCHAR, $5, OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::F_CLEARFLAG, $1F
.byte 0
    OBJ_GRAVEYARD_PIPPI_JTALK0:
.byte SCRIPTS::J_SIGNALED, OBJ_GRAVEYARD_PIPPI_JGIVEITEM5-OBJ_GRAVEYARD_PIPPI
.byte SCRIPTS::M_MOVE
.addr OBJ_GRAVEYARD_PIPPI_MOVE2
.byte SCRIPTS::M_MUSIC, $1D
.byte SCRIPTS::T_DELAY, $B4
.byte SCRIPTS::M_MUSIC, $11
    OBJ_GRAVEYARD_PIPPI_JGIVEITEM5:
.byte 0
    OBJ_GRAVEYARD_PIPPI_MOVE0:
moveDef DIRECTIONS::UP_RIGHT, $6, $1
moveDef DIRECTIONS::RIGHT, $6, $8
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::ABOUTFACE, $1
.byte 3
    OBJ_GRAVEYARD_PIPPI_MOVE1:
moveDef DIRECTIONS::DOWN, $6, $1
moveDef DIRECTIONS::LEFT, MOVE_CMD::MOVEFACE, $1
moveDef DIRECTIONS::UP, MOVE_CMD::MOVEFACE, $1
moveDef DIRECTIONS::RIGHT, MOVE_CMD::ABOUTFACE, $1
.byte 0
    OBJ_GRAVEYARD_PIPPI_MOVE2:
moveDef DIRECTIONS::DOWN, MOVE_CMD::ABOUTFACE, $1
.byte 0