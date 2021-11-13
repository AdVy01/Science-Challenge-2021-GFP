// TODO:
// zmerit jak dlouho po posunuti je mozno zacit presne merit
// nechat si vypsat hodnoty pro 1600 poloh pripadne pro 640000 poloh
// zjistit, jak namerene hodnoty prevest na sirku svazku
// udealt GUI
#define ENABLE 8
#define X_STEP 2
#define Y_STEP 3
#define X_DIR  5
#define Y_DIR  6
#define LASER_PWR A3

void setup() {
  pinMode(X_STEP, OUTPUT);
  pinMode(Y_STEP, OUTPUT);
  pinMode(X_DIR,  OUTPUT);
  pinMode(Y_DIR,  OUTPUT);
  pinMode(ENABLE, OUTPUT);
  digitalWrite(ENABLE, LOW);

  Serial.begin(115200);
}

void loop() {
  Serial.print(analogRead(LASER_PWR));
  
  if(Serial.available()) {
    char msg = Serial.read();
    if(msg == 'a') {
      Serial.println("Left 200");
      pohybOsy(true,  X_DIR, X_STEP, 200);      
    }
    else if(msg == 'd') {
      Serial.println("Right 200");
      pohybOsy(false,  X_DIR, X_STEP, 200);      
    }
    if(msg == 's') {
      Serial.println("Down 200");
      pohybOsy(true,  Y_DIR, Y_STEP, 200);      
    }
    else if(msg == 'w') {
      Serial.println("Up 200");
      pohybOsy(false,  Y_DIR, Y_STEP, 200);      
    }
  }
  delay(250);
}

void pohybOsy(boolean smer, byte dirPin, byte stepPin, int kroky) {
  // zapis smeru na prislusny pin DIR
  digitalWrite (dirPin, smer);
  delay(50);
  // smycka pro provedeni predaneho mnozstvi kroku
  for (int i = 0; i < kroky; i++) {
    digitalWrite(stepPin, HIGH);
    delayMicroseconds (800);
    digitalWrite(stepPin, LOW);
    delayMicroseconds (800);
  }
}
