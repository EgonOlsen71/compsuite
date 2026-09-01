*= $C800                

; ------------------------------------------------------------
; Entry point for BASIC: SYS 51200
; ------------------------------------------------------------
InstallTimerIRQ:
        sei
        lda $0314                   
        cmp #<TimerIRQ
        bne DoInstall
        lda $0315
        cmp #>TimerIRQ
        beq InstallDone             

DoInstall:
        lda $0314                  
        sta OldIRQVector
        lda $0315
        sta OldIRQVector+1

        lda #<TimerIRQ              
        sta $0314
        lda #>TimerIRQ
        sta $0315

        lda #$00
        sta Counter

InstallDone:
        cli
        rts

; ------------------------------------------------------------
; IRQ handler
; ------------------------------------------------------------
TimerIRQ:
        pha
        txa
        pha
        tya
        pha

        lda $0002
        beq ResetCounter

        inc Counter
        lda Counter
        cmp #200
        bne ChainIRQ

        lda #$00
        sta $0002
        sta Counter

        
        ldy $D3
        lda #$04                   
        sta ($D1),y
        iny
        lda #$0E                    
        sta ($D1),y
        iny
        lda #$06                  
        sta ($D1),y
        jmp ChainIRQ

ResetCounter:
        lda #$00
        sta Counter

ChainIRQ:
        pla
        tay
        pla
        tax
        pla
        jmp (OldIRQVector)

Counter:
        .byte 0

OldIRQVector:
        .word $EA31                 