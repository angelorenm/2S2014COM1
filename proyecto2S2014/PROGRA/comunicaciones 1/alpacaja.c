sbit Chip_Select at RC0_bit;
sbit Chip_Select_Direction at TRISC0_bit;

void main() {
int i=0;//variable del for
int var=0;
char temp=0;
int cont=0;  //variable control de switcheo
char buff;// variable dato serial
ansel=anselh=0;
trisb=0;
portb=0;
Chip_Select = 1;                       // Deselect DAC
Chip_Select_Direction = 0;             // Set CS# pin as Output
SPI1_Init_Advanced(_SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_LOW, _SPI_HIGH_2_LOW);
UART1_Init(9600);
Delay_ms(100);//esperando para que uart se estabilice




vinex:
cont=cont++;
for (i=0;i<50;i++){
  switch (cont){
//bit 9 y bit 8 empaquetado de cana| de variable var
//empaqueta uart
case 1:
  Chip_Select = 0;                       // seleccionamos adc
  temp=0b10011111 ;  // seleccion canal 1, 8 bits de conversion
  SPI1_Write(temp);// envio de configuracion
  //bit9=0 bit8=0 selecciona canal 1
  var = SPI1_Read(buff);
  Chip_Select = 1;                       // Deseleccionamos adc
  portb=var;      //se agrega encriptacion bit 9 y 8 ambos en 0 = 0
  UART1_Write(var);
  var=0;
  Delay_us(1);//hacer 50 veces
  
  case 2:
  Chip_Select = 0;                       // seleccionamos adc
  temp=0b11011111;// seleccion canal 2, 8 bits de conversion
  SPI1_Write(temp);// envio de configuracion
  //bit9=0 bit8=1 selecciona canal 2
  var = SPI1_Read(buff);
  Chip_Select = 1;                       // Deseleccionamos adc
  portb=var;
  var=var+256;  //se agrega encriptacion bit 9 en 0 y 8 en 1 = 256
  UART1_Write(var);
  var=0;
  Delay_us(1);//hacer 50 veces

case 3:
  Chip_Select = 0;                       // seleccionamos adc
  temp=0b10101111; // seleccion canal 3, 8 bits de conversion
  SPI1_Write(temp);// envio de configuracion
  //bit9=1 bit8=0 selecciona canal 3
  var = SPI1_Read(buff);
  Chip_Select = 1;                       // Deseleccionamos adc
  portb=var;
  var=var+512;   //se agrega encriptacion bit 9 en 1 y 8 en 0 = 512
  UART1_Write(var);
  var=0;
  Delay_us(1);//hacer 50 veces

case 4:
  Chip_Select = 0;                       // seleccionamos adc
  temp=0b11101111; // seleccion canal 4, 8 bits de conversion
  SPI1_Write(temp);// envio de configuracion
  //bit9=1 bit8=1 selecciona canal 4
  var = SPI1_Read(buff);
  Chip_Select = 1;                       // Deseleccionamos adc
  portb=var;
  var=var+768;     //se agrega encriptacion bit 9 y 8 ambos en  1 = 768
  UART1_Write(var);
  var=0;
  Delay_us(1);//hacer 50 veces
   }
}

if(cont==4){
cont=0;
}
goto vinex
}