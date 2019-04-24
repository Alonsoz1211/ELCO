
  void HISTORIAL(){
    
   background(255, 255, 255);  // Color de fondo pantalla
        
    
    //Mostramos, ocultamos y coloreamos los botones
    botonC.setVisible(true);
      botonC.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonC.setLocalColor(2, color(0));  
    botonS.setVisible(true);
      botonS.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonS.setLocalColor(2, color(0));
    botonH.setVisible(true);
      botonH.setEnabled(false);
      botonH.setLocalColorScheme(G4P.RED_SCHEME);
      botonH.setLocalColor(2, color(0));  
    botonA.setVisible(true);
      botonA.setLocalColorScheme(G4P.ORANGE_SCHEME);
      botonA.setLocalColor(2, color(0));  

    
 
   
   
  // ACTIVACIÓN Y DESACTIVACIÓN FLAGS

      if(IF_G_NDVI){  // Si la variable "IF_G_NDVI" está activa (true)
        botonGNDVI.setVisible(true);
          botonGNDVI.setEnabled(false);
          botonGNDVI.setLocalColorScheme(G4P.GREEN_SCHEME);
          botonGNDVI.setLocalColor(2, color(0));  
        botonGHum.setVisible(true);
          botonGHum.setEnabled(true);
          botonGHum.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGHum.setLocalColor(2, color(0));  
        botonGTemp.setVisible(true);
          botonGTemp.setEnabled(true);
          botonGTemp.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGTemp.setLocalColor(2, color(0));  
        botonGLuz.setVisible(true);
          botonGLuz.setEnabled(true);
          botonGLuz.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGLuz.setLocalColor(2, color(0)); 
                
              //Botones Tamaño Grafica
              boton24HORAS.setVisible(false);
              boton7DIAS.setVisible(false);
              boton30DIAS.setVisible(false);
              
        pintarNDVI();  
      }
      
      if(IF_G_Hum){  // Si la variable "IF_G_Hum" está activa (true)
        botonGNDVI.setVisible(true);
          botonGNDVI.setEnabled(true);
          botonGNDVI.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGNDVI.setLocalColor(2, color(0));  
        botonGHum.setVisible(true);
          botonGHum.setEnabled(false);
          botonGHum.setLocalColorScheme(G4P.GREEN_SCHEME);
          botonGHum.setLocalColor(2, color(0));  
        botonGTemp.setVisible(true);
          botonGTemp.setEnabled(true);
          botonGTemp.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGTemp.setLocalColor(2, color(0));  
        botonGLuz.setVisible(true);
          botonGLuz.setEnabled(true);
          botonGLuz.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGLuz.setLocalColor(2, color(0)); 
          
        if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(false);
              boton24HORAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarHUM();  
            
        }  
        
        if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton7DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarHUM();  
            
        }  
        
        if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton30DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarHUM();  
            
        }  
      }
      
      if(IF_G_Temp){  // Si la variable "IF_G_Temp" está activa (true)
        botonGNDVI.setVisible(true);
          botonGNDVI.setEnabled(true);
          botonGNDVI.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGNDVI.setLocalColor(2, color(0));  
        botonGHum.setVisible(true);
          botonGHum.setEnabled(true);
          botonGHum.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGHum.setLocalColor(2, color(0));  
        botonGTemp.setVisible(true);
          botonGTemp.setEnabled(false);
          botonGTemp.setLocalColorScheme(G4P.GREEN_SCHEME);
          botonGTemp.setLocalColor(2, color(0));  
        botonGLuz.setVisible(true);
          botonGLuz.setEnabled(true);
          botonGLuz.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGLuz.setLocalColor(2, color(0)); 
        
        if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(false);
              boton24HORAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarTEMP();  
            
        }  
        
        if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton7DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarTEMP();  
            
        }  
        
        if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton30DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarTEMP();  
            
        }          
      }
      
      if(IF_G_Luz){  // Si la variable "IF_G_Luz" está activa (true)
        botonGNDVI.setVisible(true);
          botonGNDVI.setEnabled(true);
          botonGNDVI.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGNDVI.setLocalColor(2, color(0));  
        botonGHum.setVisible(true);
          botonGHum.setEnabled(true);
          botonGHum.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGHum.setLocalColor(2, color(0));  
        botonGTemp.setVisible(true);
          botonGTemp.setEnabled(true);
          botonGTemp.setLocalColorScheme(G4P.YELLOW_SCHEME);
          botonGTemp.setLocalColor(2, color(0));  
        botonGLuz.setVisible(true);
          botonGLuz.setEnabled(false);
          botonGLuz.setLocalColorScheme(G4P.GREEN_SCHEME);
          botonGLuz.setLocalColor(2, color(0)); 

        if(IF_G_24){  // Si la variable "IF_G_24" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(false);
              boton24HORAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarLUZ();  
            
        }  
        
        if(IF_G_7){  // Si la variable "IF_G_7" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton7DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(true);
              boton30DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarLUZ();  
            
        }  
        
        if(IF_G_30){  // Si la variable "IF_G_30" está activa (true)

            boton24HORAS.setVisible(true);
              boton24HORAS.setEnabled(true);
              boton24HORAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton24HORAS.setLocalColor(2, color(0));  
            boton7DIAS.setVisible(true);
              boton7DIAS.setEnabled(true);
              boton7DIAS.setLocalColorScheme(G4P.YELLOW_SCHEME);
              boton7DIAS.setLocalColor(2, color(0));  
            boton30DIAS.setVisible(true);
              boton30DIAS.setEnabled(false);
              boton30DIAS.setLocalColorScheme(G4P.GREEN_SCHEME);
              boton30DIAS.setLocalColor(2, color(0)); 
            pintarLUZ();  
            
        }  
      }


      if(IF_Camara){  // Si la variable "IF_Camara" está activa (true)
        botonH.setEnabled(true);
        HISTORIAL=false;
        CAMARA=true;
        IF_Camara=false;
        IF_G_NDVI=true;
        IF_G_Hum=false;  
        IF_G_Temp=false;  
        IF_G_Luz=false; 
        IF_G_24=true; 
        IF_G_7=false;  
        IF_G_30=false; 
      }
      
     
      if(IF_Sensores){  // Si la variable "IF_Sensores" está activa (true)
        botonH.setEnabled(true);
        HISTORIAL=false;
        SENSORES=true;
        IF_Sensores=false;
        IF_G_NDVI=true;
        IF_G_Hum=false;  
        IF_G_Temp=false;  
        IF_G_Luz=false; 
        IF_G_24=true; 
        IF_G_7=false;  
        IF_G_30=false; 
  }  
      
      /*
      if(IF_Historial){  // Si la variable "IF_Historial" está activa (true)
        HISTORIAL=false;
        HISTORIAL=true;
        IF_Historial=false;
      }
      */
        
      if(IF_About){  // Si la variable "IF_About" está activa (true)
        botonH.setEnabled(true);
        HISTORIAL=false;
        ABOUT=true;
        IF_About=false;
        IF_G_NDVI=true;
        IF_G_Hum=false;  
        IF_G_Temp=false;  
        IF_G_Luz=false; 
        IF_G_24=true; 
        IF_G_7=false;  
        IF_G_30=false; 
      }
 
  
         
  // Escritura de la fecha y hora
  fill(31, 125, 222);  // Determinamos color de la letra
  textFont(font22);  // Determinamos tipo de fuente
  text(curr_date, 25, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  text(curr_time, 250, 30);  // Imprimimos el contenido de la variable y lo posicionamos
  
  }
