int trigPin=2;
int echoPin=3;
int distance;
long duration;

void setup() 
{
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
//initialize serial communications at a 9600 baud rate
Serial.begin(9600);
}
void loop()
{
  distance = getDistance();
  Serial.print(distance);
  Serial.print('.');
  delay(50);

}
int getDistance()
{
  digitalWrite(trigPin,LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin,HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin,LOW);
  
  duration=pulseIn(echoPin,HIGH);
  distance=duration*0.034/2;
  return distance;
}  
