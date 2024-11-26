.segment        "PRG1F": absolute
        .incbin "../../split/us/prg/bank1f/unk0.bin"

.segment "VECTORS"
Reset_Vector:
unk_jsr1 := $FCEE
unk_jsr2 := $FD14
unk_jmp := $CB44
        lda #PPUC_SPR_TableF
        sta PPUCTRL

        sei
        cld

        lda #0
        sta PPUMASK
        sta SND_CHN
        sta DMC_FREQ
        sta IRQDISABLE

        lda #$40
        sta FRAME_COUNTER
        sta PRGRAMPROTECT

        ldx #2
        jump1:
        bit PPUSTATUS
        bpl jump1
        dex
        bne jump1

        bit PPUSTATUS
        ldy #$3F
        ldx #0
        sty PPUADDR
        stx PPUADDR

        ldx #$20
        lda #$F
        jump2:
        sta PPUDATA
        dex
        bne jump2

        sty PPUADDR
        stx PPUADDR
        stx PPUADDR
        stx PPUADDR

        lda #$1E
        sta PPUMASK

        bit PPUSTATUS
        lda #$10
        tax
        jump3:
        sta PPUADDR
        sta PPUADDR
        eor #0
        dex
        bne jump3

        ldx #$FF
        txs

        lda #0
        sta BANKSELECT

        jsr unk_jsr1
        jsr unk_jsr2

        ldx #BANK::PRGA000
        lda #$13

        jsr BANK_SWAP

        bit PPUSTATUS

        lda $FF
        ora #$80
        sta $FF

        sta PPUCTRL

        cli

        jmp unk_jmp

        lda 7
        ldx #BANK::PRG8000
        jsr BANK_SWAP

        lda #$1D
        ldx #7

BANK_SWAP:
        stx $EE
        sta $F0,X
        txa
        ora $EF
        sta BANKSELECT
        lda $F0,X
        sta BANKDATA
        rts

        .literal "EARTH BOUND 1.00"
        .byte $00,$00,$00,$00,$03,$00,$01,$0F,$01,$00

        ;vectors
        ; NMI
        .word $F79F
        ; Reset
        .word Reset_Vector
        ; IRQ/BRK
        .word $FE13
