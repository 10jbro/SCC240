// Arduino pin numbers

#include "dht.h"
#define dht_apin A2 // Analog Pin sensor is connected to
 
dht DHT;

const int SW_pin = 2; // digital pin connected to switch output
const int X_pin = 0; // analog pin connected to X output
const int Y_pin = 1; // analog pin connected to Y output

const int SensorPin=7;//const int SensorPin=7;//Level input ports
const int analogIn = A3;
const int ledPin = 5;

int SensorState=0;
int analogVal = 0;

int sensorPin=4;
boolean val =0;

int sensorpin = A4; //define analog pin 2
int value = 0;

int delayTime = 100; //dleaytime in ms


void setup() {
  pinMode(SW_pin, INPUT);
  digitalWrite(SW_pin, HIGH);
  Serial.begin(9600);
  pinMode (11, OUTPUT);

  pinMode(SensorPin,INPUT);
  pinMode(ledPin,OUTPUT);

  Serial.println("DHT11 Humidity & temperature Sensor\n\n");

  //pinMode(sensorPin, INPUT);
  
}

void loop() {

  //PHOTORESISTOR SENSOR
  value = analogRead(sensorPin); 
  Serial.println(value, DEC); // light intensity
                // high values for bright environment
                // low values for dark environment
  delay(50);

  //SOUND SENSOR
  val =digitalRead(sensorPin);
  //Serial.println (val);
  // when the sensor detects a signal above the threshold value, LED flashes
  if (val==HIGH) {
    Serial.println ("YES");
  }
  else {
    Serial.println ("NO");
  }

  //TEMP & HUMID
  DHT.read11(dht_apin);
  Serial.print("Current humidity = ");
  Serial.print(DHT.humidity);
  Serial.print("%  ");
  Serial.print("temperature = ");
  Serial.print(DHT.temperature); 
  Serial.println("C  ");
  delay(delayTime);//Wait 2.5 seconds before accessing sensor again.

  //JOYSTICK
  Serial.print("Switch:  ");
  Serial.print(digitalRead(SW_pin));
  Serial.print("\n");
  Serial.print("X-axis: ");
  Serial.print(analogRead(X_pin));
  Serial.print("\n");
  Serial.print("Y-axis: ");
  Serial.println(analogRead(Y_pin));
  Serial.print("\n");
  //Serial.print("\n");

  //7 COLOUR LED
  digitalWrite (11, HIGH); // set the LED on
  delay (delayTime); // wait for a second
  digitalWrite (11, LOW); // set the LED off
  delay (delayTime); // wait for a second

  //TOUCH SENSOR
  analogVal = analogRead(analogIn);
  SensorState=digitalRead(SensorPin);
  if(SensorState==HIGH)
  {
  digitalWrite(ledPin,HIGH);
  }
  else
  {
  digitalWrite(ledPin,LOW);
  }
}
