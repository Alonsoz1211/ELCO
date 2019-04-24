/***********************************
 First upload the Arduino code to the Arduino and then run this code.
 Make sure that the Port number and baudrate are the same.
***********************************/
import meter.*;
import processing.serial.*;

Serial port;
String[] list;

Meter m, m2, m3;

void setup() {
  size(800, 480);
  background(0);
  
  port = new Serial(this, "/dev/cu.usbserial-AL03MSOB", 9600);

  fill(120, 50, 0);
  m = new Meter(this, 50, 50);
  // Adjust font color of meter value 
  m.setMeterWidth(250);
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial bold");
  m.setTitle("Temperature (C)");
  m.setDisplayDigitalMeterValue(true);
  
  // Meter Scale
  String[] scaleLabelsT = {"0", "10", "20", "30", "40", "50", "60", "70", "80"};
  m.setScaleLabels(scaleLabelsT);
  m.setScaleFontSize(18);
  m.setScaleFontName("Times New Roman bold");
  m.setScaleFontColor(color(200, 30, 70));
  
  m.setArcColor(color(141, 113, 178));
  m.setArcThickness(10);
  m.setMaxScaleValue(80);
  m.setNeedleThickness(3);
  
  m.setMinInputSignal(0);
  m.setMaxInputSignal(80);

  // A second meter for reference
  int mx = m.getMeterX();
  int my = m.getMeterY();
  int mw = m.getMeterWidth();
  
  m2 = new Meter(this, 400, 50);
  m2.setMeterWidth(250);
  m2.setTitleFontSize(20);
  m2.setTitleFontName("Arial bold");
  m2.setTitle("Humidity (%)");
  m2.setDisplayDigitalMeterValue(true);
  
  String[] scaleLabelsH = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
  m2.setScaleLabels(scaleLabelsH);
  m2.setScaleFontSize(18);
  m2.setScaleFontName("Times New Roman bold");
  m2.setScaleFontColor(color(200, 30, 70));
  
  m2.setArcColor(color(141, 113, 178));
  m2.setArcThickness(10);
  m2.setMaxScaleValue(100);
  
  m2.setNeedleThickness(3);
  
  m2.setMinInputSignal(0);
  m2.setMaxInputSignal(100);
  
  // Third meter
  m3 = new Meter(this, 300, 250);
  // Adjust font color of meter value  
  m3.setMeterWidth(250);
  m3.setTitleFontSize(20);
  m3.setTitleFontName("Arial bold");
  m3.setTitle("Light (%)");
  m3.setDisplayDigitalMeterValue(true);
  
  // Meter Scale
  String[] scaleLabelsL = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
  m3.setScaleLabels(scaleLabelsL);
  m3.setScaleFontSize(18);
  m3.setScaleFontName("Times New Roman bold");
  m3.setScaleFontColor(color(200, 30, 70));
  
  m3.setArcColor(color(141, 113, 178));
  m3.setArcThickness(10);
  m3.setMaxScaleValue(80);
  
  m3.setNeedleThickness(3);
  
  m3.setMinInputSignal(0);
  m3.setMaxInputSignal(80);
  
}

public void draw() {
 
  
  port.write("E");
  
  textSize(30);
  fill(0, 255, 0);
  text("Temperature and Humidity", 270, 50);
  
  textSize(30);
  fill(0, 255, 0);
  text("% of Light", (950/2)-50, 50+400);
      
      println("ABOUT TO IN");

  if (port.available() > 0) {
    println("IN");
    String val = port.readString();
    println(val);
    float[] list = float(split(val, ':'));
    if(list.length>2){
      float temp = list[0];
      //float temp = 0;
      float hum = list[1];
      //float hum = 0;
      float light = list[2];
      //float light = 0;
      println("Temperature: " + temp + " C  " + "Humidity: " + hum + " %" + " Light " + light + " %");
      
      m.updateMeter(int(temp));
      m2.updateMeter(int(hum));
      m3.updateMeter(int(light));

    }
    else{
      println("Error reading the sensors");
    }
    
    delay(1000);
  }
}
