  
    void sensoresArduino(boolean Hum, boolean Temp, boolean Luz) {
   
      textSize(30);
      fill(0, 255, 0);
      text("Temperature and Humidity", 270, 50);
      
      textSize(30);
      fill(0, 255, 0);
      text("% of Light", (950/2)-50, 50+400);
      
        if (port.available() > 0) {
          String val = port.readString();
          float[] list = float(split(val, ' '));
          
          if(list.length>2){
            if(Temp){
            tempActual = list[0];
            }
            if(!Temp){
            tempActual = 0;
            }
            if(Hum){
            humActual = list[1];
            }
            if(!Hum){
            humActual = 0;
            }
            if(Luz){
            lightActual = list[2];
            }
            if(!Luz){
            lightActual = 0;
            }
            
            println("Temperature: " + tempActual + " C  " + "Humidity: " + humActual + " %" + " Light " + lightActual + " %");
            
            if(!ARDUINOperiodico || SENSORES){
                m.updateMeter(int(tempActual));
                m2.updateMeter(int(humActual));
                m3.updateMeter(int(lightActual));
            }
            
          }else{
          println("Error reading the sensors");
          }
          
        delay(1000);
        }

    }
