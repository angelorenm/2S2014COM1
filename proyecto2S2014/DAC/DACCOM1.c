
unsigned char recieved;
unsigned char DAC_PORTD;
unsigned int CS1_DAC = 0;
unsigned int WR_DAC = 0;
unsigned int i;

//DECLARACION DE SUBRUTINAS
void SET_UP();

void main() {

SET_UP();



UART1_Init(115200);
Delay_ms(200);


while(1){
//CS1 Y WR AMBOS 0;
PORTC.B0 = CS1_DAC;
PORTC.B1 = WR_DAC;

for (i = 0 ; i <255 ; i++ ) {
PORTC = i;
}

if (i == 255){
i = 0;
}


//if(UART1_Data_Ready()==1){
//recieved = UART1_READ();
//PORTD = recieved;
//}
}
}

void SET_UP(){
ANSEL = 0;
ANSELH = 0;
i= 0;

TRISD = 0x00;
PORTD = 0;     //VALOR INICIAL

TRISC.B7 = 0x01;               //RX
PORTC.B7 = 0; //VALOR INICIAL 0

TRISC.B0 = 0x00;
TRISC.B1 = 0x00;             //PINC.B0,B1 COMO SALIDAS DIGITALTES
PORTC.B0 = 0x00;
PORTC.B1 = 0x00;


}