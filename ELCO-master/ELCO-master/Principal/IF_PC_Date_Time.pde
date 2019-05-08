  
  // Función para obtener la fecha del ordenador
  String PC_Date(){
   DD_MM_YY[2] = year();    
   DD_MM_YY[1] = month(); 
   DD_MM_YY[0] = day(); 
   return join(nf(DD_MM_YY, 2), " - ");
  }
  
    
  // Función para obtener la hora del ordenador
  String PC_Time(){
   PC_Time[2] = second();  // Valores de 0 a 59
   PC_Time[1] = minute();  // Valores de 0 a 59
   PC_Time[0] = hour();    // Valores de 0 a 23
   return join(nf(PC_Time, 2), " : ");  // Devolvemos la hora completa indicando que entre cada número se impriman ":"
  }
