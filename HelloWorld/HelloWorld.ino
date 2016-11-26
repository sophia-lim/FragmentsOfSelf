
#define LEDA 13
#define B1 12
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(LEDA, OUTPUT);
  pinMode(B1, INPUT);

  Serial.println("SIMPLE PULL DOWN");
}

void loop() {
  Serial.println("DOING...");
  // put your main code here, to run repeatedly:
  while (digitalRead(B1) == HIGH) {
    digitalWrite(LEDA, HIGH);
    delay(1000);
    digitalWrite(LEDA, LOW);
    delay(1000);
  }
/*  if (digitalRead(LEDA) == HIGH) {
    digitalWrite(B1, HIGH);
    delay(1000);
    digitalWrite(B1, HIGH);
    delay(1000);    
  }
  do {
    digitalWrite(B1, HIGH);
    delay(1000);
    digitalWrite(B1, HIGH);
    delay(1000);  
  } while (digital(LEDA) == HIGH); */
}
