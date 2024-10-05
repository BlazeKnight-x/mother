.ifndef VER_JP

.charmap $41, $C1 ;A == $C1
.charmap $42, $C2 ;B == $C2
.charmap $43, $C3 ;C == $C3
.charmap $44, $C4 ;D == $C4
.charmap $45, $C5 ;E == $C5
.charmap $46, $C6 ;F == $C6
.charmap $47, $C7 ;G == $C7
.charmap $48, $C8 ;H == $C8
.charmap $49, $C9 ;I == $C9
.charmap $4A, $CA ;J == $CA
.charmap $4B, $CB ;K == $CB
.charmap $4C, $CC ;L == $CC
.charmap $4D, $CD ;M == $CD
.charmap $4E, $CE ;N == $CE
.charmap $4F, $CF ;O == $CF
.charmap $50, $D0 ;P == $D0
.charmap $51, $D1 ;Q == $D1
.charmap $52, $D2 ;R == $D2
.charmap $53, $D3 ;S == $D3
.charmap $54, $D4 ;T == $D4
.charmap $55, $D5 ;U == $D5
.charmap $56, $D6 ;V == $D6
.charmap $57, $D7 ;W == $D7
.charmap $58, $D8 ;X == $D8
.charmap $59, $D9 ;Y == $D9
.charmap $5A, $DA ;Z == $DA

.charmap $61, $E1 ;a == $E1
.charmap $62, $E2 ;b == $E2
.charmap $63, $E3 ;c == $E3
.charmap $64, $E4 ;d == $E4
.charmap $65, $E5 ;e == $E5
.charmap $66, $E6 ;f == $E6
.charmap $67, $E7 ;g == $E7
.charmap $68, $E8 ;h == $E8
.charmap $69, $E9 ;i == $E9
.charmap $6A, $EA ;j == $EA
.charmap $6B, $EB ;k == $EB
.charmap $6C, $EC ;l == $EC
.charmap $6D, $ED ;m == $ED
.charmap $6E, $EE ;n == $EE
.charmap $6F, $EF ;o == $EF
.charmap $70, $F0 ;p == $F0
.charmap $71, $F1 ;q == $F1
.charmap $72, $F2 ;r == $F2
.charmap $73, $F3 ;s == $F3
.charmap $74, $F4 ;t == $F4
.charmap $75, $F5 ;u == $F5
.charmap $76, $F6 ;v == $F6
.charmap $77, $F7 ;w == $F7
.charmap $78, $F8 ;x == $F8
.charmap $79, $F9 ;y == $F9
.charmap $7A, $FA ;z == $FA

;symbols

;this helps us even use quotes in the first place.
;if a better method if found (escapes dont work), deprecate this.
.FEATURE loose_string_term

.charmap $20, $A0 ;" " == $A0
.charmap $21, $A1 ;!
.charmap $3F, $A2 ;?
.charmap $23, $A3 ;..
.charmap $24, $A4 ;$
.charmap $25, $A5 ;.
.charmap $22, $A6 ;"
.charmap $27, $A7 ;' == $A7
.charmap $28, $A8 ;(
.charmap $29, $A9 ;)
.charmap $3A, $AA ;:
.charmap $2B, $AB ;;
.charmap $2C, $AC ;, == $AC
.charmap $2D, $AD ;-
.charmap $2E, $AE ;. == $AE
.charmap $2F, $AF ;/
.charmap $2A, $C0 ;* == $C0 (is technically ◆, but can't be typed/is too big)

;numbers
.charmap $30, $B0 ;0 == $B0
.charmap $31, $B1 ;1 == $B1
.charmap $32, $B2 ;2 == $B2
.charmap $33, $B3 ;3 == $B3
.charmap $34, $B4 ;4 == $B4
.charmap $35, $B5 ;5 == $B5
.charmap $36, $B6 ;6 == $B6
.charmap $37, $B7 ;7 == $B7
.charmap $38, $B8 ;8 == $B8
.charmap $39, $B9 ;9 == $B9


;manual defines
.ifndef stopText
;insertion codes
;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/TBL#Text_Commands
stopText = 0
newLine = 1
waitThenOverwrite = 2
pauseText = 3
.define cashDeposit $23,$15,$74,pauseText,stopText
.define currentCash $23,$12,$74,pauseText,stopText
.define price $23,$2A,stopText,waitThenOverwrite,stopText
.define damageAmount $23,$90,$05,waitThenOverwrite,stopText
.define defenseStat $23,$92,$05,waitThenOverwrite,stopText
.define lvHPPPinc $23,$5D,stopText,newLine,stopText
.define lvFIGinc $23,$58,stopText,newLine,stopText
.define lvSPDinc $23,$59,stopText,newLine,stopText
.define lvWISinc $23,$5A,stopText,newLine,stopText
.define lvSTRinc $23,$5B,stopText,newLine,stopText
.define lvFORinc $23,$5C,stopText,newLine,stopText
.define SMAAAAASH $97,$98,$99,$9A,$9B,$9C,$9D,$9E,$9F ; this isnt a command per se but this is helpful enough
.define user $21,$20,$6D
.define recipient $21,$24,$6D
.define result $21,$00,$6d
.define favFood $21,$89,$76
.define nintenName $21,$78,$74
.define lloydName $21,$F8,$74
.define anaName $21,$B8,$74
.define teddyName $21,$38,$75
.define partyLead $21,$0A,$67
.define item $21,$04,$6D
.define playerName $21,$20,$74
.define attacker $21,$80,$05
.define beingAttacked $21,$88,$05
.define attackResult $21,$90,$05
.define unk $20,$08,$06
.define unk2 $20,$08,$07
.define unk3 $22,$A0,$10

;i cant charmap these :(
alpha = $BB ; α
beta  = $BC ; β
gamma = $BD ; γ
pi    = $BE ; π
omega = $BF ; Ω

.endif

.else


;for the kanji that have accents/circles, insert a tile that goes in $00-$3F.
;there, it will be offset and the accent tile will be put above.
.charmap $30, $5B ;0 == $B0
.charmap $31, $5C ;1 == $B1
.charmap $32, $5D ;2 == $B2
.charmap $33, $5E ;3 == $B3
.charmap $34, $5F ;4 == $B4
.charmap $35, $7B ;5 == $B5
.charmap $36, $7C ;6 == $B6
.charmap $37, $7D ;7 == $B7
.charmap $38, $7E ;8 == $B8
.charmap $39, $7F ;9 == $B9
.charmap $20, $C0 ;" " == $C0
;these are most likely the actual japanese variants but i cannot be fucked
.charmap $2D, $D0 ;- == $D0
.charmap $2E, $70 ;. == $70
.charmap $2C, $60 ;, == $60
.charmap $2A, $90 ;* == $C0 (is technically ◆, but can't be typed/is too big)


;basically .charmap for kanji
;technically can be for any symbol, though i only really made it for japanese
.list on
;manual defines
.ifndef stopText
;insertion codes
;https://datacrystal.tcrf.net/wiki/EarthBound_Beginnings/TBL#Text_Commands
stopText = 0
newLine = 1
waitThenOverwrite = 2
pauseText = 3
.define cashDeposit $23,$15,$74,pauseText,stopText
.define currentCash $23,$12,$74,pauseText,stopText
.define price $23,$2A,stopText,waitThenOverwrite,stopText
.define damageAmount $23,$90,$05,waitThenOverwrite,stopText
.define defenseStat $23,$92,$05,waitThenOverwrite,stopText
.define lvHPPPinc $23,$5D,stopText,newLine,stopText
.define lvFIGinc $23,$58,stopText,newLine,stopText
.define lvSPDinc $23,$59,stopText,newLine,stopText
.define lvWISinc $23,$5A,stopText,newLine,stopText
.define lvSTRinc $23,$5B,stopText,newLine,stopText
.define lvFORinc $23,$5C,stopText,newLine,stopText
.define SMAAAAASH $67,$68,$69,$6A,$6B,$6C,$6D,$6E,$6F ; this isnt a command per se but this is helpful enough
.define user $21,$20,$6D
.define recipient $21,$24,$6D
.define result $21,$00,$6d
.define favFood $21,$89,$76
.define nintenName $21,$78,$74
.define lloydName $21,$F8,$74
.define anaName $21,$B8,$74
.define teddyName $21,$38,$75
.define partyLead $21,$0A,$67
.define item $21,$04,$6D
.define playerName $21,$20,$74
.define attacker $21,$80,$05
.define beingAttacked $21,$88,$05
.define attackResult $21,$90,$05
.define unk $20,$08,$06
.define unk2 $20,$08,$07
.define unk3 $22,$A0,$10

;i cant charmap these :(
alpha = $BB ; α
beta  = $BC ; β
gamma = $BD ; γ
pi    = $BE ; π
omega = $BF ; Ω



;PLEASE PLEASE PLEASE PLEASE PLEASE PLEASE P L E A S E make this better.
;find out what algo they use, what encoding it is, whatever. i dont care
;this ABSO FUCKING LUTELY SUCKS BALLSSSSSSSSSSSSSSS
.macro  kanjifix Arg
    .scope
    skipInc .set 0
    .repeat .strlen(Arg), I
        .if ((I < .strlen(Arg) - 2) && skipInc = 0)
            skipInc .set 2
            .if (.strat(Arg, I) = $E3)
                .if (.strat(Arg, I+1) = $80)
                    ;。
                    .if ((.strat(Arg, I+2) = $82))
                        .byte   $ff
                    .endif
                .elseif (.strat(Arg, I+1) = $81)
                    ;.if ((.strat(Arg, I+2) >= $81) && (.strat(Arg, I+2) <= $8A))
                    ;    .scope
                    ;    tile .set .strat(Arg, I+2) 
                    ;    small = tile & 1
                    ;    .if (small)
                    ;        .byte (tile + 6) - ((tile-$81) / 2)
                    ;    .else
                    ;        .byte (tile + $f) - ((tile-$81) / 2)
                    ;    .endif
                    ;    .endscope
                        ;ぁ
                        .if ((.strat(Arg, I+2) = $81))
                            .byte   $87
                        ;あ
                        .elseif ((.strat(Arg, I+2) = $82))
                            .byte   $91
                        ;ぃ
                        .elseif ((.strat(Arg, I+2) = $83))
                            .byte   $88
                        ;い
                        .elseif ((.strat(Arg, I+2) = $84))
                            .byte   $92
                        ;ぅ
                        .elseif ((.strat(Arg, I+2) = $85))
                            .byte   $89
                        ;う
                        .elseif ((.strat(Arg, I+2) = $86))
                            .byte   $93
                        ;ぇ
                        .elseif ((.strat(Arg, I+2) = $87))
                            .byte   $8A
                        ;え
                        .elseif ((.strat(Arg, I+2) = $88))
                            .byte   $94
                        ;ぉ
                        .elseif ((.strat(Arg, I+2) = $89))
                            .byte   $8B
                        ;お
                        .elseif ((.strat(Arg, I+2) = $8A))
                            .byte   $95
                    ;.elseif ((.strat(Arg, I+2) >= $8B) && (.strat(Arg, I+2) <= $A2))
                    ;    .scope
                    ;    tile .set .strat(Arg, I+2) 
                    ;    dakuten = !(tile & 1)
                    ;    .if (dakuten)
                    ;        .byte ((tile + $b) - ((tile-$8B) / 2)) - $91
                    ;    .else
                    ;        .byte (tile + $b) - ((tile-$8B) / 2)
                    ;    .endif
                    ;    .endscope
                        ;か
                        .elseif ((.strat(Arg, I+2) = $8B))
                            .byte   $96
                        ;が
                        .elseif ((.strat(Arg, I+2) = $8C))
                            .byte   $06
                        ;き
                        .elseif ((.strat(Arg, I+2) = $8D))
                            .byte   $97
                        ;ぎ
                        .elseif ((.strat(Arg, I+2) = $8E))
                            .byte   $07
                        ;く
                        .elseif ((.strat(Arg, I+2) = $8F))
                            .byte   $98
                        ;ぐ
                        .elseif ((.strat(Arg, I+2) = $90))
                            .byte   $08
                        ;け
                        .elseif ((.strat(Arg, I+2) = $91))
                            .byte   $99
                        ;げ
                        .elseif ((.strat(Arg, I+2) = $92))
                            .byte   $09
                        ;こ
                        .elseif ((.strat(Arg, I+2) = $93))
                            .byte   $9A
                        ;ご
                        .elseif ((.strat(Arg, I+2) = $94))
                            .byte   $0A
                        ;さ
                        .elseif ((.strat(Arg, I+2) = $95))
                            .byte   $9B
                        ;ざ
                        .elseif ((.strat(Arg, I+2) = $96))
                            .byte   $0B
                        ;し
                        .elseif ((.strat(Arg, I+2) = $97))
                            .byte   $9C
                        ;じ
                        .elseif ((.strat(Arg, I+2) = $98))
                            .byte   $0C
                        ;す
                        .elseif ((.strat(Arg, I+2) = $99))
                            .byte   $9D
                        ;ず
                        .elseif ((.strat(Arg, I+2) = $9A))
                            .byte   $0D
                        ;せ
                        .elseif ((.strat(Arg, I+2) = $9B))
                            .byte   $9E
                        ;ぜ
                        .elseif ((.strat(Arg, I+2) = $9C))
                            .byte   $0E
                        ;そ
                        .elseif ((.strat(Arg, I+2) = $9D))
                            .byte   $9F
                        ;ぞ
                        .elseif ((.strat(Arg, I+2) = $9E))
                            .byte   $0F
                        ;た
                        .elseif ((.strat(Arg, I+2) = $9F))
                            .byte   $A0
                        ;だ
                        .elseif ((.strat(Arg, I+2) = $A0))
                            .byte   $10
                        ;ち
                        .elseif ((.strat(Arg, I+2) = $A1))
                            .byte   $A1
                        ;ぢ
                        .elseif ((.strat(Arg, I+2) = $A2))
                            .byte   $11
                    ;っ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $8F
                    ;つ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $A2
                    ;づ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $12
                    ;て
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $A3
                    ;で
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $13
                    ;と
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $A4
                    ;ど
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $14
                    ;な
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $A5
                    ;に
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $A6
                    ;ぬ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $A7
                    ;ね
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $A8
                    ;の
                    .elseif ((.strat(Arg, I+2) = $AE))
                        .byte   $A9
                    ;は
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $AA
                    ;ば
                    .elseif ((.strat(Arg, I+2) = $B0))
                        .byte   $1A
                    ;ぱ
                    .elseif ((.strat(Arg, I+2) = $B1))
                        .byte   $15
                    ;ひ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $AB
                    ;び
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $1B
                    ;ぴ
                    .elseif ((.strat(Arg, I+2) = $B4))
                        .byte   $16
                    ;ふ
                    .elseif ((.strat(Arg, I+2) = $B5))
                        .byte   $AC
                    ;ぶ
                    .elseif ((.strat(Arg, I+2) = $B6))
                        .byte   $1C
                    ;ぷ
                    .elseif ((.strat(Arg, I+2) = $B7))
                        .byte   $17
                    ;へ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $B8))
                        .byte   $AD
                    ;べ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $B9))
                        .byte   $1D
                    ;ぺ (hirigana)
                    .elseif ((.strat(Arg, I+2) = $BA))
                        .byte   $18
                    ;ほ
                    .elseif ((.strat(Arg, I+2) = $BB))
                        .byte   $AE
                    ;ぼ
                    .elseif ((.strat(Arg, I+2) = $BC))
                        .byte   $1e
                    ;ぽ
                    .elseif ((.strat(Arg, I+2) = $BD))
                        .byte   $19
                    ;ま
                    .elseif ((.strat(Arg, I+2) = $BE))
                        .byte   $AF
                    ;み
                    .elseif ((.strat(Arg, I+2) = $BF))
                        .byte   $B0
                    .endif
                .elseif (.strat(Arg, I+1) = $82)
                    ;む
                    .if ((.strat(Arg, I+2) = $80))
                        .byte   $B1
                    ;め
                    .elseif ((.strat(Arg, I+2) = $81))
                        .byte   $B2
                    ;も
                    .elseif ((.strat(Arg, I+2) = $82))
                        .byte   $B3
                    ;ゃ
                    .elseif ((.strat(Arg, I+2) = $83))
                        .byte   $8C
                    ;や
                    .elseif ((.strat(Arg, I+2) = $84))
                        .byte   $B4
                    ;ゅ
                    .elseif ((.strat(Arg, I+2) = $85))
                        .byte   $8D
                    ;ゆ
                    .elseif ((.strat(Arg, I+2) = $86))
                        .byte   $B5
                    ;ょ
                    .elseif ((.strat(Arg, I+2) = $87))
                        .byte   $8E
                    ;よ
                    .elseif ((.strat(Arg, I+2) = $88))
                        .byte   $B6
                    ;ら
                    .elseif ((.strat(Arg, I+2) = $89))
                        .byte   $B7
                    ;り
                    .elseif ((.strat(Arg, I+2) = $8A))
                        .byte   $B8
                    ;る
                    .elseif ((.strat(Arg, I+2) = $8B))
                        .byte   $B9
                    ;れ
                    .elseif ((.strat(Arg, I+2) = $8C))
                        .byte   $BA
                    ;ろ
                    .elseif ((.strat(Arg, I+2) = $8D))
                        .byte   $BB
                    ;わ
                    .elseif ((.strat(Arg, I+2) = $8F))
                        .byte   $BC
                    ;を
                    .elseif ((.strat(Arg, I+2) = $92))
                        .byte   $86
                    ;ん
                    .elseif ((.strat(Arg, I+2) = $93))
                        .byte   $BD
                    ;ァ
                    .elseif ((.strat(Arg, I+2) = $A1))
                        .byte   $C7
                    ;ア
                    .elseif ((.strat(Arg, I+2) = $A2))
                        .byte   $D1
                    ;ィ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $C8
                    ;イ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $D2
                    ;ゥ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $C9
                    ;ウ
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $D3
                    ;ェ
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $CA
                    ;エ
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $D4
                    ;ォ
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $CB
                    ;オ
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $D5
                    ;カ
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $D6
                    ;ガ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $26
                    ;キ
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $D7
                    ;ギ
                    .elseif ((.strat(Arg, I+2) = $AE))
                        .byte   $27
                    ;ク
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $D8
                    ;グ
                    .elseif ((.strat(Arg, I+2) = $B0))
                        .byte   $28
                    ;ケ
                    .elseif ((.strat(Arg, I+2) = $B1))
                        .byte   $D9
                    ;ゲ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $29
                    ;コ
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $DA
                    ;ゴ
                    .elseif ((.strat(Arg, I+2) = $B4))
                        .byte   $2A
                    ;サ
                    .elseif ((.strat(Arg, I+2) = $B5))
                        .byte   $DB
                    ;ザ
                    .elseif ((.strat(Arg, I+2) = $B6))
                        .byte   $2B
                    ;シ
                    .elseif ((.strat(Arg, I+2) = $B7))
                        .byte   $DC
                    ;ジ
                    .elseif ((.strat(Arg, I+2) = $B8))
                        .byte   $2C
                    ;ス
                    .elseif ((.strat(Arg, I+2) = $B9))
                        .byte   $DD
                    ;ズ
                    .elseif ((.strat(Arg, I+2) = $BA))
                        .byte   $2D
                    ;セ
                    .elseif ((.strat(Arg, I+2) = $BB))
                        .byte   $DE
                    ;ゼ
                    .elseif ((.strat(Arg, I+2) = $BC))
                        .byte   $2E
                    ;ソ
                    .elseif ((.strat(Arg, I+2) = $BD))
                        .byte   $DF
                    ;ゾ
                    .elseif ((.strat(Arg, I+2) = $BE))
                        .byte   $2F
                    ;タ
                    .elseif ((.strat(Arg, I+2) = $BF))
                        .byte   $E0
                    .endif
                .elseif (.strat(Arg, I+1) = $83)
                    ;ダ
                    .if ((.strat(Arg, I+2) = $80))
                        .byte   $30
                    ;チ
                    .elseif ((.strat(Arg, I+2) = $81))
                        .byte   $E1
                    ;ヂ
                    .elseif ((.strat(Arg, I+2) = $82))
                        .byte   $31
                    ;ッ
                    .elseif ((.strat(Arg, I+2) = $83))
                        .byte   $CF
                    ;ツ
                    .elseif ((.strat(Arg, I+2) = $84))
                        .byte   $E2
                    ;ヅ
                    .elseif ((.strat(Arg, I+2) = $85))
                        .byte   $32
                    ;テ
                    .elseif ((.strat(Arg, I+2) = $86))
                        .byte   $E3
                    ;デ
                    .elseif ((.strat(Arg, I+2) = $87))
                        .byte   $33
                    ;ト
                    .elseif ((.strat(Arg, I+2) = $88))
                        .byte   $E4
                    ;ド
                    .elseif ((.strat(Arg, I+2) = $89))
                        .byte   $34
                    ;ナ
                    .elseif ((.strat(Arg, I+2) = $8A))
                        .byte   $E5
                    ;ニ
                    .elseif ((.strat(Arg, I+2) = $8B))
                        .byte   $E6
                    ;ヌ
                    .elseif ((.strat(Arg, I+2) = $8C))
                        .byte   $E7
                    ;ネ
                    .elseif ((.strat(Arg, I+2) = $8D))
                        .byte   $E8
                    ;ノ
                    .elseif ((.strat(Arg, I+2) = $8E))
                        .byte   $E9
                    ;ハ
                    .elseif ((.strat(Arg, I+2) = $8F))
                        .byte   $EA
                    ;バ
                    .elseif ((.strat(Arg, I+2) = $90))
                        .byte   $3A
                    ;パ
                    .elseif ((.strat(Arg, I+2) = $91))
                        .byte   $35
                    ;ヒ
                    .elseif ((.strat(Arg, I+2) = $92))
                        .byte   $EB
                    ;ビ
                    .elseif ((.strat(Arg, I+2) = $93))
                        .byte   $3B
                    ;ピ
                    .elseif ((.strat(Arg, I+2) = $94))
                        .byte   $36
                    ;フ
                    .elseif ((.strat(Arg, I+2) = $95))
                        .byte   $EC
                    ;ブ
                    .elseif ((.strat(Arg, I+2) = $96))
                        .byte   $3C
                    ;プ
                    .elseif ((.strat(Arg, I+2) = $97))
                        .byte   $37
                    ;ヘ (katakana)
                    .elseif ((.strat(Arg, I+2) = $98))
                        .byte   $ED
                    ;ベ (katakana)
                    .elseif ((.strat(Arg, I+2) = $99))
                        .byte   $3D
                    ;ペ (katakana)
                    .elseif ((.strat(Arg, I+2) = $9A))
                        .byte   $38
                    ;ホ
                    .elseif ((.strat(Arg, I+2) = $9B))
                        .byte   $EE
                    ;ボ
                    .elseif ((.strat(Arg, I+2) = $9C))
                        .byte   $3E
                    ;ポ
                    .elseif ((.strat(Arg, I+2) = $9D))
                        .byte   $39
                    ;マ
                    .elseif ((.strat(Arg, I+2) = $9E))
                        .byte   $EF
                    ;ミ
                    .elseif ((.strat(Arg, I+2) = $9F))
                        .byte   $F0
                    ;ム
                    .elseif ((.strat(Arg, I+2) = $A0))
                        .byte   $F1
                    ;メ
                    .elseif ((.strat(Arg, I+2) = $A1))
                        .byte   $F2
                    ;モ
                    .elseif ((.strat(Arg, I+2) = $A2))
                        .byte   $F3
                    ;ャ
                    .elseif ((.strat(Arg, I+2) = $A3))
                        .byte   $CC
                    ;ヤ
                    .elseif ((.strat(Arg, I+2) = $A4))
                        .byte   $F4
                    ;ュ
                    .elseif ((.strat(Arg, I+2) = $A5))
                        .byte   $CD
                    ;ユ
                    .elseif ((.strat(Arg, I+2) = $A6))
                        .byte   $F5
                    ;ョ
                    .elseif ((.strat(Arg, I+2) = $A7))
                        .byte   $CE
                    ;ヨ
                    .elseif ((.strat(Arg, I+2) = $A8))
                        .byte   $F6
                    ;ラ
                    .elseif ((.strat(Arg, I+2) = $A9))
                        .byte   $F7
                    ;リ
                    .elseif ((.strat(Arg, I+2) = $AA))
                        .byte   $F8
                    ;ル
                    .elseif ((.strat(Arg, I+2) = $AB))
                        .byte   $F9
                    ;レ
                    .elseif ((.strat(Arg, I+2) = $AC))
                        .byte   $FA
                    ;ロ
                    .elseif ((.strat(Arg, I+2) = $AD))
                        .byte   $FB
                    ;ワ
                    .elseif ((.strat(Arg, I+2) = $AF))
                        .byte   $FC
                    ;ヲ
                    .elseif ((.strat(Arg, I+2) = $B2))
                        .byte   $C6
                    ;ン
                    .elseif ((.strat(Arg, I+2) = $B3))
                        .byte   $FD
                    .endif
                .endif
            .else
                skipInc .set 0
                .byte   .strat(Arg, I)
            .endif
        .else
            .if (skipInc = 0)
                .byte   .strat(Arg, I)
            .elseif (skipInc > 0)
                skipInc .set skipInc - 1
            .endif
        .endif
    .endrep
    .endscope
.endmacro
.endif

.endif