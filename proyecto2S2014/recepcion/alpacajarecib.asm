
_main:

;alpacajarecib.c,14 :: 		void main() {
;alpacajarecib.c,16 :: 		ANSEL=ANSELH=0;///CONFIGURAMOS PINES COMO DIGITALTES
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;alpacajarecib.c,17 :: 		PORTA=0;
	CLRF       PORTA+0
;alpacajarecib.c,18 :: 		TRISA=0B1111;
	MOVLW      15
	MOVWF      TRISA+0
;alpacajarecib.c,19 :: 		TRISD=0;
	CLRF       TRISD+0
;alpacajarecib.c,20 :: 		PORTD=0;
	CLRF       PORTD+0
;alpacajarecib.c,21 :: 		UART1_Init(115200);
	MOVLW      4
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;alpacajarecib.c,22 :: 		Delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;alpacajarecib.c,23 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;alpacajarecib.c,24 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;alpacajarecib.c,25 :: 		i= 0;
	CLRF       _i+0
	CLRF       _i+1
;alpacajarecib.c,27 :: 		TRISD = 0x00;
	CLRF       TRISD+0
;alpacajarecib.c,28 :: 		PORTD = 0;     //VALOR INICIAL
	CLRF       PORTD+0
;alpacajarecib.c,30 :: 		TRISC.B7 = 0x01;               //RX
	BSF        TRISC+0, 7
;alpacajarecib.c,31 :: 		PORTC.B7 = 0; //VALOR INICIAL 0
	BCF        PORTC+0, 7
;alpacajarecib.c,33 :: 		TRISC.B0 = 0x00;
	BCF        TRISC+0, 0
;alpacajarecib.c,34 :: 		TRISC.B1 = 0x00;             //PINC.B0,B1 COMO SALIDAS DIGITALTES
	BCF        TRISC+0, 1
;alpacajarecib.c,35 :: 		PORTC.B0 = 0x00;
	BCF        PORTC+0, 0
;alpacajarecib.c,36 :: 		PORTC.B1 = 0x00;
	BCF        PORTC+0, 1
;alpacajarecib.c,38 :: 		while(1){
L_main1:
;alpacajarecib.c,40 :: 		PORTC.B0 = CS1_DAC;
	BTFSC      _CS1_DAC+0, 0
	GOTO       L__main167
	BCF        PORTC+0, 0
	GOTO       L__main168
L__main167:
	BSF        PORTC+0, 0
L__main168:
;alpacajarecib.c,41 :: 		PORTC.B1 = WR_DAC;
	BTFSC      _WR_DAC+0, 0
	GOTO       L__main169
	BCF        PORTC+0, 1
	GOTO       L__main170
L__main169:
	BSF        PORTC+0, 1
L__main170:
;alpacajarecib.c,43 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main3
;alpacajarecib.c,44 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,46 :: 		switch(receive){
	GOTO       L_main4
;alpacajarecib.c,47 :: 		case 'G' :{
L_main6:
;alpacajarecib.c,49 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main7
;alpacajarecib.c,50 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,52 :: 		switch(receive){
	GOTO       L_main8
;alpacajarecib.c,53 :: 		case '0' :{
L_main10:
;alpacajarecib.c,54 :: 		p1=0;
	CLRF       _p1+0
	CLRF       _p1+1
;alpacajarecib.c,55 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,57 :: 		case '1' :{
L_main11:
;alpacajarecib.c,58 :: 		p1=1;
	MOVLW      1
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,59 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,61 :: 		case '2' :{
L_main12:
;alpacajarecib.c,62 :: 		p1=2;
	MOVLW      2
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,63 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,65 :: 		case '3' :{
L_main13:
;alpacajarecib.c,66 :: 		p1=3;
	MOVLW      3
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,67 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,69 :: 		case '4' :{
L_main14:
;alpacajarecib.c,70 :: 		p1=4;
	MOVLW      4
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,71 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,73 :: 		case '5' :{
L_main15:
;alpacajarecib.c,74 :: 		p1=5;
	MOVLW      5
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,75 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,77 :: 		case '6' :{
L_main16:
;alpacajarecib.c,78 :: 		p1=6;
	MOVLW      6
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,79 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,81 :: 		case '7' :{
L_main17:
;alpacajarecib.c,82 :: 		p1=7;
	MOVLW      7
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,83 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,85 :: 		case '8' :{
L_main18:
;alpacajarecib.c,86 :: 		p1=8;
	MOVLW      8
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,87 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,89 :: 		case '9' :{
L_main19:
;alpacajarecib.c,90 :: 		p1=9;
	MOVLW      9
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,91 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,93 :: 		case 'A' :{
L_main20:
;alpacajarecib.c,94 :: 		p1=10;
	MOVLW      10
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,95 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,97 :: 		case 'B' :{
L_main21:
;alpacajarecib.c,98 :: 		p1=11;
	MOVLW      11
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,99 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,101 :: 		case 'C' :{
L_main22:
;alpacajarecib.c,102 :: 		p1=12;
	MOVLW      12
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,103 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,105 :: 		case 'D' :{
L_main23:
;alpacajarecib.c,106 :: 		p1=13;
	MOVLW      13
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,107 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,109 :: 		case 'E' :{
L_main24:
;alpacajarecib.c,110 :: 		p1=14;
	MOVLW      14
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,111 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,113 :: 		case 'F' :{
L_main25:
;alpacajarecib.c,114 :: 		p1=15;
	MOVLW      15
	MOVWF      _p1+0
	MOVLW      0
	MOVWF      _p1+1
;alpacajarecib.c,115 :: 		break;
	GOTO       L_main9
;alpacajarecib.c,117 :: 		}
L_main8:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main10
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main11
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main12
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main13
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main14
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main15
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main16
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main17
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main18
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main19
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main20
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main21
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main22
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main23
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main24
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main25
L_main9:
;alpacajarecib.c,118 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main26
;alpacajarecib.c,119 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,121 :: 		switch(receive){
	GOTO       L_main27
;alpacajarecib.c,122 :: 		case '0' :{
L_main29:
;alpacajarecib.c,123 :: 		p1=p1+0*16;
;alpacajarecib.c,124 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,126 :: 		case '1' :{
L_main30:
;alpacajarecib.c,127 :: 		p1=p1+1*16;
	MOVLW      16
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,128 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,130 :: 		case '2' :{
L_main31:
;alpacajarecib.c,131 :: 		p1=p1+2*16;
	MOVLW      32
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,132 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,134 :: 		case '3' :{
L_main32:
;alpacajarecib.c,135 :: 		p1=p1+3*16;
	MOVLW      48
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,136 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,138 :: 		case '4' :{
L_main33:
;alpacajarecib.c,139 :: 		p1=p1+4*16;
	MOVLW      64
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,140 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,142 :: 		case '5' :{
L_main34:
;alpacajarecib.c,143 :: 		p1=p1+5*16;
	MOVLW      80
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,144 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,146 :: 		case '6' :{
L_main35:
;alpacajarecib.c,147 :: 		p1=p1+6*16;
	MOVLW      96
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,148 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,150 :: 		case '7' :{
L_main36:
;alpacajarecib.c,151 :: 		p1=p1+7*16;
	MOVLW      112
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,152 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,154 :: 		case '8' :{
L_main37:
;alpacajarecib.c,155 :: 		p1=p1+8*16;
	MOVLW      128
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,156 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,158 :: 		case '9' :{
L_main38:
;alpacajarecib.c,159 :: 		p1=p1+9*16;
	MOVLW      144
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,160 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,162 :: 		case 'A' :{
L_main39:
;alpacajarecib.c,163 :: 		p1=p1+10*16;
	MOVLW      160
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,164 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,166 :: 		case 'B' :{
L_main40:
;alpacajarecib.c,167 :: 		p1=p1+11*16;
	MOVLW      176
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,168 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,170 :: 		case 'C' :{
L_main41:
;alpacajarecib.c,171 :: 		p1=p1+12*16;
	MOVLW      192
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,172 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,174 :: 		case 'D' :{
L_main42:
;alpacajarecib.c,175 :: 		p1=p1+13*16;
	MOVLW      208
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,176 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,178 :: 		case 'E' :{
L_main43:
;alpacajarecib.c,179 :: 		p1=p1+14*16;
	MOVLW      224
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,180 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,182 :: 		case 'F' :{
L_main44:
;alpacajarecib.c,183 :: 		p1=p1+15*16;
	MOVLW      240
	ADDWF      _p1+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p1+1, 1
;alpacajarecib.c,184 :: 		break;
	GOTO       L_main28
;alpacajarecib.c,186 :: 		}
L_main27:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main29
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main30
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main31
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main32
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main33
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main34
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main35
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main36
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main37
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main38
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main39
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main40
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main41
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main42
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main43
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main44
L_main28:
;alpacajarecib.c,187 :: 		}
L_main26:
;alpacajarecib.c,188 :: 		}
L_main7:
;alpacajarecib.c,189 :: 		break;
	GOTO       L_main5
;alpacajarecib.c,193 :: 		case 'H' :{//CANAL 2
L_main45:
;alpacajarecib.c,195 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main46
;alpacajarecib.c,196 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,198 :: 		switch(receive){
	GOTO       L_main47
;alpacajarecib.c,199 :: 		case '0' :{
L_main49:
;alpacajarecib.c,200 :: 		p2=0;
	CLRF       _p2+0
	CLRF       _p2+1
;alpacajarecib.c,201 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,203 :: 		case '1' :{
L_main50:
;alpacajarecib.c,204 :: 		p2=1;
	MOVLW      1
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,205 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,207 :: 		case '2' :{
L_main51:
;alpacajarecib.c,208 :: 		p2=2;
	MOVLW      2
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,209 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,211 :: 		case '3' :{
L_main52:
;alpacajarecib.c,212 :: 		p2=3;
	MOVLW      3
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,213 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,215 :: 		case '4' :{
L_main53:
;alpacajarecib.c,216 :: 		p2=4;
	MOVLW      4
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,217 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,219 :: 		case '5' :{
L_main54:
;alpacajarecib.c,220 :: 		p2=5;
	MOVLW      5
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,221 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,223 :: 		case '6' :{
L_main55:
;alpacajarecib.c,224 :: 		p2=6;
	MOVLW      6
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,225 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,227 :: 		case '7' :{
L_main56:
;alpacajarecib.c,228 :: 		p2=7;
	MOVLW      7
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,229 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,231 :: 		case '8' :{
L_main57:
;alpacajarecib.c,232 :: 		p2=8;
	MOVLW      8
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,233 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,235 :: 		case '9' :{
L_main58:
;alpacajarecib.c,236 :: 		p2=9;
	MOVLW      9
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,237 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,239 :: 		case 'A' :{
L_main59:
;alpacajarecib.c,240 :: 		p2=10;
	MOVLW      10
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,241 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,243 :: 		case 'B' :{
L_main60:
;alpacajarecib.c,244 :: 		p2=11;
	MOVLW      11
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,245 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,247 :: 		case 'C' :{
L_main61:
;alpacajarecib.c,248 :: 		p2=12;
	MOVLW      12
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,249 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,251 :: 		case 'D' :{
L_main62:
;alpacajarecib.c,252 :: 		p2=13;
	MOVLW      13
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,253 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,255 :: 		case 'E' :{
L_main63:
;alpacajarecib.c,256 :: 		p2=14;
	MOVLW      14
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,257 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,259 :: 		case 'F' :{
L_main64:
;alpacajarecib.c,260 :: 		p2=15;
	MOVLW      15
	MOVWF      _p2+0
	MOVLW      0
	MOVWF      _p2+1
;alpacajarecib.c,261 :: 		break;
	GOTO       L_main48
;alpacajarecib.c,263 :: 		}
L_main47:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main49
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main50
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main51
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main52
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main53
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main54
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main55
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main56
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main57
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main58
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main59
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main60
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main61
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main62
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main63
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main64
L_main48:
;alpacajarecib.c,264 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main65
;alpacajarecib.c,265 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,267 :: 		switch(receive){
	GOTO       L_main66
;alpacajarecib.c,268 :: 		case '0' :{
L_main68:
;alpacajarecib.c,269 :: 		p2=p2+0*16;
;alpacajarecib.c,270 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,272 :: 		case '1' :{
L_main69:
;alpacajarecib.c,273 :: 		p2=p2+1*16;
	MOVLW      16
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,274 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,276 :: 		case '2' :{
L_main70:
;alpacajarecib.c,277 :: 		p2=p2+2*16;
	MOVLW      32
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,278 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,280 :: 		case '3' :{
L_main71:
;alpacajarecib.c,281 :: 		p2=p2+3*16;
	MOVLW      48
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,282 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,284 :: 		case '4' :{
L_main72:
;alpacajarecib.c,285 :: 		p2=p2+4*16;
	MOVLW      64
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,286 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,288 :: 		case '5' :{
L_main73:
;alpacajarecib.c,289 :: 		p2=p2+5*16;
	MOVLW      80
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,290 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,292 :: 		case '6' :{
L_main74:
;alpacajarecib.c,293 :: 		p2=p2+6*16;
	MOVLW      96
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,294 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,296 :: 		case '7' :{
L_main75:
;alpacajarecib.c,297 :: 		p2=p2+7*16;
	MOVLW      112
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,298 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,300 :: 		case '8' :{
L_main76:
;alpacajarecib.c,301 :: 		p2=p2+8*16;
	MOVLW      128
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,302 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,304 :: 		case '9' :{
L_main77:
;alpacajarecib.c,305 :: 		p2=p2+9*16;
	MOVLW      144
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,306 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,308 :: 		case 'A' :{
L_main78:
;alpacajarecib.c,309 :: 		p2=p2+10*16;
	MOVLW      160
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,310 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,312 :: 		case 'B' :{
L_main79:
;alpacajarecib.c,313 :: 		p2=p2+11*16;
	MOVLW      176
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,314 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,316 :: 		case 'C' :{
L_main80:
;alpacajarecib.c,317 :: 		p2=p2+12*16;
	MOVLW      192
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,318 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,320 :: 		case 'D' :{
L_main81:
;alpacajarecib.c,321 :: 		p2=p2+13*16;
	MOVLW      208
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,322 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,324 :: 		case 'E' :{
L_main82:
;alpacajarecib.c,325 :: 		p2=p2+14*16;
	MOVLW      224
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,326 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,328 :: 		case 'F' :{
L_main83:
;alpacajarecib.c,329 :: 		p2=p2+15*16;
	MOVLW      240
	ADDWF      _p2+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p2+1, 1
;alpacajarecib.c,330 :: 		break;
	GOTO       L_main67
;alpacajarecib.c,332 :: 		}
L_main66:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main68
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main69
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main70
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main71
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main72
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main73
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main74
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main75
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main76
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main77
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main78
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main79
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main80
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main81
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main82
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main83
L_main67:
;alpacajarecib.c,333 :: 		}
L_main65:
;alpacajarecib.c,334 :: 		}
L_main46:
;alpacajarecib.c,335 :: 		break;
	GOTO       L_main5
;alpacajarecib.c,339 :: 		case 'I' :{//EMPIEZA CANAL 3
L_main84:
;alpacajarecib.c,341 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main85
;alpacajarecib.c,342 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,344 :: 		switch(receive){
	GOTO       L_main86
;alpacajarecib.c,345 :: 		case '0' :{
L_main88:
;alpacajarecib.c,346 :: 		p3=0;
	CLRF       _p3+0
	CLRF       _p3+1
;alpacajarecib.c,347 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,349 :: 		case '1' :{
L_main89:
;alpacajarecib.c,350 :: 		p3=1;
	MOVLW      1
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,351 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,353 :: 		case '2' :{
L_main90:
;alpacajarecib.c,354 :: 		p3=2;
	MOVLW      2
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,355 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,357 :: 		case '3' :{
L_main91:
;alpacajarecib.c,358 :: 		p3=3;
	MOVLW      3
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,359 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,361 :: 		case '4' :{
L_main92:
;alpacajarecib.c,362 :: 		p3=4;
	MOVLW      4
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,363 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,365 :: 		case '5' :{
L_main93:
;alpacajarecib.c,366 :: 		p3=5;
	MOVLW      5
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,367 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,369 :: 		case '6' :{
L_main94:
;alpacajarecib.c,370 :: 		p3=6;
	MOVLW      6
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,371 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,373 :: 		case '7' :{
L_main95:
;alpacajarecib.c,374 :: 		p3=7;
	MOVLW      7
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,375 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,377 :: 		case '8' :{
L_main96:
;alpacajarecib.c,378 :: 		p3=8;
	MOVLW      8
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,379 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,381 :: 		case '9' :{
L_main97:
;alpacajarecib.c,382 :: 		p3=9;
	MOVLW      9
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,383 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,385 :: 		case 'A' :{
L_main98:
;alpacajarecib.c,386 :: 		p3=10;
	MOVLW      10
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,387 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,389 :: 		case 'B' :{
L_main99:
;alpacajarecib.c,390 :: 		p3=11;
	MOVLW      11
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,391 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,393 :: 		case 'C' :{
L_main100:
;alpacajarecib.c,394 :: 		p3=12;
	MOVLW      12
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,395 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,397 :: 		case 'D' :{
L_main101:
;alpacajarecib.c,398 :: 		p3=13;
	MOVLW      13
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,399 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,401 :: 		case 'E' :{
L_main102:
;alpacajarecib.c,402 :: 		p3=14;
	MOVLW      14
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,403 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,405 :: 		case 'F' :{
L_main103:
;alpacajarecib.c,406 :: 		p3=15;
	MOVLW      15
	MOVWF      _p3+0
	MOVLW      0
	MOVWF      _p3+1
;alpacajarecib.c,407 :: 		break;
	GOTO       L_main87
;alpacajarecib.c,409 :: 		}
L_main86:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main88
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main89
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main90
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main91
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main92
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main93
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main94
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main95
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main96
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main97
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main98
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main99
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main100
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main101
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main102
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main103
L_main87:
;alpacajarecib.c,410 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main104
;alpacajarecib.c,411 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,413 :: 		switch(receive){
	GOTO       L_main105
;alpacajarecib.c,414 :: 		case '0' :{
L_main107:
;alpacajarecib.c,415 :: 		p3=p3+0*16;
;alpacajarecib.c,416 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,418 :: 		case '1' :{
L_main108:
;alpacajarecib.c,419 :: 		p3=p3+1*16;
	MOVLW      16
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,420 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,422 :: 		case '2' :{
L_main109:
;alpacajarecib.c,423 :: 		p3=p3+2*16;
	MOVLW      32
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,424 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,426 :: 		case '3' :{
L_main110:
;alpacajarecib.c,427 :: 		p3=p3+3*16;
	MOVLW      48
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,428 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,430 :: 		case '4' :{
L_main111:
;alpacajarecib.c,431 :: 		p3=p3+4*16;
	MOVLW      64
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,432 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,434 :: 		case '5' :{
L_main112:
;alpacajarecib.c,435 :: 		p3=p3+5*16;
	MOVLW      80
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,436 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,438 :: 		case '6' :{
L_main113:
;alpacajarecib.c,439 :: 		p3=p3+6*16;
	MOVLW      96
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,440 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,442 :: 		case '7' :{
L_main114:
;alpacajarecib.c,443 :: 		p3=p3+7*16;
	MOVLW      112
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,444 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,446 :: 		case '8' :{
L_main115:
;alpacajarecib.c,447 :: 		p3=p3+8*16;
	MOVLW      128
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,448 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,450 :: 		case '9' :{
L_main116:
;alpacajarecib.c,451 :: 		p3=p3+9*16;
	MOVLW      144
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,452 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,454 :: 		case 'A' :{
L_main117:
;alpacajarecib.c,455 :: 		p3=p3+10*16;
	MOVLW      160
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,456 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,458 :: 		case 'B' :{
L_main118:
;alpacajarecib.c,459 :: 		p3=p3+11*16;
	MOVLW      176
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,460 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,462 :: 		case 'C' :{
L_main119:
;alpacajarecib.c,463 :: 		p3=p3+12*16;
	MOVLW      192
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,464 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,466 :: 		case 'D' :{
L_main120:
;alpacajarecib.c,467 :: 		p3=p3+13*16;
	MOVLW      208
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,468 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,470 :: 		case 'E' :{
L_main121:
;alpacajarecib.c,471 :: 		p3=p3+14*16;
	MOVLW      224
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,472 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,474 :: 		case 'F' :{
L_main122:
;alpacajarecib.c,475 :: 		p3=p3+15*16;
	MOVLW      240
	ADDWF      _p3+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p3+1, 1
;alpacajarecib.c,476 :: 		break;
	GOTO       L_main106
;alpacajarecib.c,478 :: 		}
L_main105:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main107
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main108
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main109
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main110
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main111
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main112
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main113
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main114
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main115
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main116
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main117
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main118
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main119
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main120
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main121
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main122
L_main106:
;alpacajarecib.c,479 :: 		}
L_main104:
;alpacajarecib.c,480 :: 		}
L_main85:
;alpacajarecib.c,481 :: 		break;
	GOTO       L_main5
;alpacajarecib.c,484 :: 		case 'G' :{
L_main123:
;alpacajarecib.c,486 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main124
;alpacajarecib.c,487 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,489 :: 		switch(receive){
	GOTO       L_main125
;alpacajarecib.c,490 :: 		case '0' :{
L_main127:
;alpacajarecib.c,491 :: 		p4=0;
	CLRF       _p4+0
	CLRF       _p4+1
;alpacajarecib.c,492 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,494 :: 		case '1' :{
L_main128:
;alpacajarecib.c,495 :: 		p4=1;
	MOVLW      1
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,496 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,498 :: 		case '2' :{
L_main129:
;alpacajarecib.c,499 :: 		p4=2;
	MOVLW      2
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,500 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,502 :: 		case '3' :{
L_main130:
;alpacajarecib.c,503 :: 		p4=3;
	MOVLW      3
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,504 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,506 :: 		case '4' :{
L_main131:
;alpacajarecib.c,507 :: 		p4=4;
	MOVLW      4
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,508 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,510 :: 		case '5' :{
L_main132:
;alpacajarecib.c,511 :: 		p4=5;
	MOVLW      5
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,512 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,514 :: 		case '6' :{
L_main133:
;alpacajarecib.c,515 :: 		p4=6;
	MOVLW      6
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,516 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,518 :: 		case '7' :{
L_main134:
;alpacajarecib.c,519 :: 		p4=7;
	MOVLW      7
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,520 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,522 :: 		case '8' :{
L_main135:
;alpacajarecib.c,523 :: 		p4=8;
	MOVLW      8
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,524 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,526 :: 		case '9' :{
L_main136:
;alpacajarecib.c,527 :: 		p4=9;
	MOVLW      9
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,528 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,530 :: 		case 'A' :{
L_main137:
;alpacajarecib.c,531 :: 		p4=10;
	MOVLW      10
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,532 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,534 :: 		case 'B' :{
L_main138:
;alpacajarecib.c,535 :: 		p4=11;
	MOVLW      11
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,536 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,538 :: 		case 'C' :{
L_main139:
;alpacajarecib.c,539 :: 		p4=12;
	MOVLW      12
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,540 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,542 :: 		case 'D' :{
L_main140:
;alpacajarecib.c,543 :: 		p4=13;
	MOVLW      13
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,544 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,546 :: 		case 'E' :{
L_main141:
;alpacajarecib.c,547 :: 		p4=14;
	MOVLW      14
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,548 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,550 :: 		case 'F' :{
L_main142:
;alpacajarecib.c,551 :: 		p4=15;
	MOVLW      15
	MOVWF      _p4+0
	MOVLW      0
	MOVWF      _p4+1
;alpacajarecib.c,552 :: 		break;
	GOTO       L_main126
;alpacajarecib.c,554 :: 		}
L_main125:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main127
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main128
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main129
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main130
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main131
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main132
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main133
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main134
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main135
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main136
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main137
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main138
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main139
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main140
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main141
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main142
L_main126:
;alpacajarecib.c,555 :: 		if (UART1_Data_Ready() == 1) {
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main143
;alpacajarecib.c,556 :: 		receive = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_receive_L0+0
;alpacajarecib.c,558 :: 		switch(receive){
	GOTO       L_main144
;alpacajarecib.c,559 :: 		case '0' :{
L_main146:
;alpacajarecib.c,560 :: 		p4=p4+0*16;
;alpacajarecib.c,561 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,563 :: 		case '1' :{
L_main147:
;alpacajarecib.c,564 :: 		p4=p4+1*16;
	MOVLW      16
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,565 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,567 :: 		case '2' :{
L_main148:
;alpacajarecib.c,568 :: 		p4=p4+2*16;
	MOVLW      32
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,569 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,571 :: 		case '3' :{
L_main149:
;alpacajarecib.c,572 :: 		p4=p4+3*16;
	MOVLW      48
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,573 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,575 :: 		case '4' :{
L_main150:
;alpacajarecib.c,576 :: 		p4=p4+4*16;
	MOVLW      64
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,577 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,579 :: 		case '5' :{
L_main151:
;alpacajarecib.c,580 :: 		p4=p4+5*16;
	MOVLW      80
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,581 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,583 :: 		case '6' :{
L_main152:
;alpacajarecib.c,584 :: 		p4=p4+6*16;
	MOVLW      96
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,585 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,587 :: 		case '7' :{
L_main153:
;alpacajarecib.c,588 :: 		p4=p4+7*16;
	MOVLW      112
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,589 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,591 :: 		case '8' :{
L_main154:
;alpacajarecib.c,592 :: 		p4=p4+8*16;
	MOVLW      128
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,593 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,595 :: 		case '9' :{
L_main155:
;alpacajarecib.c,596 :: 		p4=p4+9*16;
	MOVLW      144
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,597 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,599 :: 		case 'A' :{
L_main156:
;alpacajarecib.c,600 :: 		p4=p4+10*16;
	MOVLW      160
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,601 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,603 :: 		case 'B' :{
L_main157:
;alpacajarecib.c,604 :: 		p4=p4+11*16;
	MOVLW      176
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,605 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,607 :: 		case 'C' :{
L_main158:
;alpacajarecib.c,608 :: 		p4=p4+12*16;
	MOVLW      192
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,609 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,611 :: 		case 'D' :{
L_main159:
;alpacajarecib.c,612 :: 		p4=p4+13*16;
	MOVLW      208
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,613 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,615 :: 		case 'E' :{
L_main160:
;alpacajarecib.c,616 :: 		p4=p4+14*16;
	MOVLW      224
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,617 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,619 :: 		case 'F' :{
L_main161:
;alpacajarecib.c,620 :: 		p4=p4+15*16;
	MOVLW      240
	ADDWF      _p4+0, 1
	BTFSC      STATUS+0, 0
	INCF       _p4+1, 1
;alpacajarecib.c,621 :: 		break;
	GOTO       L_main145
;alpacajarecib.c,623 :: 		}
L_main144:
	MOVF       main_receive_L0+0, 0
	XORLW      48
	BTFSC      STATUS+0, 2
	GOTO       L_main146
	MOVF       main_receive_L0+0, 0
	XORLW      49
	BTFSC      STATUS+0, 2
	GOTO       L_main147
	MOVF       main_receive_L0+0, 0
	XORLW      50
	BTFSC      STATUS+0, 2
	GOTO       L_main148
	MOVF       main_receive_L0+0, 0
	XORLW      51
	BTFSC      STATUS+0, 2
	GOTO       L_main149
	MOVF       main_receive_L0+0, 0
	XORLW      52
	BTFSC      STATUS+0, 2
	GOTO       L_main150
	MOVF       main_receive_L0+0, 0
	XORLW      53
	BTFSC      STATUS+0, 2
	GOTO       L_main151
	MOVF       main_receive_L0+0, 0
	XORLW      54
	BTFSC      STATUS+0, 2
	GOTO       L_main152
	MOVF       main_receive_L0+0, 0
	XORLW      55
	BTFSC      STATUS+0, 2
	GOTO       L_main153
	MOVF       main_receive_L0+0, 0
	XORLW      56
	BTFSC      STATUS+0, 2
	GOTO       L_main154
	MOVF       main_receive_L0+0, 0
	XORLW      57
	BTFSC      STATUS+0, 2
	GOTO       L_main155
	MOVF       main_receive_L0+0, 0
	XORLW      65
	BTFSC      STATUS+0, 2
	GOTO       L_main156
	MOVF       main_receive_L0+0, 0
	XORLW      66
	BTFSC      STATUS+0, 2
	GOTO       L_main157
	MOVF       main_receive_L0+0, 0
	XORLW      67
	BTFSC      STATUS+0, 2
	GOTO       L_main158
	MOVF       main_receive_L0+0, 0
	XORLW      68
	BTFSC      STATUS+0, 2
	GOTO       L_main159
	MOVF       main_receive_L0+0, 0
	XORLW      69
	BTFSC      STATUS+0, 2
	GOTO       L_main160
	MOVF       main_receive_L0+0, 0
	XORLW      70
	BTFSC      STATUS+0, 2
	GOTO       L_main161
L_main145:
;alpacajarecib.c,624 :: 		}
L_main143:
;alpacajarecib.c,625 :: 		}
L_main124:
;alpacajarecib.c,626 :: 		break;
	GOTO       L_main5
;alpacajarecib.c,629 :: 		}
L_main4:
	MOVF       main_receive_L0+0, 0
	XORLW      71
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVF       main_receive_L0+0, 0
	XORLW      72
	BTFSC      STATUS+0, 2
	GOTO       L_main45
	MOVF       main_receive_L0+0, 0
	XORLW      73
	BTFSC      STATUS+0, 2
	GOTO       L_main84
	MOVF       main_receive_L0+0, 0
	XORLW      71
	BTFSC      STATUS+0, 2
	GOTO       L_main123
L_main5:
;alpacajarecib.c,631 :: 		}//FIN DE RECUPERACION DE DATOS =)
L_main3:
;alpacajarecib.c,634 :: 		if(porta.b0==1){
	BTFSS      PORTA+0, 0
	GOTO       L_main162
;alpacajarecib.c,635 :: 		portd=p1;
	MOVF       _p1+0, 0
	MOVWF      PORTD+0
;alpacajarecib.c,636 :: 		}
L_main162:
;alpacajarecib.c,637 :: 		if(porta.b1==1){
	BTFSS      PORTA+0, 1
	GOTO       L_main163
;alpacajarecib.c,638 :: 		portd=p2;
	MOVF       _p2+0, 0
	MOVWF      PORTD+0
;alpacajarecib.c,639 :: 		}
L_main163:
;alpacajarecib.c,640 :: 		if(porta.b2==1){
	BTFSS      PORTA+0, 2
	GOTO       L_main164
;alpacajarecib.c,641 :: 		portd=p3;
	MOVF       _p3+0, 0
	MOVWF      PORTD+0
;alpacajarecib.c,642 :: 		}
L_main164:
;alpacajarecib.c,643 :: 		if(porta.b3==1){
	BTFSS      PORTA+0, 3
	GOTO       L_main165
;alpacajarecib.c,644 :: 		portd=p4;
	MOVF       _p4+0, 0
	MOVWF      PORTD+0
;alpacajarecib.c,645 :: 		}
L_main165:
;alpacajarecib.c,648 :: 		}
	GOTO       L_main1
;alpacajarecib.c,649 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
