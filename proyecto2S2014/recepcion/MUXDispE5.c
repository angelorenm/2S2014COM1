
unsigned short mask(unsigned short num) {
  switch (num) {
    case 0 : return ;
    case 1 : return 0x06;
    case 2 : return 0x5B;
    case 3 : return 0x4F;
    case 4 : return 0x66;
    case 5 : return 0x6D;
    case 6 : return 0x7D;
    case 7 : return 0x07;
    case 8 : return 0x7F;
    case 9 : return 0x6F;
  }
}

unsigned short digit_no, digit10, digit1, digit, b, i;
unsigned int oldstate;
unsigned long Read_uart;
//unsigned long digitU;
unsigned char digitU=0;  // variable de recepcion uart

int t=0;

void interrupt() {
  if (digit_no == 0) {

    PORTA = 0;       // Apagar ambos visualizadores
    PORTB = digit1;  // Colocar máscara para visualizar unidades en el

    // puerto PORTA
    PORTA = 1;       // Encender el visualizador para las unidades (LSD)
    digit_no = 1;
  }else{
    PORTA = 0;       // Apagar ambos visualizadores
    PORTB = digit10; // Colocar máscara para visualizar decenas en el

    // puerto PORTD
    PORTA = 2;       // Encender el visualizador para las decenas (MSD)
    digit_no = 0;
  }

  TMR0 = 0;          // Reiniciar el contador TMRO
  INTCON = 0x20;     // Bit T0IF=0, T0IE=1  //comenzar la siguiente rutina.
}



void main() {
ANSEL = 0;
ANSELH = 0;

TRISA = 0;           // TODOS LOS PINES EN EL PORTA COMO SALIDAS DIGITALES
PORTA = 0;  //VALOR INICIAL PARA PORTA

TRISB = 0B10000000; //TODOS LOS PINES EN EL PUERTOB COMO SALIDAS DIGITALES
PORTB = 0; //VALOR INICIAL PARA PORTB

TRISD.B2 = 1;
PORTD.B2 = 0;

OPTION_REG = 0B10000000;  //CONFIGURANDO TMR0 0X80   //preescaler 1:2
TMR0 =  0;     //REINICIANDO TEMPORIZADfOR
INTCON = 0B10100000;  //HABILITAR INTERRUPCION POR DESBORDAMIENTO EN TMRO Y GIE=1  0xA0
UART1_INIT(300);
delay_ms(100);

while(1){

if (Uart1_Data_Ready()==1){
digitU = UART1_READ();

switch (digitU){
       case '0': {t=48; break;}
       case '1': {t=49; break;}
       case '2': {t=50; break;}
       case '3': {t=51; break;}
       case '4': {t=52; break;}
       case '5': {t=53; break;}
       case '6': {t=54; break;}
       case '7': {t=55; break;}
       case '8': {t=56; break;}
       case '9': {t=57; break;}
       case '+': {t=43; break;}
       case '-': {t=45; break;}
       case '*': {t=42; break;}
       case '/': {t=47; break;}
       }
}
digit = t % 10u;  //OPERACION PARA EXTRAER LAS UNIDADES
digit1 = mask(digit); //EN DIGT1 ESTA LA MASCARA PARA MOSTRAR LAS UNIDADES
digit = (t / 10u) % 10u;  //OPERACION PARA EXTRAER LAS DECENAS
digit10 = mask(digit); //EN DIGIT10 ESTA LA MASCARA PARA MOSTRAR LAS DECENAS
delay_ms(1);

if (PORTD.B2 == 1){
Uart1_write(50);//envio 2
}


}
}