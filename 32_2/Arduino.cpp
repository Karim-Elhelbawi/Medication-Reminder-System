#include <Arduino.h>
#include <Ultrasonic.h>

#define TRIG_PIN 10
#define ECHO_PIN 11
#define output 9

Ultrasonic ultrasonic(TRIG_PIN, ECHO_PIN);
void setup() {
   Serial.begin(9600);
   pinMode(output,OUTPUT);
   ultrasonic.setTimeout(40000UL);
}


void loop() {
      unsigned int d = ultrasonic.distanceRead();
    // Distance is in CM
    if(d <= 10){
    Serial.println("bruh");
    digitalWrite(output,HIGH);
    }
    else{
    Serial.println("aa");
    digitalWrite(output,LOW);
    }
    delay(100);
}