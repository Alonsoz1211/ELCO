 
 public void handleButtonEvents(GButton button, GEvent event) {  
 
  // If Button OFF is pushed
  if ( button == botonOFF && event == GEvent.CLICKED){
    exit();
  }
  
  // If Button CAMARA is pushed
  if ( button == botonC && event == GEvent.CLICKED){
    IF_Camara=true;
  }
  
  // If Button SENSORES is pushed
  if ( button == botonS && event == GEvent.CLICKED){
    IF_Sensores=true;
  }
  
  // If Button HISTORIAL is pushed
  if ( button == botonH && event == GEvent.CLICKED){
    IF_Historial=true;
  }
  
  // If Button ABOUT is pushed
  if ( button == botonA && event == GEvent.CLICKED){
    IF_About=true;
  }

  // If Button NDVI is pushed
  if ( button == botonGNDVI && event == GEvent.CLICKED){    
    IF_G_NDVI=true;
    IF_G_Hum=false;  
    IF_G_Temp=false;  
    IF_G_Luz=false; 

  }
  
  // If Button Humedad is pushed
  if ( button == botonGHum && event == GEvent.CLICKED){
    IF_G_NDVI=false;
    IF_G_Hum=true;  
    IF_G_Temp=false;  
    IF_G_Luz=false;   
  }
  
    // If Button Temperatura is pushed
  if ( button == botonGTemp && event == GEvent.CLICKED){
    IF_G_NDVI=false;
    IF_G_Hum=false;  
    IF_G_Temp=true;  
    IF_G_Luz=false; 
  }
  
  // If Button Luz is pushed
  if ( button == botonGLuz && event == GEvent.CLICKED){
    IF_G_NDVI=false;
    IF_G_Hum=false;  
    IF_G_Temp=false;  
    IF_G_Luz=true; 
  }
  
    // If Button 24 HORAS is pushed
  if ( button == boton24HORAS && event == GEvent.CLICKED){
    IF_G_24=true; 
    IF_G_7=false;      
    IF_G_30=false;  
}
    // If Button 7 DIAS is pushed
  if ( button == boton7DIAS && event == GEvent.CLICKED){
    IF_G_24=false; 
    IF_G_7=true;  
    IF_G_30=false;  
}
    // If Button 30 DIAS is pushed
  if ( button == boton30DIAS && event == GEvent.CLICKED){
    IF_G_24=false; 
    IF_G_7=false;  
    IF_G_30=true;  
}
}
 
