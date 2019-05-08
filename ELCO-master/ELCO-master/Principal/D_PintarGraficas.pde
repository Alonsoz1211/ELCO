
  // PINTAR NDVI
  void pintarNDVI(){
      
      //Creamos array y lo rellenamos con entrada de datos
     //FloatNDVIArray1 = float(loadStrings("ndvi.txt"));
     DateHourNdvi = loadStrings("ndvi.txt");
     for(int i = DateHourNdvi.length-31; i < DateHourNdvi.length; i++){
      println("DateHourNdvi[" + i + "] = " + DateHourNdvi[i]);
         Date0Hour1Ndvi2 = split(DateHourNdvi[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1Ndvi2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            //Hour1[i] = Date0Hour1Ndvi2[1];                     //String hora de la medida formato HH:MM
          
            //NDVI
            Ndvi2 = float(Date0Hour1Ndvi2[2]);                   //Float NDVI de la medida
            println("Ndvi2= " + Ndvi2);                                   
                
     

       t =i-(DateHourNdvi.length-31);
     
      plotNDVI.addPoint(t, Ndvi2,"(" + str(day0) + "," + str(Ndvi2) + ")");
     
     }
     
     plotNDVI.beginDraw();
     plotNDVI.drawBackground();
     plotNDVI.drawBox();
     plotNDVI.drawXAxis();
     plotNDVI.drawYAxis();
     plotNDVI.drawTitle();
     plotNDVI.drawGridLines(GPlot.BOTH);
     plotNDVI.drawLines();
     plotNDVI.drawPoints();
     plotNDVI.setPointColor(0);
     plotNDVI.setPointSize(5);
     plotNDVI.endDraw();
      
     // flagpintar=false;
  }  
 
  

  // PINTAR HUM
  void pintarHUM(){

    DateHourHUM = loadStrings("humedad.txt");
    
      if(IF_G_24){  // Si la variable "IF_G_NDVI" está activa (true)

         
         for(int i = DateHourHUM.length-25; i < DateHourHUM.length; i++){
           
           println("DateHourHUM[" + i + "] = " + DateHourHUM[i]);
         Date0Hour1HUM2 = split(DateHourHUM[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1HUM2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1HUM2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            HUM2 = float(Date0Hour1HUM2[2]);                   //Float HUM de la medida
            println("HUM2= " + HUM2);
                
           t =i-(DateHourHUM.length-25);
           
         plotHum.addPoint(t, HUM2,"(" + str(t) + "," + str(HUM2) + ")");
           

         }
         
         plotHum.beginDraw();
         plotHum.drawBackground();
         plotHum.drawBox();
         plotHum.drawXAxis();
         plotHum.drawYAxis();
         plotHum.drawTitle();
         plotHum.drawGridLines(GPlot.BOTH);
         plotHum.drawLines();
         plotHum.drawPoints();
         plotHum.setPointColor(0);
         plotHum.setPointSize(5);
         plotHum.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_NDVI" está activa (true)


         for(int i = DateHourHUM.length-(7*24)-1; i < DateHourHUM.length; i=i+24){
           
           println("DateHourHUM[" + i + "] = " + DateHourHUM[i]);
         Date0Hour1HUM2 = split(DateHourHUM[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1HUM2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1HUM2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            HUM2 = float(Date0Hour1HUM2[2]);                   //Float HUM de la medida
            println("HUM2= " + HUM2);
    
           t =(i-(DateHourHUM.length-(7*24)-1))/24;
           
         plotHum7.addPoint(t, HUM2,"(" + str(t) + "," + str(HUM2) + ")");
         
         }
         
         plotHum7.beginDraw();
         plotHum7.drawBackground();
         plotHum7.drawBox();
         plotHum7.drawXAxis();
         plotHum7.drawYAxis();
         plotHum7.drawTitle();
         plotHum7.drawGridLines(GPlot.BOTH);
         plotHum7.drawLines();
         plotHum7.drawPoints();
         plotHum7.setPointColor(0);
         plotHum7.setPointSize(5);
         plotHum7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_NDVI" está activa (true)


         for(int i = DateHourHUM.length-(30*24)-1; i < DateHourHUM.length; i=i+24){
           
 
           println("DateHourHUM[" + i + "] = " + DateHourHUM[i]);
         Date0Hour1HUM2 = split(DateHourHUM[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1HUM2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1HUM2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            HUM2 = float(Date0Hour1HUM2[2]);                   //Float HUM de la medida
            println("HUM2= " + HUM2);   
            
           t =(i-(DateHourHUM.length-(30*24)-1))/24;
           
         plotHum30.addPoint(t, HUM2,"(" + str(t) + "," + str(HUM2) + ")");
         
         }
         
         plotHum30.beginDraw();
         plotHum30.drawBackground();
         plotHum30.drawBox();
         plotHum30.drawXAxis();
         plotHum30.drawYAxis();
         plotHum30.drawTitle();
         plotHum30.drawGridLines(GPlot.BOTH);
         plotHum30.drawLines();
         plotHum30.drawPoints();
         plotHum30.setPointColor(0);
         plotHum30.setPointSize(5);
         plotHum30.endDraw();
          
      }  
  }  
 
    
  // PINTAR TEMP
  void pintarTEMP(){
      
        DateHourTEMP = loadStrings("temperatura.txt");

      if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

         for(int i = DateHourTEMP.length-25; i < DateHourTEMP.length; i++){
           
         println("DateHourTEMP[" + i + "] = " + DateHourTEMP[i]);
         Date0Hour1TEMP2 = split(DateHourTEMP[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1TEMP2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1TEMP2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            TEMP2 = float(Date0Hour1TEMP2[2]);                   //Float HUM de la medida
            println("TEMP2= " + TEMP2);   
                
           t =i-(DateHourTEMP.length-25);
           
         plotTemp.addPoint(t, TEMP2,"(" + str(t) + "," + str(TEMP2) + ")");
         
         }
         
         plotTemp.beginDraw();
         plotTemp.drawBackground();
         plotTemp.drawBox();
         plotTemp.drawXAxis();
         plotTemp.drawYAxis();
         plotTemp.drawTitle();
         plotTemp.drawGridLines(GPlot.BOTH);
         plotTemp.drawLines();
         plotTemp.drawPoints();
         plotTemp.setPointColor(0);
         plotTemp.setPointSize(5);
         plotTemp.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)
    
         for(int i = DateHourTEMP.length-(7*24)-1; i < DateHourTEMP.length; i=i+24){
           
         println("DateHourTEMP[" + i + "] = " + DateHourTEMP[i]);
         Date0Hour1TEMP2 = split(DateHourTEMP[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1TEMP2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1TEMP2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            TEMP2 = float(Date0Hour1TEMP2[2]);                   //Float HUM de la medida
            println("TEMP2= " + TEMP2);   
                
           t =(i-(DateHourTEMP.length-(7*24)-1))/24;
           
         plotTemp7.addPoint(t, TEMP2,"(" + str(t) + "," + str(TEMP2) + ")");
         
         }
         
         plotTemp7.beginDraw();
         plotTemp7.drawBackground();
         plotTemp7.drawBox();
         plotTemp7.drawXAxis();
         plotTemp7.drawYAxis();
         plotTemp7.drawTitle();
         plotTemp7.drawGridLines(GPlot.BOTH);
         plotTemp7.drawLines();
         plotTemp7.drawPoints();
         plotTemp7.setPointColor(0);
         plotTemp7.setPointSize(5);
         plotTemp7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)
    
         for(int i = DateHourTEMP.length-(30*24)-1; i < DateHourTEMP.length; i=i+24){
           
   
         println("DateHourTEMP[" + i + "] = " + DateHourTEMP[i]);
         Date0Hour1TEMP2 = split(DateHourTEMP[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1TEMP2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1TEMP2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            TEMP2 = float(Date0Hour1TEMP2[2]);                   //Float HUM de la medida
            println("TEMP2= " + TEMP2);   
                    
           t =(i-(DateHourTEMP.length-(30*24)-1))/24;
           
         plotTemp30.addPoint(t, TEMP2,"(" + str(t) + "," + str(TEMP2) + ")");
         
         }
         
         plotTemp30.beginDraw();
         plotTemp30.drawBackground();
         plotTemp30.drawBox();
         plotTemp30.drawXAxis();
         plotTemp30.drawYAxis();
         plotTemp30.drawTitle();
         plotTemp30.drawGridLines(GPlot.BOTH);
         plotTemp30.drawLines();
         plotTemp30.drawPoints();
         plotTemp30.setPointColor(0);
         plotTemp30.setPointSize(5);
         plotTemp30.endDraw();
          
      }  
  }  
 
    
  // PINTAR LUZ
  void pintarLUZ(){
     
    DateHourLUZ = loadStrings("luz.txt");
    
      if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

         for(int i = DateHourLUZ.length-25; i < DateHourLUZ.length; i++){
           
         println("DateHourLUZ[" + i + "] = " + DateHourLUZ[i]);
         Date0Hour1LUZ2 = split(DateHourLUZ[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1LUZ2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1LUZ2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            LUZ2 = float(Date0Hour1LUZ2[2]);                   //Float HUM de la medida
            println("LUZ2= " + LUZ2);   
                        
           t =i-(DateHourLUZ.length-25);
           
         plotLuz.addPoint(t, LUZ2,"(" + str(t) + "," + str(LUZ2) + ")");
         
         }
         
         plotLuz.beginDraw();
         plotLuz.drawBackground();
         plotLuz.drawBox();
         plotLuz.drawXAxis();
         plotLuz.drawYAxis();
         plotLuz.drawTitle();
         plotLuz.drawGridLines(GPlot.BOTH);
         plotLuz.drawLines();
         plotLuz.drawPoints();
         plotLuz.setPointColor(0);
         plotLuz.setPointSize(5);
         plotLuz.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

       
         for(int i = DateHourLUZ.length-(7*24)-1; i < DateHourLUZ.length; i=i+24){
           
          println("DateHourLUZ[" + i + "] = " + DateHourLUZ[i]);
         Date0Hour1LUZ2 = split(DateHourLUZ[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1LUZ2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1LUZ2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            LUZ2 = float(Date0Hour1LUZ2[2]);                   //Float HUM de la medida
            println("LUZ2= " + LUZ2);   
                            
           t =(i-(DateHourLUZ.length-(7*24)-1))/24;
           
         plotLuz7.addPoint(t, LUZ2,"(" + str(t) + "," + str(LUZ2) + ")");
         
         }
         
         plotLuz7.beginDraw();
         plotLuz7.drawBackground();
         plotLuz7.drawBox();
         plotLuz7.drawXAxis();
         plotLuz7.drawYAxis();
         plotLuz7.drawTitle();
         plotLuz7.drawGridLines(GPlot.BOTH);
         plotLuz7.drawLines();
         plotLuz7.drawPoints();
         plotLuz7.setPointColor(0);
         plotLuz7.setPointSize(5);
         plotLuz7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

         for(int i = DateHourLUZ.length-(30*24)-1; i < DateHourLUZ.length; i=i+24){
  
          println("DateHourLUZ[" + i + "] = " + DateHourLUZ[i]);
         Date0Hour1LUZ2 = split(DateHourLUZ[i], "   ");        //Divido la linea de texto con "   "

            //Fecha
            Date0 = split(Date0Hour1LUZ2[0], "/");              //Divido la linea de texto con "/"
            int day0 = int(Date0[0]);
            println("day0 = " + day0); 
           
            //Hora
            Date0 = split(Date0Hour1LUZ2[1], ":");              //Divido la linea de texto con ":"
            int hour0 = int(Date0[0]);
            println("hour0 = " + hour0); 
            
            //NDVI
            LUZ2 = float(Date0Hour1LUZ2[2]);                   //Float HUM de la medida
            println("LUZ2= " + LUZ2);   
                        
           t =(i-(DateHourLUZ.length-(30*24)-1))/(24);
           
          println("t = " + t);

         plotLuz30.addPoint(t, LUZ2,"(" + str(t) + "," + str(LUZ2) + ")");
         
         }
         
         plotLuz30.beginDraw();
         plotLuz30.drawBackground();
         plotLuz30.drawBox();
         plotLuz30.drawXAxis();
         plotLuz30.drawYAxis();
         plotLuz30.drawTitle();
         plotLuz30.drawGridLines(GPlot.BOTH);
         plotLuz30.drawLines();
         plotLuz30.drawPoints();
         plotLuz30.setPointColor(0);
         plotLuz30.setPointSize(5);
         plotLuz30.endDraw();
          
      }  
  }  
 
    
