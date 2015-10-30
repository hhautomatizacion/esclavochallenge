/*
  Serial Event example

 When new serial data arrives, this sketch adds it to a String.
 When a newline is received, the loop prints the string and
 clears it.

 A good test for this is to try it with a GPS receiver
 that sends out NMEA 0183 sentences.

 Created 9 May 2011
 by Tom Igoe

 This example code is in the public domain.

 http://www.arduino.cc/en/Tutorial/SerialEvent

 */

byte inBuffer[4];         // a string to hold incoming data
byte outBuffer[95];
int i;
byte Esclavo=11;
unsigned int checksum;
int led;
int temp1;
int temp2;
//int t1[10];
//int t2[10];
int Total;

void setup() {
  // initialize serial:
  Serial.begin(9600);
  Serial.setTimeout(100);
  // reserve 200 bytes for the inputString:

  pinMode(2,OUTPUT);
  pinMode(13,OUTPUT);
  pinMode(12,OUTPUT);
  digitalWrite(2,LOW);
  digitalWrite(13,LOW);

  analogReference(EXTERNAL);
}

void loop() {
  //digitalWrite(2,LOW);
  //memset(inBuffer,0,4);
      
  Serial.readBytes(inBuffer,4);
  if ((inBuffer[0]==6) && (inBuffer[1]==Esclavo))

  {
    checksum=calcCRC16(inBuffer,2);
    if ((inBuffer[2]==lowByte(checksum)) && (inBuffer[3]==highByte(checksum)))
    {
      if (led==LOW)
      {
        led=HIGH;
      }
      else
      {
        led=LOW;
      }
      digitalWrite(13,led);
        //digitalWrite(13,HIGH);
        //delay(100);
        //digitalWrite(13,LOW);
    }
  }
  if ((inBuffer[0]==5) && (inBuffer[1]==Esclavo))
  {
    checksum=calcCRC16(inBuffer,2);
    if ((inBuffer[2]==lowByte(checksum)) && (inBuffer[3]==highByte(checksum)))
      {
            //delay(5);
          //t1[10]=analogRead(A0);
          Total=0;
          for(i=0;i<11;i++)
          {
            Total=Total + analogRead(A0);
            delay(1);
          }
          temp1=Total/10;
          //delay(5);
          //t2[10]=analogRead(A1);
          Total=0;
          for(i=0;i<11;i++)
          {
            Total=Total + analogRead(A1);
            delay(1);
          }
          temp2=Total/10;

          outBuffer[0]=0;
          outBuffer[1]=Esclavo;
          outBuffer[2]=highByte(temp1);
          outBuffer[3]=lowByte(temp1);
          outBuffer[4]=highByte(temp2);
          outBuffer[5]=lowByte(temp2);
          outBuffer[6]=0;
          outBuffer[7]=0;
          outBuffer[8]=0;
          checksum=calcCRC16(outBuffer,94);

          
          outBuffer[94]=lowByte(checksum);
          outBuffer[95]=highByte(checksum);
        
          digitalWrite(2,HIGH);
          digitalWrite(12,HIGH);
          for(i=0;i<96;i++)
          {
            Serial.write(outBuffer[i]);
          }
          Serial.flush();
          //for(i=0;i<10;i++)
          //{
          //  t1[i]=t1[i+1];
          //  t2[i]=t2[i+1];
          //}
          
          //delay(5);
          //Serial.println(checksum);
          //Serial.println("-");
          //delay(80);
          //while (!((UCSR0A) & (1 << UDRE0)));
          
          digitalWrite(2,LOW);
          digitalWrite(12,LOW);
        }
      }
    
    //delay(5000);

}

//- calcCRC16r ------------------------------------------------------
unsigned int calcCRC16(byte datos[],int longitud)
{
  unsigned int crc;
  int bites;
  int iter;

  crc=65535;
  for(iter=0;iter<longitud;iter++)
  {
    crc=crc ^ datos[iter];
    for(bites=0;bites<8;bites++)
    {
      if (crc & 1)
      {
        crc=(crc>>1)^0xA001;
      }
      else
      {
        crc=(crc>>1);
      }
    }
  }
  return (crc);
}
//-------------------------------------------------------------------

