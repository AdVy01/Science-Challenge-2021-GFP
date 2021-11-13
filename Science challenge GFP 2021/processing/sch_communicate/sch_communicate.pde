import processing.serial.*;
Serial mySerial;
PrintWriter output;
void setup() {
   mySerial = new Serial(this, Serial.list()[0], 115200);
   output = createWriter("data.txt");
}
void draw() {
    if (mySerial.available() > 0 ) {
         String value = mySerial.readString();
         if ( value != null ) {
           String result = getResult(value);
           output.println(result);
         }
    }
}

void keyPressed() {
    output.flush();
    output.close();
    exit();
}
