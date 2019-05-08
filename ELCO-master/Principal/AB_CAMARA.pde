
  void CAMARA(){

   background(255, 255, 255);  // Color de fondo pantalla


    camara(video,img);

    
    //Mostramos, ocultamos y coloreamos los botones
    botonC.setVisible(true);
      botonC.setEnabled(false);
      botonC.setLocalColorScheme(G4P.RED_SCHEME);
      botonC.setLocalColor(2, color(0));    
    botonS.setVisible(true);
      botonS.setLocalColorScheme(G4P.ORANGE_SCHEME);
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
    
    //Boton OFF
    botonOFF.setVisible(true);
    botonOFF.setLocalColorScheme(G4P.GREEN_SCHEME);
    botonOFF.setLocalColor(2, color(0));
    
    
  // ACTIVACIÓN Y DESACTIVACIÓN FLAGS

   /*
      if(IF_Camara){  // Si la variable "IF_Camara" está activa (true)
        CAMARA=false;
        CAMARA=true;
        setupDone=0;
        video.close();
        IF_Camara=false;
      }
        */
      if(IF_Sensores){  // Si la variable "IF_Sensores" está activa (true)
        botonC.setEnabled(true);
        CAMARA=false;
        SENSORES=true;
         // Por si coincide con una medida periodica
          if(!NDVIperiodico){
            setupDone=0;
            video.close();
          }
          
        IF_Sensores=false;
      }  
      
      if(IF_Historial){  // Si la variable "IF_Historial" está activa (true)
        botonC.setEnabled(true);
        CAMARA=false;
        HISTORIAL=true;
         // Por si coincide con una medida periodica
          if(!NDVIperiodico){
            setupDone=0;
            video.close();
          }
        
        IF_Historial=false;
      }
        
      if(IF_About){  // Si la variable "IF_About" está activa (true)        
        botonC.setEnabled(true);
        CAMARA=false;
        ABOUT=true;
         // Por si coincide con una medida periodica
          if(!NDVIperiodico){
            setupDone=0;
            video.close();
          }
          
        IF_About=false;
      }
      
// Escritura de la fecha y hora
  fill(31, 125, 222);  // Determinamos color de la letra
  textFont(font22);  // Determinamos tipo de fuente
  text(curr_date, 75, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  text(curr_time, 300, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  
  

  

  
  }
      
    
