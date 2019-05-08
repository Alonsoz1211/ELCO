  
    void sensoresArduino(boolean Hum, boolean Temp, boolean Luz) {
    
      port.write('E');
      delay(100);

         if (port.available() > 0) {
          String val = port.readString();
          float[] list = float(split(val, ':'));
          
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
            luxActual = list[2];
            }
            if(!Luz){
            luxActual = 0;
            }
            
            lightActual = ((float)luxActual)/65535*100;
           
            println("Temperature: " + tempActual + " C  " + "Humidity: " + humActual + " %" + " Light " + lightActual + " %");
            println("luxActual = " + luxActual);
            
            if(!ARDUINOperiodico || SENSORES){
                m.updateMeter(int(tempActual));
                m2.updateMeter(int(humActual));
                m3.updateMeter(int(lightActual));
            }
            
          }else{
          println("Error reading the sensors");
          m.updateMeter(int(tempActual));
          m2.updateMeter(int(humActual));
          m3.updateMeter(int(lightActual));
          }
          
        delay(1000);
        }

    }
