
char control;
//VARIABLES CONTENIDO CONVERSION
int p1,p2,p3,p4=0;
unsigned int i;

unsigned char DAC_PORTD;
unsigned int CS1_DAC = 0;
unsigned int WR_DAC = 0;



//FIN CONVERSION
void main() {
char receive;
ANSEL=ANSELH=0;///CONFIGURAMOS PINES COMO DIGITALTES
PORTA=0;
TRISA=0B1111;
TRISD=0;
PORTD=0;
UART1_Init(115200);
Delay_ms(100);
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

while(1){

PORTC.B0 = CS1_DAC;
PORTC.B1 = WR_DAC;

if (UART1_Data_Ready() == 1) {
 receive = UART1_Read();
  //dessincriptacion
  switch(receive){
      case 'G' :{
      
            if (UART1_Data_Ready() == 1) {
             receive = UART1_Read();
                  //nible bajo
                       switch(receive){
                             case '0' :{
                              p1=0;
                             break;
                             }
                             case '1' :{
                             p1=1;
                             break;
                             }
                             case '2' :{
                             p1=2;
                             break;
                             }
                             case '3' :{
                             p1=3;
                             break;
                             }
                             case '4' :{
                             p1=4;
                             break;
                             }
                             case '5' :{
                             p1=5;
                             break;
                             }
                             case '6' :{
                             p1=6;
                             break;
                             }
                             case '7' :{
                             p1=7;
                             break;
                             }
                             case '8' :{
                             p1=8;
                             break;
                             }
                             case '9' :{
                             p1=9;
                             break;
                             }
                             case 'A' :{
                             p1=10;
                             break;
                             }
                             case 'B' :{
                             p1=11;
                             break;
                             }
                             case 'C' :{
                             p1=12;
                             break;
                             }
                             case 'D' :{
                             p1=13;
                             break;
                             }
                             case 'E' :{
                             p1=14;
                             break;
                             }
                             case 'F' :{
                             p1=15;
                             break;
                             }
                          }
                             if (UART1_Data_Ready() == 1) {
                                  receive = UART1_Read();
                                   //suma nible alto
                                    switch(receive){
                                          case '0' :{
                                          p1=p1+0*16;
                                          break;
                                          }
                                          case '1' :{
                                          p1=p1+1*16;
                                          break;
                                          }
                                          case '2' :{
                                          p1=p1+2*16;
                                          break;
                                          }
                                          case '3' :{
                                          p1=p1+3*16;
                                          break;
                                          }
                                          case '4' :{
                                          p1=p1+4*16;
                                          break;
                                          }
                                          case '5' :{
                                          p1=p1+5*16;
                                          break;
                                          }
                                          case '6' :{
                                          p1=p1+6*16;
                                          break;
                                          }
                                          case '7' :{
                                          p1=p1+7*16;
                                          break;
                                          }
                                          case '8' :{
                                          p1=p1+8*16;
                                          break;
                                          }
                                          case '9' :{
                                          p1=p1+9*16;
                                          break;
                                          }
                                          case 'A' :{
                                          p1=p1+10*16;
                                          break;
                                          }
                                          case 'B' :{
                                          p1=p1+11*16;
                                          break;
                                          }
                                          case 'C' :{
                                          p1=p1+12*16;
                                          break;
                                          }
                                          case 'D' :{
                                          p1=p1+13*16;
                                          break;
                                          }
                                          case 'E' :{
                                          p1=p1+14*16;
                                          break;
                                          }
                                          case 'F' :{
                                          p1=p1+15*16;
                                          break;
                                          }
                                          }
                                       }
             }
      break;

      }//FIN CANAL 1
      
            case 'H' :{//CANAL 2

            if (UART1_Data_Ready() == 1) {
             receive = UART1_Read();
                  //nible bajo
                       switch(receive){
                             case '0' :{
                              p2=0;
                             break;
                             }
                             case '1' :{
                             p2=1;
                             break;
                             }
                             case '2' :{
                             p2=2;
                             break;
                             }
                             case '3' :{
                             p2=3;
                             break;
                             }
                             case '4' :{
                             p2=4;
                             break;
                             }
                             case '5' :{
                             p2=5;
                             break;
                             }
                             case '6' :{
                             p2=6;
                             break;
                             }
                             case '7' :{
                             p2=7;
                             break;
                             }
                             case '8' :{
                             p2=8;
                             break;
                             }
                             case '9' :{
                             p2=9;
                             break;
                             }
                             case 'A' :{
                             p2=10;
                             break;
                             }
                             case 'B' :{
                             p2=11;
                             break;
                             }
                             case 'C' :{
                             p2=12;
                             break;
                             }
                             case 'D' :{
                             p2=13;
                             break;
                             }
                             case 'E' :{
                             p2=14;
                             break;
                             }
                             case 'F' :{
                             p2=15;
                             break;
                             }
                          }
                             if (UART1_Data_Ready() == 1) {
                                  receive = UART1_Read();
                                   //suma nible alto
                                    switch(receive){
                                          case '0' :{
                                          p2=p2+0*16;
                                          break;
                                          }
                                          case '1' :{
                                          p2=p2+1*16;
                                          break;
                                          }
                                          case '2' :{
                                          p2=p2+2*16;
                                          break;
                                          }
                                          case '3' :{
                                          p2=p2+3*16;
                                          break;
                                          }
                                          case '4' :{
                                          p2=p2+4*16;
                                          break;
                                          }
                                          case '5' :{
                                          p2=p2+5*16;
                                          break;
                                          }
                                          case '6' :{
                                          p2=p2+6*16;
                                          break;
                                          }
                                          case '7' :{
                                          p2=p2+7*16;
                                          break;
                                          }
                                          case '8' :{
                                          p2=p2+8*16;
                                          break;
                                          }
                                          case '9' :{
                                          p2=p2+9*16;
                                          break;
                                          }
                                          case 'A' :{
                                          p2=p2+10*16;
                                          break;
                                          }
                                          case 'B' :{
                                          p2=p2+11*16;
                                          break;
                                          }
                                          case 'C' :{
                                          p2=p2+12*16;
                                          break;
                                          }
                                          case 'D' :{
                                          p2=p2+13*16;
                                          break;
                                          }
                                          case 'E' :{
                                          p2=p2+14*16;
                                          break;
                                          }
                                          case 'F' :{
                                          p2=p2+15*16;
                                          break;
                                          }
                                          }
                                       }
             }
      break;
      }//FIN CANAL 2
      
      
            case 'I' :{//EMPIEZA CANAL 3

            if (UART1_Data_Ready() == 1) {
             receive = UART1_Read();
                  //nible bajo
                       switch(receive){
                             case '0' :{
                              p3=0;
                             break;
                             }
                             case '1' :{
                             p3=1;
                             break;
                             }
                             case '2' :{
                             p3=2;
                             break;
                             }
                             case '3' :{
                             p3=3;
                             break;
                             }
                             case '4' :{
                             p3=4;
                             break;
                             }
                             case '5' :{
                             p3=5;
                             break;
                             }
                             case '6' :{
                             p3=6;
                             break;
                             }
                             case '7' :{
                             p3=7;
                             break;
                             }
                             case '8' :{
                             p3=8;
                             break;
                             }
                             case '9' :{
                             p3=9;
                             break;
                             }
                             case 'A' :{
                             p3=10;
                             break;
                             }
                             case 'B' :{
                             p3=11;
                             break;
                             }
                             case 'C' :{
                             p3=12;
                             break;
                             }
                             case 'D' :{
                             p3=13;
                             break;
                             }
                             case 'E' :{
                             p3=14;
                             break;
                             }
                             case 'F' :{
                             p3=15;
                             break;
                             }
                          }
                             if (UART1_Data_Ready() == 1) {
                                  receive = UART1_Read();
                                   //suma nible alto
                                    switch(receive){
                                          case '0' :{
                                          p3=p3+0*16;
                                          break;
                                          }
                                          case '1' :{
                                          p3=p3+1*16;
                                          break;
                                          }
                                          case '2' :{
                                          p3=p3+2*16;
                                          break;
                                          }
                                          case '3' :{
                                          p3=p3+3*16;
                                          break;
                                          }
                                          case '4' :{
                                          p3=p3+4*16;
                                          break;
                                          }
                                          case '5' :{
                                          p3=p3+5*16;
                                          break;
                                          }
                                          case '6' :{
                                          p3=p3+6*16;
                                          break;
                                          }
                                          case '7' :{
                                          p3=p3+7*16;
                                          break;
                                          }
                                          case '8' :{
                                          p3=p3+8*16;
                                          break;
                                          }
                                          case '9' :{
                                          p3=p3+9*16;
                                          break;
                                          }
                                          case 'A' :{
                                          p3=p3+10*16;
                                          break;
                                          }
                                          case 'B' :{
                                          p3=p3+11*16;
                                          break;
                                          }
                                          case 'C' :{
                                          p3=p3+12*16;
                                          break;
                                          }
                                          case 'D' :{
                                          p3=p3+13*16;
                                          break;
                                          }
                                          case 'E' :{
                                          p3=p3+14*16;
                                          break;
                                          }
                                          case 'F' :{
                                          p3=p3+15*16;
                                          break;
                                          }
                                          }
                                       }
             }
      break;
      }//FIN CANAL 3
      
      case 'G' :{

            if (UART1_Data_Ready() == 1) {
             receive = UART1_Read();
                  //nible bajo
                       switch(receive){
                             case '0' :{
                              p4=0;
                             break;
                             }
                             case '1' :{
                             p4=1;
                             break;
                             }
                             case '2' :{
                             p4=2;
                             break;
                             }
                             case '3' :{
                             p4=3;
                             break;
                             }
                             case '4' :{
                             p4=4;
                             break;
                             }
                             case '5' :{
                             p4=5;
                             break;
                             }
                             case '6' :{
                             p4=6;
                             break;
                             }
                             case '7' :{
                             p4=7;
                             break;
                             }
                             case '8' :{
                             p4=8;
                             break;
                             }
                             case '9' :{
                             p4=9;
                             break;
                             }
                             case 'A' :{
                             p4=10;
                             break;
                             }
                             case 'B' :{
                             p4=11;
                             break;
                             }
                             case 'C' :{
                             p4=12;
                             break;
                             }
                             case 'D' :{
                             p4=13;
                             break;
                             }
                             case 'E' :{
                             p4=14;
                             break;
                             }
                             case 'F' :{
                             p4=15;
                             break;
                             }
                          }
                             if (UART1_Data_Ready() == 1) {
                                  receive = UART1_Read();
                                   //suma nible alto
                                    switch(receive){
                                          case '0' :{
                                          p4=p4+0*16;
                                          break;
                                          }
                                          case '1' :{
                                          p4=p4+1*16;
                                          break;
                                          }
                                          case '2' :{
                                          p4=p4+2*16;
                                          break;
                                          }
                                          case '3' :{
                                          p4=p4+3*16;
                                          break;
                                          }
                                          case '4' :{
                                          p4=p4+4*16;
                                          break;
                                          }
                                          case '5' :{
                                          p4=p4+5*16;
                                          break;
                                          }
                                          case '6' :{
                                          p4=p4+6*16;
                                          break;
                                          }
                                          case '7' :{
                                          p4=p4+7*16;
                                          break;
                                          }
                                          case '8' :{
                                          p4=p4+8*16;
                                          break;
                                          }
                                          case '9' :{
                                          p4=p4+9*16;
                                          break;
                                          }
                                          case 'A' :{
                                          p4=p4+10*16;
                                          break;
                                          }
                                          case 'B' :{
                                          p4=p4+11*16;
                                          break;
                                          }
                                          case 'C' :{
                                          p4=p4+12*16;
                                          break;
                                          }
                                          case 'D' :{
                                          p4=p4+13*16;
                                          break;
                                          }
                                          case 'E' :{
                                          p4=p4+14*16;
                                          break;
                                          }
                                          case 'F' :{
                                          p4=p4+15*16;
                                          break;
                                          }
                                          }
                                       }
             }
      break;

      }//FIN CANAL 4
      }

 }//FIN DE RECUPERACION DE DATOS =)
 
// SELECCION DE CANAL A MOSTRAR
if(porta.b0==1){
portd=p1;
}
if(porta.b1==1){
portd=p2;
}
if(porta.b2==1){
portd=p3;
}
if(porta.b3==1){
portd=p4;
}
//fin del programon juju =)

}
}