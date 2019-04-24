
  // PINTAR NDVI
  void pintarNDVI(){
      
      //Creamos array y lo rellenamos con entrada de datos
     float[] FloatNDVIArray1 = float(loadStrings("ndvi.txt"));

     for(int i = FloatNDVIArray1.length-31; i < FloatNDVIArray1.length; i++){
       
       println("FloatNDVIArray1[" + i + "] = " + FloatNDVIArray1[i]);

       t =i-(FloatNDVIArray1.length-31);
       
     plotNDVI.addPoint(t, FloatNDVIArray1[i],"(" + str(t) + "," + str(FloatNDVIArray1[i]) + ")");
     
     }
     
     plotNDVI.beginDraw();
     plotNDVI.drawBackground();
     plotNDVI.drawBox();
     plotNDVI.drawXAxis();
     plotNDVI.drawYAxis();
     plotNDVI.drawTitle();
     plotNDVI.drawGridLines(GPlot.BOTH);
     plotNDVI.drawLines();
     plotNDVI.endDraw();
      
     // flagpintar=false;
  }  
 
  

  // PINTAR HUM
  void pintarHUM(){
          
      if(IF_G_24){  // Si la variable "IF_G_NDVI" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatHUMArray24 = float(loadStrings("humedad.txt"));
    
         for(int i = FloatHUMArray24.length-25; i < FloatHUMArray24.length; i++){
           
           println("FloatHUMArray24[" + i + "] = " + FloatHUMArray24[i]);
    
           t =i-(FloatHUMArray24.length-25);
           
         plotHum.addPoint(t, FloatHUMArray24[i],"(" + str(t) + "," + str(FloatHUMArray24[i]) + ")");
         
         }
         
         plotHum.beginDraw();
         plotHum.drawBackground();
         plotHum.drawBox();
         plotHum.drawXAxis();
         plotHum.drawYAxis();
         plotHum.drawTitle();
         plotHum.drawGridLines(GPlot.BOTH);
         plotHum.drawLines();
         plotHum.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_NDVI" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatHUMArray7 = float(loadStrings("humedad.txt"));
    
         for(int i = FloatHUMArray7.length-(7*24)-1; i < FloatHUMArray7.length; i=i+24){
           
           println("FloatHUMArray7[" + i + "] = " + FloatHUMArray7[i]);
    
           t =(i-(FloatHUMArray7.length-(7*24)-1))/24;
           
         plotHum7.addPoint(t, FloatHUMArray7[i],"(" + str(t) + "," + str(FloatHUMArray7[i]) + ")");
         
         }
         
         plotHum7.beginDraw();
         plotHum7.drawBackground();
         plotHum7.drawBox();
         plotHum7.drawXAxis();
         plotHum7.drawYAxis();
         plotHum7.drawTitle();
         plotHum7.drawGridLines(GPlot.BOTH);
         plotHum7.drawLines();
         plotHum7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_NDVI" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatHUMArray30 = float(loadStrings("humedad.txt"));
    
         for(int i = FloatHUMArray30.length-(30*24)-1; i < FloatHUMArray30.length; i=i+24){
           
           println("FloatHUMArray30[" + i + "] = " + FloatHUMArray30[i]);
    
           t =(i-(FloatHUMArray30.length-(30*24)-1))/24;
           
         plotHum30.addPoint(t, FloatHUMArray30[i],"(" + str(t) + "," + str(FloatHUMArray30[i]) + ")");
         
         }
         
         plotHum30.beginDraw();
         plotHum30.drawBackground();
         plotHum30.drawBox();
         plotHum30.drawXAxis();
         plotHum30.drawYAxis();
         plotHum30.drawTitle();
         plotHum30.drawGridLines(GPlot.BOTH);
         plotHum30.drawLines();
         plotHum30.endDraw();
          
      }  
  }  
 
    
  // PINTAR TEMP
  void pintarTEMP(){
      
      if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatTEMPArray24 = float(loadStrings("temperatura.txt"));
    
         for(int i = FloatTEMPArray24.length-25; i < FloatTEMPArray24.length; i++){
           
           println("FloatTEMPArray24[" + i + "] = " + FloatTEMPArray24[i]);
    
           t =i-(FloatTEMPArray24.length-25);
           
         plotTemp.addPoint(t, FloatTEMPArray24[i],"(" + str(t) + "," + str(FloatTEMPArray24[i]) + ")");
         
         }
         
         plotTemp.beginDraw();
         plotTemp.drawBackground();
         plotTemp.drawBox();
         plotTemp.drawXAxis();
         plotTemp.drawYAxis();
         plotTemp.drawTitle();
         plotTemp.drawGridLines(GPlot.BOTH);
         plotTemp.drawLines();
         plotTemp.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatTEMPArray7 = float(loadStrings("temperatura.txt"));
    
         for(int i = FloatTEMPArray7.length-(7*24)-1; i < FloatTEMPArray7.length; i=i+24){
           
           println("FloatTEMPArray7[" + i + "] = " + FloatTEMPArray7[i]);
    
           t =(i-(FloatTEMPArray7.length-(7*24)-1))/24;
           
         plotTemp7.addPoint(t, FloatTEMPArray7[i],"(" + str(t) + "," + str(FloatTEMPArray7[i]) + ")");
         
         }
         
         plotTemp7.beginDraw();
         plotTemp7.drawBackground();
         plotTemp7.drawBox();
         plotTemp7.drawXAxis();
         plotTemp7.drawYAxis();
         plotTemp7.drawTitle();
         plotTemp7.drawGridLines(GPlot.BOTH);
         plotTemp7.drawLines();
         plotTemp7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatTEMPArray30 = float(loadStrings("temperatura.txt"));
    
         for(int i = FloatTEMPArray30.length-(30*24)-1; i < FloatTEMPArray30.length; i=i+24){
           
           println("FloatTEMPArray30[" + i + "] = " + FloatTEMPArray30[i]);
    
           t =(i-(FloatTEMPArray30.length-(30*24)-1))/24;
           
         plotTemp30.addPoint(t, FloatTEMPArray30[i],"(" + str(t) + "," + str(FloatTEMPArray30[i]) + ")");
         
         }
         
         plotTemp30.beginDraw();
         plotTemp30.drawBackground();
         plotTemp30.drawBox();
         plotTemp30.drawXAxis();
         plotTemp30.drawYAxis();
         plotTemp30.drawTitle();
         plotTemp30.drawGridLines(GPlot.BOTH);
         plotTemp30.drawLines();
         plotTemp30.endDraw();
          
      }  
  }  
 
    
  // PINTAR LUZ
  void pintarLUZ(){
     
      if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatLUZArray24 = float(loadStrings("luz.txt"));
    
         for(int i = FloatLUZArray24.length-25; i < FloatLUZArray24.length; i++){
           
           println("FloatLUZArray24[" + i + "] = " + FloatLUZArray24[i]);
    
           t =i-(FloatLUZArray24.length-25);
           
         plotLuz.addPoint(t, FloatLUZArray24[i],"(" + str(t) + "," + str(FloatLUZArray24[i]) + ")");
         
         }
         
         plotLuz.beginDraw();
         plotLuz.drawBackground();
         plotLuz.drawBox();
         plotLuz.drawXAxis();
         plotLuz.drawYAxis();
         plotLuz.drawTitle();
         plotLuz.drawGridLines(GPlot.BOTH);
         plotLuz.drawLines();
         plotLuz.endDraw();
          
      }    
      
      if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatLUZArray7 = float(loadStrings("luz.txt"));
    
         for(int i = FloatLUZArray7.length-(7*24)-1; i < FloatLUZArray7.length; i=i+24){
           
           println("FloatLUZArray7[" + i + "] = " + FloatLUZArray7[i]);
    
           t =(i-(FloatLUZArray7.length-(7*24)-1))/24;
           
         plotLuz7.addPoint(t, FloatLUZArray7[i],"(" + str(t) + "," + str(FloatLUZArray7[i]) + ")");
         
         }
         
         plotLuz7.beginDraw();
         plotLuz7.drawBackground();
         plotLuz7.drawBox();
         plotLuz7.drawXAxis();
         plotLuz7.drawYAxis();
         plotLuz7.drawTitle();
         plotLuz7.drawGridLines(GPlot.BOTH);
         plotLuz7.drawLines();
         plotLuz7.endDraw();
          
      }  
      
      if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

          //Creamos array y lo rellenamos con entrada de datos
         float[] FloatLUZArray30 = float(loadStrings("luz.txt"));
    
         for(int i = FloatLUZArray30.length-(30*24)-1; i < FloatLUZArray30.length; i=i+24){
           
           println("FloatLUZArray30[" + i + "] = " + FloatLUZArray30[i]);
    
           t =(i-(FloatLUZArray30.length-(30*24)-1))/(24);
           
          println("t = " + t);

         plotLuz30.addPoint(t, FloatLUZArray30[i],"(" + str(t) + "," + str(FloatLUZArray30[i]) + ")");
         
         }
         
         plotLuz30.beginDraw();
         plotLuz30.drawBackground();
         plotLuz30.drawBox();
         plotLuz30.drawXAxis();
         plotLuz30.drawYAxis();
         plotLuz30.drawTitle();
         plotLuz30.drawGridLines(GPlot.BOTH);
         plotLuz30.drawLines();
         plotLuz30.endDraw();
          
      }  
  }  
 
    
