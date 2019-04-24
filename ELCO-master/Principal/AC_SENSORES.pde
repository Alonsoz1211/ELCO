
  void SENSORES(){
    
   background(255, 255, 255);  // Color de fondo pantalla

   sensoresArduino(true,true,true);

    //Representar medida NDVI
    //Creamos array y lo rellenamos con entrada de datos
    /*     float[] FloatNDVIArray30 = float(loadStrings("ndvi.txt"));
         String ultimaMedida = str(FloatNDVIArray30[FloatNDVIArray30.length-1]);
          fill(0, 0, 0);  // Determinamos color de la letra
          textFont(font22);  // Determinamos tipo de fuente
          text("NDVI Actual = " + ultimaMedida, 50, height-50); 
     */            
    //Mostramos, ocultamos y coloreamos los botones
    botonC.setVisible(true);
      botonC.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonC.setLocalColor(2, color(0));  
    botonS.setVisible(true);
      botonS.setEnabled(false);
      botonS.setLocalColorScheme(G4P.RED_SCHEME);
      botonS.setLocalColor(2, color(0));
    botonH.setVisible(true);
      botonH.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonH.setLocalColor(2, color(0));  
    botonA.setVisible(true);
      botonA.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonA.setLocalColor(2, color(0));  


    //Botonoes Datos Graficas
    botonGNDVI.setVisible(false);
    botonGHum.setVisible(false);
    botonGTemp.setVisible(false);
    botonGLuz.setVisible(false);
      
    //Botones Tamaño Grafica
    boton24HORAS.setVisible(false);
    boton7DIAS.setVisible(false);
    boton30DIAS.setVisible(false); 

  // ACTIVACIÓN Y DESACTIVACIÓN FLAGS

      if(IF_Camara){  // Si la variable "IF_Camara" está activa (true)
        botonS.setEnabled(true);
        SENSORES=false;
        CAMARA=true;
        IF_Camara=false;
      }
      
     /*
      if(IF_Sensores){  // Si la variable "IF_Sensores" está activa (true)
        CAMARA=false;
        SENSORES=true;
        setupDone=0;
        cam.stop();
        IF_Sensores=false;
      }  
      */
      
      if(IF_Historial){  // Si la variable "IF_Historial" está activa (true)
        botonS.setEnabled(true);
        SENSORES=false;
        HISTORIAL=true;
        IF_Historial=false;
      }
        
      if(IF_About){  // Si la variable "IF_About" está activa (true)
        botonS.setEnabled(true);
        SENSORES=false;
        ABOUT=true;
        IF_About=false;
      }
  
  
    
  
  // Escritura de la fecha y hora
  fill(31, 125, 222);  // Determinamos color de la letra
  textFont(font22);  // Determinamos tipo de fuente
  text(curr_date, 25, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  text(curr_time, 250, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  
  
}

  
