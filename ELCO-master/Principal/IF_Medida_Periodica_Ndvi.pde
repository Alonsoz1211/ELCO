
  //Funcion que toma medidas periodicas del NDVI
  void MEDIDA_PERIODICA_NDVI(){

    if(PC_Time[0] == 12 && PC_Time[1] == 00 && PC_Time[2] >= 0 && PC_Time[2] <= 30 && !medidoNDVI){ //Medimos solo a las 12:00:00 de cada dia
      
                NDVIperiodico = true;                                //Activamos el Flag de medida periodica
                println("NDVIperiodico = true");

      // Hacemos el setup de la camara si no esta hecho
      
          if(setupDone==0){
            String[] cameras = GLCapture.list();
            img = createImage(width, height, RGB);
              if (cameras.length == 0) {
                println("No hay cámaras conectadas!");
                exit();
              } else {
                println("Cámaras disponibles:");
                for (int i = 0; i < cameras.length; i++) {
                println(cameras[i]);
              }
            video = new GLCapture(this, cameras[0]);
            video.start(); 
            }
          }
          
        camara(video,img);                                            //Llamamos a la funcion camara
        //println("ndvi.txt",  DD_MM_YY[0] + "/" + DD_MM_YY[1] + "/" + DD_MM_YY[2] + "   " + PC_Time[0] + ":" + PC_Time[1] + "   " + NDVIMedio);
          if(PC_Time[2] == 30){                                     //Tomamos la medida a los 30 segundos de que se abra la camara (estabilidad)
            medidoNDVI = true;                                      //Activamos el Flag de que el NDVI ha sido medido
            String NDVIMedioString = String.valueOf(NDVIMedio);     //Pasamos el NDVI medio a String
            appendTextToFile("ndvi.txt",  DD_MM_YY[0] + "/" + DD_MM_YY[1] + "/" + DD_MM_YY[2] + "   " + PC_Time[0] + ":" + PC_Time[1] + "   " + NDVIMedioString);          //Pasamos el NDVI medio de la imagen al archivo de texto
            println(NDVIMedioString);
            
              if(!CAMARA){                                          //Si en este momento no estamos en la pestaña de camara
                video.close();                                         //Se para la camara
                setupDone = 0;                                      //Y se indica que no hay hecho setup
              }
         
            NDVIperiodico = false;                                  //Indicamos que termina la funcion de medida periodica 
            println("NDVIperiodico = false");

          }
      
    }else if(PC_Time[0] == 12 && PC_Time[1] == 10){                 //Pasados 10 inutos, indicamos que la medida no esta tomada
        medidoNDVI = false;                                         //indicando que esta esperando a la siguiente
    }
  }  
  
  //Funcion que toma medidas periodicas de Humedad, Temperatura y Luz
  void MEDIDAS_PERIODICAS_ARDUINO(){
      
    //Las medidas de HUMEDAD se toman cada hora en el minuto 0       
      if(PC_Time[1] == 00 && PC_Time[2] >= 0 && PC_Time[2] <= 30 && !medidoHum){ //Medimos solo a las horas exactas
        
          ARDUINOperiodico=true;
        
               if(PC_Time[2] == 30){                                                   //Tomamos la medida a los 30 segundos de que se abra la camara (estabilidad)

                  medidoHum = true;                                                     //Activamos el Flag de medida periodica
                 
                  String humedadString = String.valueOf(humActual);                    //Pasamos el valor medido a String
                  appendTextToFile("humedad.txt",  DD_MM_YY[0] + "/" + DD_MM_YY[1] + "/" + DD_MM_YY[2] + "   " + PC_Time[0] + ":" + PC_Time[1] + "   " + humedadString);     //Pasamos el valor de humedad al archivo de texto      

                  ARDUINOperiodico = false;                                            //Indicamos que termina la funcion de medida periodica 
                } 
                
                if(PC_Time[1] == 10 && PC_Time[2] == 00){                              //Pasados 10 minutos, indicamos que la medida no esta tomada
                     medidoHum = false;                                                //indicando que esta esperando a la siguiente
                }
      }
              
      //Las medidas de TEMPERATURA se toman cada hora en el minuto 20      
      if(PC_Time[1] == 20 && PC_Time[2] >= 0 && PC_Time[2] <= 30 && !medidoTemp){ //Medimos solo a las horas exactas
        
          ARDUINOperiodico=true;
        
               if(PC_Time[2] == 30){                                                   //Tomamos la medida a los 30 segundos de que se abra la camara (estabilidad)

                  medidoTemp = true;                                                  //Activamos el Flag de medida periodica

                  String temperaturaString = String.valueOf(tempActual);                //Pasamos el valor medido a String
                  appendTextToFile("temperatura.txt", DD_MM_YY[0] + "/" + DD_MM_YY[1] + "/" + DD_MM_YY[2] + "   " + PC_Time[0] + ":" + PC_Time[1] + "   " + temperaturaString);              //Pasamos el valor de temperatura al archivo de texto
               
                  ARDUINOperiodico = false;                                            //Indicamos que termina la funcion de medida periodica 
                }
                
                if(PC_Time[1] == 30 && PC_Time[2] == 00){                              //Pasados 10 minutos, indicamos que la medida no esta tomada
                     medidoTemp = false;                                               //indicando que esta esperando a la siguiente
                }
      }     
         
      //Las medidas de LUMINOSIDAD se toman cada hora en el minuto 40               
      if(PC_Time[1] == 40 && PC_Time[2] >= 0 && PC_Time[2] <= 30 && !medidoLuz){ //Medimos solo a las horas exactas
        
          ARDUINOperiodico=true;
        
               if(PC_Time[2] == 30){                                                 //Tomamos la medida a los 30 segundos de que se abra la camara (estabilidad)

                  medidoLuz = true;                                                  //Activamos el Flag de medida periodica
          
                  String luzString = String.valueOf(lightActual);                      //Pasamos el valor medido a String
                  appendTextToFile("luz.txt", DD_MM_YY[0] + "/" + DD_MM_YY[1] + "/" + DD_MM_YY[2] + "   " + PC_Time[0] + ":" + PC_Time[1] + "   " + luzString);                            //Pasamos el valor de luz al archivo de texto
                  
                  ARDUINOperiodico = false;                                          //Indicamos que termina la funcion de medida periodica 
               }
               
               if(PC_Time[1] == 50 && PC_Time[2] == 00){                             //Pasados 10 minutos, indicamos que la medida no esta tomada
                   medidoLuz = false;                                                //indicando que esta esperando a la siguiente     
               }
      }
  }
