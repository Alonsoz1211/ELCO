
/* Captura de video de la Pi NoIR Camera V2 */
GLCapture video;
PImage img;


void camara(GLCapture video, PImage img) {

  setupDone++;

  if (video.available() == true) {
    img.copy(video, 0, 0, video.width, video.height, 40, 50, 600, 380);
    img.updatePixels();
    video.read();
  }

  loadPixels();
  video.loadPixels();
  img.loadPixels(); 

  /* Inicializamos las Matrices Contenedoras */
  float [][] matrizRojo = new float[width][height]; 
  float [][] matrizVerde = new float[width][height]; 
  float [][] matrizAzul = new float[width][height];
  float [][] NDVI = new float [width][height]; 

  //float NDVIMedio;

  float r = 0; 
  float g = 0; 
  float b = 0;

  /* Obtenemos las componentes de color RGB de cada pixel */
  colores(img, r, g, b, matrizRojo, matrizVerde, matrizAzul);

  /* Calculamos el Índice de Vegetación NDVI en cada pixel*/
  NDVI = ndvi(matrizRojo, matrizAzul, NDVI);

  /* Calculamos el NDVI Medio correspondiente a la zona de vegetación */
  NDVIMedio = NDVIMedio(NDVI);

  /* Carga los pixels tratados antes */

  if (!NDVIperiodico || CAMARA) {

    updatePixels();
    /* Indicamos el NDVIMedio */
    textSize(28);
    fill(0); //Color Negro (RGB)
    text("NDVI Medio: " + NDVIMedio, 25, height-15);
  }
}



//Funvion colores Camara NDVI
void colores(PImage img, float r, float g, float b, float [][] MatrizRojo, float [][] MatrizVerde, float [][] MatrizAzul) {

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      int loc = x + y*width;

      /* Guardamos la componente ROJA */
      r = red(img.pixels[loc]); 
      g = green(0); 
      b = blue(0);
      MatrizRojo[x][y] = r;
      //pixels[loc] =  color(r,g,b); //Descomentar si queremos cargar los pixels rojos en el display

      /* Guardamos la componente VERDE */
      r = red(0); 
      g = green(img.pixels[loc]); 
      b = blue(0);
      MatrizVerde[x][y] = g;
      //pixels[loc] =  color(r,g,b); //Descomentar si queremos cargar los pixels verdes en el display

      /* Guardamos la componente AZUL */
      r = red(0); 
      g = green(0); 
      b = blue(img.pixels[loc]);
      MatrizAzul[x][y] = b;
      //pixels[loc] =  color(r,g,b); //Descomentar si queremos cargar los pixels azules en el display
    }
  }
}



//Funcion NDVI
float [][] ndvi (float[][] MatrizRojo, float [][] MatrizAzul, float[][] NDVI) {

  /* El canal ROJO de la Pi NoIR Camera V2 guarda el espectro NIR */
  /* El canal AZUL de la Pi NoIR Camera V2 guarda el espectro VIS */
  /* NDVI = (NIR - VIS) / (NIR + VIS) = (ROJO - AZUL) / (ROJO + AZUL) */

  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {

      int loc = x + y*width;
      NDVI[x][y] = (MatrizRojo[x][y] - MatrizAzul[x][y])/(MatrizRojo[x][y] + MatrizAzul[x][y]);

      /* Elegimos que el NDVI varíe desde el VERDE (NDVI = 1) hasta el ROJO (NDVI = -1) pasando por el AMARILLO (NDVI = 0) */
      /* Por ello el ROJO varía de 0 a 255 para un NDVI de 1 a 0 */
      float r = 255*(NDVI[x][y]-1)/(-2);
      /* Por ello el VERDE varía de 255 a 0 para un NDVI de 0 a -1 */
      float g = 255*(NDVI[x][y]+1)/(2);

      if (!NDVIperiodico || CAMARA) {

        if (x<40||x>639||y<50||y>429) {
          pixels[loc]=color(255, 255, 255);
        } else if (NDVI[x][y]<=1 && NDVI[x][y]>0) {
          pixels[loc]=color(r, 255, 0);
        } else {
          pixels[loc]=color(255, g, 0);

        }
      }
    }
  }

  return NDVI;
}



//Funcion NDVI medio
float NDVIMedio (float[][] NDVI) {

  float NDVIMedio = 0; 
  float NDVISuma = 0;
  int cuentas = 0;

  /* Recorremos el mapa NDVI para localizar los pixels correspondientes a vegetación */
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {     
      /* Consideramos vegetación NDVIs superiores a 0.2  */
      if (NDVI[x][y]>=0.2) {
        NDVISuma+= NDVI[x][y];
        cuentas ++;
      }
    }
  }

  /* Calculamos la media en fución del números de pixels recogidos */
  NDVIMedio = NDVISuma/cuentas;
  return NDVIMedio;
}
