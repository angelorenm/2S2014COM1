
_main:

;alpacaja.c,4 :: 		void main() {
;alpacaja.c,5 :: 		int i=0;//variable del for
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
	CLRF       main_var_L0+0
	CLRF       main_var_L0+1
	CLRF       main_cont_L0+0
	CLRF       main_cont_L0+1
;alpacaja.c,10 :: 		ansel=anselh=0;
	CLRF       ANSELH+0
	CLRF       ANSEL+0
;alpacaja.c,11 :: 		trisb=0;
	CLRF       TRISB+0
;alpacaja.c,12 :: 		portb=0;
	CLRF       PORTB+0
;alpacaja.c,13 :: 		Chip_Select = 1;                       // Deselect DAC
	BSF        RC0_bit+0, 0
;alpacaja.c,14 :: 		Chip_Select_Direction = 0;             // Set CS# pin as Output
	BCF        TRISC0_bit+0, 0
;alpacaja.c,15 :: 		SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_HIGH_2_LOW);
	CLRF       FARG_SPI1_Init_Advanced_master+0
	CLRF       FARG_SPI1_Init_Advanced_data_sample+0
	CLRF       FARG_SPI1_Init_Advanced_clock_idle+0
	CLRF       FARG_SPI1_Init_Advanced_transmit_edge+0
	CALL       _SPI1_Init_Advanced+0
;alpacaja.c,16 :: 		UART1_Init(9600);
	MOVLW      129
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;alpacaja.c,17 :: 		Delay_ms(100);//esperando para que uart se estabilice
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
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
;alpacaja.c,22 :: 		vinex:
___main_vinex:
;alpacaja.c,23 :: 		cont=cont++;
	INCF       main_cont_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_cont_L0+1, 1
;alpacaja.c,24 :: 		for (i=0;i<50;i++){
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main1:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main12
	MOVLW      50
	SUBWF      main_i_L0+0, 0
L__main12:
	BTFSC      STATUS+0, 0
	GOTO       L_main2
;alpacaja.c,25 :: 		switch (cont){
	GOTO       L_main4
;alpacaja.c,28 :: 		case 1:
L_main6:
;alpacaja.c,29 :: 		Chip_Select = 0;                       // seleccionamos adc
	BCF        RC0_bit+0, 0
;alpacaja.c,31 :: 		SPI1_Write(temp);// envio de configuracion
	MOVLW      159
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;alpacaja.c,33 :: 		var = SPI1_Read(buff);
	MOVF       main_buff_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,34 :: 		Chip_Select = 1;                       // Deseleccionamos adc
	BSF        RC0_bit+0, 0
;alpacaja.c,35 :: 		portb=var;      //se agrega encriptacion bit 9 y 8 ambos en 0 = 0
	MOVF       main_var_L0+0, 0
	MOVWF      PORTB+0
;alpacaja.c,36 :: 		UART1_Write(var);
	MOVF       main_var_L0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;alpacaja.c,37 :: 		var=0;
	CLRF       main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,38 :: 		Delay_us(1);//hacer 50 veces
	NOP
	NOP
	NOP
	NOP
	NOP
;alpacaja.c,40 :: 		case 2:
L_main7:
;alpacaja.c,41 :: 		Chip_Select = 0;                       // seleccionamos adc
	BCF        RC0_bit+0, 0
;alpacaja.c,43 :: 		SPI1_Write(temp);// envio de configuracion
	MOVLW      223
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;alpacaja.c,45 :: 		var = SPI1_Read(buff);
	MOVF       main_buff_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,46 :: 		Chip_Select = 1;                       // Deseleccionamos adc
	BSF        RC0_bit+0, 0
;alpacaja.c,47 :: 		portb=var;
	MOVF       main_var_L0+0, 0
	MOVWF      PORTB+0
;alpacaja.c,48 :: 		var=var+256;  //se agrega encriptacion bit 9 en 0 y 8 en 1 = 256
	MOVLW      0
	ADDWF      main_var_L0+0, 0
	MOVWF      R0+0
	MOVF       main_var_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDLW      1
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	MOVF       R0+1, 0
	MOVWF      main_var_L0+1
;alpacaja.c,49 :: 		UART1_Write(var);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;alpacaja.c,50 :: 		var=0;
	CLRF       main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,51 :: 		Delay_us(1);//hacer 50 veces
	NOP
	NOP
	NOP
	NOP
	NOP
;alpacaja.c,53 :: 		case 3:
L_main8:
;alpacaja.c,54 :: 		Chip_Select = 0;                       // seleccionamos adc
	BCF        RC0_bit+0, 0
;alpacaja.c,56 :: 		SPI1_Write(temp);// envio de configuracion
	MOVLW      175
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;alpacaja.c,58 :: 		var = SPI1_Read(buff);
	MOVF       main_buff_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,59 :: 		Chip_Select = 1;                       // Deseleccionamos adc
	BSF        RC0_bit+0, 0
;alpacaja.c,60 :: 		portb=var;
	MOVF       main_var_L0+0, 0
	MOVWF      PORTB+0
;alpacaja.c,61 :: 		var=var+512;   //se agrega encriptacion bit 9 en 1 y 8 en 0 = 512
	MOVLW      0
	ADDWF      main_var_L0+0, 0
	MOVWF      R0+0
	MOVF       main_var_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDLW      2
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	MOVF       R0+1, 0
	MOVWF      main_var_L0+1
;alpacaja.c,62 :: 		UART1_Write(var);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;alpacaja.c,63 :: 		var=0;
	CLRF       main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,64 :: 		Delay_us(1);//hacer 50 veces
	NOP
	NOP
	NOP
	NOP
	NOP
;alpacaja.c,66 :: 		case 4:
L_main9:
;alpacaja.c,67 :: 		Chip_Select = 0;                       // seleccionamos adc
	BCF        RC0_bit+0, 0
;alpacaja.c,69 :: 		SPI1_Write(temp);// envio de configuracion
	MOVLW      239
	MOVWF      FARG_SPI1_Write_data_+0
	CALL       _SPI1_Write+0
;alpacaja.c,71 :: 		var = SPI1_Read(buff);
	MOVF       main_buff_L0+0, 0
	MOVWF      FARG_SPI1_Read_buffer+0
	CALL       _SPI1_Read+0
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,72 :: 		Chip_Select = 1;                       // Deseleccionamos adc
	BSF        RC0_bit+0, 0
;alpacaja.c,73 :: 		portb=var;
	MOVF       main_var_L0+0, 0
	MOVWF      PORTB+0
;alpacaja.c,74 :: 		var=var+768;     //se agrega encriptacion bit 9 y 8 ambos en  1 = 768
	MOVLW      0
	ADDWF      main_var_L0+0, 0
	MOVWF      R0+0
	MOVF       main_var_L0+1, 0
	BTFSC      STATUS+0, 0
	ADDLW      1
	ADDLW      3
	MOVWF      R0+1
	MOVF       R0+0, 0
	MOVWF      main_var_L0+0
	MOVF       R0+1, 0
	MOVWF      main_var_L0+1
;alpacaja.c,75 :: 		UART1_Write(var);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;alpacaja.c,76 :: 		var=0;
	CLRF       main_var_L0+0
	CLRF       main_var_L0+1
;alpacaja.c,77 :: 		Delay_us(1);//hacer 50 veces
	NOP
	NOP
	NOP
	NOP
	NOP
;alpacaja.c,78 :: 		}
	GOTO       L_main5
L_main4:
	MOVLW      0
	XORWF      main_cont_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main13
	MOVLW      1
	XORWF      main_cont_L0+0, 0
L__main13:
	BTFSC      STATUS+0, 2
	GOTO       L_main6
	MOVLW      0
	XORWF      main_cont_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main14
	MOVLW      2
	XORWF      main_cont_L0+0, 0
L__main14:
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVLW      0
	XORWF      main_cont_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main15
	MOVLW      3
	XORWF      main_cont_L0+0, 0
L__main15:
	BTFSC      STATUS+0, 2
	GOTO       L_main8
	MOVLW      0
	XORWF      main_cont_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main16
	MOVLW      4
	XORWF      main_cont_L0+0, 0
L__main16:
	BTFSC      STATUS+0, 2
	GOTO       L_main9
L_main5:
;alpacaja.c,24 :: 		for (i=0;i<50;i++){
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;alpacaja.c,79 :: 		}
	GOTO       L_main1
L_main2:
;alpacaja.c,81 :: 		if(cont==4){
	MOVLW      0
	XORWF      main_cont_L0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main17
	MOVLW      4
	XORWF      main_cont_L0+0, 0
L__main17:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;alpacaja.c,82 :: 		cont=0;
	CLRF       main_cont_L0+0
	CLRF       main_cont_L0+1
;alpacaja.c,83 :: 		}
L_main10:
;alpacaja.c,84 :: 		goto vinex
	GOTO       ___main_vinex
;alpacaja.c,85 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
