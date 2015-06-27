#line 1 "C:/Users/Angel/Desktop/recepcion/MUXDispE5.c"

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

unsigned char digitU=0;

int t=0;

void interrupt() {
 if (digit_no == 0) {

 PORTA = 0;
 PORTB = digit1;


 PORTA = 1;
 digit_no = 1;
 }else{
 PORTA = 0;
 PORTB = digit10;


 PORTA = 2;
 digit_no = 0;
 }

 TMR0 = 0;
 INTCON = 0x20;
}



void main() {
ANSEL = 0;
ANSELH = 0;

TRISA = 0;
PORTA = 0;

TRISB = 0B10000000;
PORTB = 0;

TRISD.B2 = 1;
PORTD.B2 = 0;

OPTION_REG = 0B10000000;
TMR0 = 0;
INTCON = 0B10100000;
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
digit = t % 10u;
digit1 = mask(digit);
digit = (t / 10u) % 10u;
digit10 = mask(digit);
delay_ms(1);

if (PORTD.B2 == 1){
Uart1_write(50);
}


}
}
