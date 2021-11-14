String[] lines;
int[] values;

String getResult(String value) {
   int an_pwr = Integer.valueOf(value);
   double volts = an_pwr / 1023.0;
   double watts = volts * 30.0;
   return "Analog val: " + volts + "\t Pwr (uW) = " + watts;
}

void up() {
  mySerial.write('w');
}

void down() {
  mySerial.write('s');
}

void right() {
  for (int i = 0; i < 300; i++) {
    mySerial.write('d');
  }
}

void left() {
  for (int i = 0; i < 300; i++) {
    mySerial.write('a');
  }
}

void stop() {
  output.flush();
  output.close();
  exit();
}
