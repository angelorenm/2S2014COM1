#line 1 "C:/Documents and Settings/adan/Escritorio/proyectos segundo semestre 2014/comunicaciones 1/alpacaja.c"
sbit Chip_Select at RC0_bit;
sbit Chip_Select_Direction at TRISC0_bit;

void main() {
int i=0;
int var=0;
char temp=0;
int cont=0;
char buff;
ansel=anselh=0;
trisb=0;
portb=0;
Chip_Select = 1;
Chip_Select_Direction = 0;
SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_HIGH_2_LOW);
UART1_Init(9600);
Delay_ms(100);




vinex:
cont=cont++;
for (i=0;i<50;i++){
 switch (cont){


case 1:
 Chip_Select = 0;
 temp=0b10011111 ;
 SPI1_Write(temp);

 var = SPI1_Read(buff);
 Chip_Select = 1;
 portb=var;
 UART1_Write(var);
 var=0;
 Delay_us(1);

 case 2:
 Chip_Select = 0;
 temp=0b11011111;
 SPI1_Write(temp);

 var = SPI1_Read(buff);
 Chip_Select = 1;
 portb=var;
 var=var+256;
 UART1_Write(var);
 var=0;
 Delay_us(1);

case 3:
 Chip_Select = 0;
 temp=0b10101111;
 SPI1_Write(temp);

 var = SPI1_Read(buff);
 Chip_Select = 1;
 portb=var;
 var=var+512;
 UART1_Write(var);
 var=0;
 Delay_us(1);

case 4:
 Chip_Select = 0;
 temp=0b11101111;
 SPI1_Write(temp);

 var = SPI1_Read(buff);
 Chip_Select = 1;
 portb=var;
 var=var+768;
 UART1_Write(var);
 var=0;
 Delay_us(1);
 }
}

if(cont==4){
cont=0;
}
goto vinex
}
