import processing.serial.*;
import controlP5.*;

Serial mySerial;
PrintWriter output;
ControlP5 cp5;

void setup() {
   size(500, 300);
   mySerial = new Serial(this, Serial.list()[0], 115200);
   output = createWriter("data.txt");
   cp5 = new ControlP5(this);
   
   cp5.addButton("up")            
     .setPosition(190, 50)              
     .setSize(120, 70);                 
   cp5.addButton("down")                  
     .setPosition(190, 210)              
     .setSize(120, 70);              
   cp5.addButton("right")                 
     .setPosition(350, 130)            
     .setSize(120, 70);              
   cp5.addButton("left")             
     .setPosition(30, 130)                
     .setSize(120, 70);
   cp5.addButton("stop")               
     .setPosition(190, 130)                
     .setSize(120, 70);
   
   
}

void draw() {
  background(150, 0, 150);
  fill(225);
  text("Science challenge control", 195, 30);
    if (mySerial.available() > 0) {
         String value = mySerial.readString();
         if (value != null) {
           String result = getResult(value);
           output.println(result);
         }
    }
}
