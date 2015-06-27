
_main:

;DACCOM1.c,11 :: 		void main() {
;DACCOM1.c,13 :: 		SET_UP();
	CALL       _SET_UP+0
;DACCOM1.c,17 :: 		UART1_Init(115200);
	MOVLW      1
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;DACCOM1.c,18 :: 		Delay_ms(200);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
;DACCOM1.c,21 :: 		while(1){
L_main1:
;DACCOM1.c,23 :: 		PORTC.B0 = CS1_DAC;
	BTFSC      _CS1_DAC+0, 0
	GOTO       L__main8
	BCF        PORTC+0, 0
	GOTO       L__main9
L__main8:
	BSF        PORTC+0, 0
L__main9:
;DACCOM1.c,24 :: 		PORTC.B1 = WR_DAC;
	BTFSC      _WR_DAC+0, 0
	GOTO       L__main10
	BCF        PORTC+0, 1
	GOTO       L__main11
L__main10:
	BSF        PORTC+0, 1
L__main11:
;DACCOM1.c,26 :: 		for (i = 0 ; i <255 ; i++ ) {
	CLRF       _i+0
	CLRF       _i+1
L_main3:
	MOVLW      0
	SUBWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      255
	SUBWF      _i+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;DACCOM1.c,27 :: 		PORTC = i;
	MOVF       _i+0, 0
	MOVWF      PORTC+0
;DACCOM1.c,26 :: 		for (i = 0 ; i <255 ; i++ ) {
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;DACCOM1.c,28 :: 		}
	GOTO       L_main3
L_main4:
;DACCOM1.c,30 :: 		if (i == 255){
	MOVLW      0
	XORWF      _i+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      255
	XORWF      _i+0, 0
L__main13:
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;DACCOM1.c,31 :: 		i = 0;
	CLRF       _i+0
	CLRF       _i+1
;DACCOM1.c,32 :: 		}
L_main6:
;DACCOM1.c,39 :: 		}
	GOTO       L_main1
;DACCOM1.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_SET_UP:

;DACCOM1.c,42 :: 		void SET_UP(){
;DACCOM1.c,43 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;DACCOM1.c,44 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;DACCOM1.c,45 :: 		i= 0;
	CLRF       _i+0
	CLRF       _i+1
;DACCOM1.c,47 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;DACCOM1.c,48 :: 		PORTD = 0;     //VALOR INICIAL
	CLRF       PORTD+0
;DACCOM1.c,50 :: 		TRISC.B7 = 0x01;               //RX
	BSF        TRISC+0, 7
;DACCOM1.c,51 :: 		PORTC.B7 = 0; //VALOR INICIAL 0
	BCF        PORTC+0, 7
;DACCOM1.c,53 :: 		TRISC.B0 = 0x00;
	BCF        TRISC+0, 0
;DACCOM1.c,54 :: 		TRISC.B1 = 0x00;             //PINC.B0,B1 COMO SALIDAS DIGITALTES
	BCF        TRISC+0, 1
;DACCOM1.c,55 :: 		PORTC.B0 = 0x00;
	BCF        PORTC+0, 0
;DACCOM1.c,56 :: 		PORTC.B1 = 0x00;
	BCF        PORTC+0, 1
;DACCOM1.c,59 :: 		}
L_end_SET_UP:
	RETURN
; end of _SET_UP
