#include <Servo.h>
Servo myservo;
volatile int encCounter;
volatile boolean state, lastState;
boolean x=1,xp=1;
int y;


void int0() {
  state = digitalRead(2);
  if (state != lastState)
      encCounter += 1;
  lastState = state;
}

void servopush() {
    myservo.write(90);
    delay(100);
    myservo.write(0);
    delay(100);
}

void setup() {
  Serial.begin(9600);
  attachInterrupt(0, int0, CHANGE);
  myservo.attach(9);
}

void loop() {
  Serial.println(encCounter);
  y=analogRead(A0);
  Serial.println(y);
  x=state;
  if (x && xp || y==0)
        servopush();
  xp=x;

  delay(100);
}