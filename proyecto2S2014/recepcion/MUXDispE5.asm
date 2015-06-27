
_mask:

;MUXDispE5.c,2 :: 		unsigned short mask(unsigned short num) {
;MUXDispE5.c,3 :: 		switch (num) {
	GOTO       L_mask0
;MUXDispE5.c,4 :: 		case 0 : return ;
L_mask2:
	GOTO       L_end_mask
;MUXDispE5.c,5 :: 		case 1 : return 0x06;
L_mask3:
	MOVLW      6
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,6 :: 		case 2 : return 0x5B;
L_mask4:
	MOVLW      91
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,7 :: 		case 3 : return 0x4F;
L_mask5:
	MOVLW      79
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,8 :: 		case 4 : return 0x66;
L_mask6:
	MOVLW      102
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,9 :: 		case 5 : return 0x6D;
L_mask7:
	MOVLW      109
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,10 :: 		case 6 : return 0x7D;
L_mask8:
	MOVLW      125
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,11 :: 		case 7 : return 0x07;
L_mask9:
	MOVLW      7
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,12 :: 		case 8 : return 0x7F;
L_mask10:
	MOVLW      127
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,13 :: 		case 9 : return 0x6F;
L_mask11:
	MOVLW      111
	MOVWF      R0+0
	GOTO       L_end_mask
;MUXDispE5.c,14 :: 		}
L_mask0:
	MOVF       FARG_mask_num+0, 0
	XORLW      0
	BTFSC      STATUS+0, 2
	GOTO       L_mask2
	MOVF       FARG_mask_num+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_mask3
	MOVF       FARG_mask_num+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_mask4
	MOVF       FARG_mask_num+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_mask5
	MOVF       FARG_mask_num+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_mask6
	MOVF       FARG_mask_num+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_mask7
	MOVF       FARG_mask_num+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_mask8
	MOVF       FARG_mask_num+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_mask9
	MOVF       FARG_mask_num+0, 0
	XORLW      8
	BTFSC      STATUS+0, 2
	GOTO       L_mask10
	MOVF       FARG_mask_num+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_mask11
;MUXDispE5.c,15 :: 		}
L_end_mask:
	RETURN
; end of _mask

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;MUXDispE5.c,25 :: 		void interrupt() {
;MUXDispE5.c,26 :: 		if (digit_no == 0) {
	MOVF       _digit_no+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt12
;MUXDispE5.c,28 :: 		PORTA = 0;       // Apagar ambos visualizadores
	CLRF       PORTA+0
;MUXDispE5.c,29 :: 		PORTB = digit1;  // Colocar máscara para visualizar unidades en el
	MOVF       _digit1+0, 0
	MOVWF      PORTB+0
;MUXDispE5.c,32 :: 		PORTA = 1;       // Encender el visualizador para las unidades (LSD)
	MOVLW      1
	MOVWF      PORTA+0
;MUXDispE5.c,33 :: 		digit_no = 1;
	MOVLW      1
	MOVWF      _digit_no+0
;MUXDispE5.c,34 :: 		}else{
	GOTO       L_interrupt13
L_interrupt12:
;MUXDispE5.c,35 :: 		PORTA = 0;       // Apagar ambos visualizadores
	CLRF       PORTA+0
;MUXDispE5.c,36 :: 		PORTB = digit10; // Colocar máscara para visualizar decenas en el
	MOVF       _digit10+0, 0
	MOVWF      PORTB+0
;MUXDispE5.c,39 :: 		PORTA = 2;       // Encender el visualizador para las decenas (MSD)
	MOVLW      2
	MOVWF      PORTA+0
;MUXDispE5.c,40 :: 		digit_no = 0;
	CLRF       _digit_no+0
;MUXDispE5.c,41 :: 		}
L_interrupt13:
;MUXDispE5.c,43 :: 		TMR0 = 0;          // Reiniciar el contador TMRO
	CLRF       TMR0+0
;MUXDispE5.c,44 :: 		INTCON = 0x20;     // Bit T0IF=0, T0IE=1  //comenzar la siguiente rutina.
	MOVLW      32
	MOVWF      INTCON+0
;MUXDispE5.c,45 :: 		}
L_end_interrupt:
L__interrupt38:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;MUXDispE5.c,49 :: 		void main() {
;MUXDispE5.c,50 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;MUXDispE5.c,51 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;MUXDispE5.c,53 :: 		TRISA = 0;           // TODOS LOS PINES EN EL PORTA COMO SALIDAS DIGITALES
	CLRF       TRISA+0
;MUXDispE5.c,54 :: 		PORTA = 0;  //VALOR INICIAL PARA PORTA
	CLRF       PORTA+0
;MUXDispE5.c,56 :: 		TRISB = 0B10000000; //TODOS LOS PINES EN EL PUERTOB COMO SALIDAS DIGITALES
	MOVLW      128
	MOVWF      TRISB+0
;MUXDispE5.c,57 :: 		PORTB = 0; //VALOR INICIAL PARA PORTB
	CLRF       PORTB+0
;MUXDispE5.c,59 :: 		TRISD.B2 = 1;
	BSF        TRISD+0, 2
;MUXDispE5.c,60 :: 		PORTD.B2 = 0;
	BCF        PORTD+0, 2
;MUXDispE5.c,62 :: 		OPTION_REG = 0B10000000;  //CONFIGURANDO TMR0 0X80   //preescaler 1:2
	MOVLW      128
	MOVWF      OPTION_REG+0
;MUXDispE5.c,63 :: 		TMR0 =  0;     //REINICIANDO TEMPORIZADfOR
	CLRF       TMR0+0
;MUXDispE5.c,64 :: 		INTCON = 0B10100000;  //HABILITAR INTERRUPCION POR DESBORDAMIENTO EN TMRO Y GIE=1  0xA0
	MOVLW      160
	MOVWF      INTCON+0
;MUXDispE5.c,65 :: 		UART1_INIT(300);
	MOVLW      207
	MOVWF      SPBRG+0
	BCF        TXSTA+0, 2
	CALL       _UART1_Init+0
;MUXDispE5.c,66 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main14:
	DECFSZ     R13+0, 1
	GOTO       L_main14
	DECFSZ     R12+0, 1
	GOTO       L_main14
	NOP
	NOP
;MUXDispE5.c,68 :: 		while(1){
L_main15:
;MUXDispE5.c,70 :: 		if (Uart1_Data_Ready()==1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main17
;MUXDispE5.c,71 :: 		digitU = UART1_READ();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _digitU+0
;MUXDispE5.c,73 :: 		switch (digitU){
	GOTO       L_main18
;MUXDispE5.c,74 :: 		case '0': {t=48; break;}
L_main20:
	MOVLW      48
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,75 :: 		case '1': {t=49; break;}
L_main21:
	MOVLW      49
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,76 :: 		case '2': {t=50; break;}
L_main22:
	MOVLW      50
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,77 :: 		case '3': {t=51; break;}
L_main23:
	MOVLW      51
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,78 :: 		case '4': {t=52; break;}
L_main24:
	MOVLW      52
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,79 :: 		case '5': {t=53; break;}
L_main25:
	MOVLW      53
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,80 :: 		case '6': {t=54; break;}
L_main26:
	MOVLW      54
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,81 :: 		case '7': {t=55; break;}
L_main27:
	MOVLW      55
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,82 :: 		case '8': {t=56; break;}
L_main28:
	MOVLW      56
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,83 :: 		case '9': {t=57; break;}
L_main29:
	MOVLW      57
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,84 :: 		case '+': {t=43; break;}
L_main30:
	MOVLW      43
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,85 :: 		case '-': {t=45; break;}
L_main31:
	MOVLW      45
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,86 :: 		case '*': {t=42; break;}
L_main32:
	MOVLW      42
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,87 :: 		case '/': {t=47; break;}
L_main33:
	MOVLW      47
	MOVWF      _t+0
	MOVLW      0
	MOVWF      _t+1
	GOTO       L_main19
;MUXDispE5.c,88 :: 		}
L_main18:
	MOVF       _digitU+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       _digitU+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       _digitU+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       _digitU+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       _digitU+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       _digitU+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main25
	MOVF       _digitU+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main26
	MOVF       _digitU+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main27
	MOVF       _digitU+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main28
	MOVF       _digitU+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       _digitU+0, 0
	XORLW      43
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       _digitU+0, 0
	XORLW      45
	BTFSC      STATUS+0, 2
	GOTO       L_main31
	MOVF       _digitU+0, 0
	XORLW      42
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       _digitU+0, 0
	XORLW      47
	BTFSC      STATUS+0, 2
	GOTO       L_main33
L_main19:
;MUXDispE5.c,89 :: 		}
L_main17:
;MUXDispE5.c,90 :: 		digit = t % 10u;  //OPERACION PARA EXTRAER LAS UNIDADES
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _t+0, 0
	MOVWF      R0+0
	MOVF       _t+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _digit+0
;MUXDispE5.c,91 :: 		digit1 = mask(digit); //EN DIGT1 ESTA LA MASCARA PARA MOSTRAR LAS UNIDADES
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _digit1+0
;MUXDispE5.c,92 :: 		digit = (t / 10u) % 10u;  //OPERACION PARA EXTRAER LAS DECENAS
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	MOVF       _t+0, 0
	MOVWF      R0+0
	MOVF       _t+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	CLRF       R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      _digit+0
;MUXDispE5.c,93 :: 		digit10 = mask(digit); //EN DIGIT10 ESTA LA MASCARA PARA MOSTRAR LAS DECENAS
	MOVF       R0+0, 0
	MOVWF      FARG_mask_num+0
	CALL       _mask+0
	MOVF       R0+0, 0
	MOVWF      _digit10+0
;MUXDispE5.c,94 :: 		delay_ms(1);
	MOVLW      2
	MOVWF      R12+0
	MOVLW      75
	MOVWF      R13+0
L_main34:
	DECFSZ     R13+0, 1
	GOTO       L_main34
	DECFSZ     R12+0, 1
	GOTO       L_main34
;MUXDispE5.c,96 :: 		if (PORTD.B2 == 1){
	BTFSS      PORTD+0, 2
	GOTO       L_main35
;MUXDispE5.c,97 :: 		Uart1_write(50);//envio 2
	MOVLW      50
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;MUXDispE5.c,98 :: 		}
L_main35:
;MUXDispE5.c,101 :: 		}
	GOTO       L_main15
;MUXDispE5.c,102 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
