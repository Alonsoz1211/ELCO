import processing.video.*;
import processing.core.*;
import processing.serial.*;    
import grafica.*;
import g4p_controls.*;
import processing.net.*;
import java.io.FileWriter;
import java.io.*;
import java.io.BufferedWriter;
import meter.*;

  Serial port;                                           //Puerto serie para comunicacion con Arduino
  String[] list;
  
  Meter m, m2, m3;                                       //Displays de los sensores

  //Creacion variables sensores
  float tempActual = 0;                                        //Variable de temperatura
  float humActual = 0;                                         //Variable de humedad
  float lightActual = 0;                                       //Variable de luminosidad

  int[] PC_Time = new int[3];                            // Variable para registrar la hora
  int[] DD_MM_YY = new int[3];                           // Variable para registrar la fecha
  PFont font1, font2, font12, font22, font44, font140, font10;   // Declaración de los textos a usar
  String curr_time, curr_date;                           // Variables para obtención de tiempo, hora, texto informativo inferior y nombre log
  PImage logoPLANTHY, logoUPM, logoETSIT;                                           // Creamos un objeto para cargar una imagen 

  //Arrays pintar graficas
  String[] Date0Hour1Ndvi2;
  String[] DateHourNdvi;  
  String[] Date0Hour1HUM2;
  String[] DateHourHUM;  
  String[] Date0Hour1TEMP2;
  String[] DateHourTEMP;  
  String[] Date0Hour1LUZ2;
  String[] DateHourLUZ;
  String[] Date0;
  float Ndvi2;
  float HUM2;
  float TEMP2;
  float LUZ2;
  
  //Declaramos botones
  GButton botonC;
  GButton botonS;
  GButton botonH;
  GButton botonA;
  GButton botonGNDVI;
  GButton botonGHum;
  GButton botonGTemp;
  GButton botonGLuz;
  GButton boton24HORAS;
  GButton boton7DIAS;
  GButton boton30DIAS;
  GButton botonOFF;
    
  // Plot from grafica library
  GPlot plotNDVI;
  GPlot plotHum;
  GPlot plotHum7;
  GPlot plotHum30;
  GPlot plotTemp;
  GPlot plotTemp7;
  GPlot plotTemp30;
  GPlot plotLuz;
  GPlot plotLuz7;
  GPlot plotLuz30;
  
  int t;
  
  // Datos Botones
  int buttonSize = 120;          // Diameter of rect
  int button2Height = 50;        // Diameter of rect
  int button2Width = 170;        // Diameter of rect
  int button3Width = 50;         // Diameter of rect

  
  // Datos nombres ABOUT
  int nombresX, nombresY;        // Position of Names Text

  float NDVIMedio;               //Valor medio de NDVI



  /* FLAGS */
  int setupDone=0;              //Indicador de que el setup de la camara se ha hecho (>0) o no (0)
  
  
  
  /* Flags de la intefaz */
  boolean INICIO=true;          // FLAG Pantalla Inicio
  boolean CAMARA=false;         // FLAG Pantalla Camara
  boolean SENSORES=false;       // FLAG Pantalla Sensores
  boolean HISTORIAL=false;      // FLAG Pantalla Historial
  boolean ABOUT=false;          // FLAG Pantalla About


    /* Flags de boton */
  boolean IF_Camara=false;      // Camara activo/no activo
  boolean IF_Sensores=false;    // Sensores activo/no activo
  boolean IF_Historial=false;   // Historial activo/no activo
  boolean IF_About=false;       // About activo/no activo
  boolean IF_G_NDVI=true;       // Grafica NDVI activo/no activo
  boolean IF_G_Hum=false;       // Grafica Humedad activo/no activo
  boolean IF_G_Temp=false;      // Grafica Temperatura activo/no activo
  boolean IF_G_Luz=false;       // Grafica Luz activo/no activo
  boolean IF_G_24=true;         // Grafica 24 Horas activo/no activo
  boolean IF_G_7=false;         // Grafica 7 Dias activo/no activo
  boolean IF_G_30=false;        // Grafica 30 Dias activo/no activo


  
  /* Flags de los sensores */
  boolean NDVIperiodico = false;
  boolean ARDUINOperiodico = false;
  
  /* Flags mediciones */
  boolean medidoNDVI = false;
  boolean medidoHum = false;
  boolean medidoTemp = false;
  boolean medidoLuz = false;

  


void setup() {
    
  /* SETUP INTERFAZ */
  
      // Creamos interface del tamaño máximo de la pantalla
      size(800, 480);  
      
      // Creamos la PImage del logo
      logoPLANTHY=loadImage("LOGO_PLANTHY.jpg");  // Cargamos imagen en la varibale
      logoUPM=loadImage("ESCUDO_UPM.png");  // Cargamos imagen en la varibale
      logoETSIT=loadImage("LOGO_ESCUELA.png");  // Cargamos imagen en la varibale
    
      // Creamos las fuentes que vamos a usar
      font1 = loadFont("SansSerif.plain.vlw");
      font2 = loadFont("SansSerif.bold.vlw");
      font22 = loadFont("Monospaced-22.vlw");  // Cargamos estilo de letra
      font44 = loadFont("Monospaced-32.vlw");  // Cargamos estilo de letra
      font140 = loadFont("Avenir-Light-140.vlw");  // Cargamos estilo de letra
      font10 = loadFont("Arial Bold.vlw");  // Cargamos estilo de letra
      
      
      /* SETUP POSICIONES ABOUT */
      nombresX = 450;
      nombresY = 350;
      
  
  
  /* SETUP BOTONES */
  
      // Initialize Buttons
      botonC = new GButton(this, width-buttonSize, 0, buttonSize, buttonSize, "CAMARA"); 
      botonS = new GButton(this, width-buttonSize, buttonSize, buttonSize, buttonSize, "SENSORES");
      botonH = new GButton(this, width-buttonSize, buttonSize*2, buttonSize, buttonSize, "HISTORIAL"); 
      botonA = new GButton(this, width-buttonSize, buttonSize*3, buttonSize, buttonSize, "ABOUT");
      botonGNDVI = new GButton(this, 0, height-button2Height, button2Width, button2Height, "NDVI");
      botonGHum = new GButton(this, button2Width, height-button2Height, button2Width, button2Height, "HUMEDAD");
      botonGTemp = new GButton(this, button2Width*2, height-button2Height, button2Width, button2Height, "TEMPERATURA");
      botonGLuz = new GButton(this, button2Width*3, height-button2Height, button2Width, button2Height, "LUZ");
      boton24HORAS = new GButton(this, width-buttonSize-button3Width*3.5, 5, button3Width, button3Width, "24 HORAS");
      boton7DIAS = new GButton(this, width-buttonSize-button3Width*2.5, 5, button3Width, button3Width, "7 DIAS");
      boton30DIAS = new GButton(this, width-buttonSize-button3Width*1.5, 5, button3Width, button3Width, "30 DIAS");
      botonOFF = new GButton(this, 5, 5, button3Width/2, button3Width/2, "○");
  
  
  
  /* SETUP GRAFICAS */

     // Initialize PlotNDVI
      plotNDVI = new GPlot(this);
      plotNDVI.setPos(25,25);
      plotNDVI.setDim(525,300);
      plotNDVI.setXLim(0,30);
      plotNDVI.setYLim(-1,1);
      plotNDVI.getTitle().setText("NDVI");
      plotNDVI.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotNDVI.getYAxis().getAxisLabel().setText("NDVI");
      plotNDVI.setBoxBgColor(color(211, 242, 247));
     
      // Initialize PlotHum
      plotHum = new GPlot(this);
      plotHum.setPos(25,25);
      plotHum.setDim(525,300);
      plotHum.setXLim(0,24);
      plotHum.setYLim(0,100);
      plotHum.getTitle().setText("HUMEDAD 24 HORAS");
      plotHum.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotHum.getYAxis().getAxisLabel().setText("Humedad (Unidad)");
      plotHum.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotHum7
      plotHum7 = new GPlot(this);
      plotHum7.setPos(25,25);
      plotHum7.setDim(525,300);
      plotHum7.setXLim(0,7);
      plotHum7.setYLim(0,100);
      plotHum7.getTitle().setText("HUMEDAD 7 DIAS");
      plotHum7.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotHum7.getYAxis().getAxisLabel().setText("Humedad (Unidad)");
      plotHum7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotHum30
      plotHum30 = new GPlot(this);
      plotHum30.setPos(25,25);
      plotHum30.setDim(525,300);
      plotHum30.setXLim(0,30);
      plotHum30.setYLim(0,100);
      plotHum30.getTitle().setText("HUMEDAD 30 DIAS");
      plotHum30.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotHum30.getYAxis().getAxisLabel().setText("Humedad (Unidad)");
      plotHum30.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp
      plotTemp = new GPlot(this);
      plotTemp.setPos(25,25);
      plotTemp.setDim(525,300);
      plotTemp.setXLim(0,24);
      plotTemp.setYLim(-10,80);
      plotTemp.getTitle().setText("TEMPERATURA 24 HORAS");
      plotTemp.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotTemp.getYAxis().getAxisLabel().setText("Temperatura (ºC)");
      plotTemp.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp7
      plotTemp7 = new GPlot(this);
      plotTemp7.setPos(25,25);
      plotTemp7.setDim(525,300);
      plotTemp7.setXLim(0,7);
      plotTemp7.setYLim(-10,80);
      plotTemp7.getTitle().setText("TEMPERATURA 7 DIAS");
      plotTemp7.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotTemp7.getYAxis().getAxisLabel().setText("Temperatura (ºC)");
      plotTemp7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp30
      plotTemp30 = new GPlot(this);
      plotTemp30.setPos(25,25);
      plotTemp30.setDim(525,300);
      plotTemp30.setXLim(0,30);
      plotTemp30.setYLim(-10,80);
      plotTemp30.getTitle().setText("TEMPERATURA 30 DIAS");
      plotTemp30.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotTemp30.getYAxis().getAxisLabel().setText("Temperatura (ºC)");
      plotTemp30.setBoxBgColor(color(211, 242, 247));
    
      // Initialize PlotLuz
      plotLuz = new GPlot(this);
      plotLuz.setPos(25,25);
      plotLuz.setDim(525,300);
      plotLuz.setXLim(0,24);
      plotLuz.setYLim(0,100);
      plotLuz.getTitle().setText("LUZ 24 HORAS");
      plotLuz.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotLuz.getYAxis().getAxisLabel().setText("Luz (Unidad)");
      plotLuz.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotLuz7
      plotLuz7 = new GPlot(this);
      plotLuz7.setPos(25,25);
      plotLuz7.setDim(525,300);
      plotLuz7.setXLim(0,7);
      plotLuz7.setYLim(0,100);
      plotLuz7.getTitle().setText("LUZ 7 DIAS");
      plotLuz7.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotLuz7.getYAxis().getAxisLabel().setText("Luz (Unidad)");
      plotLuz7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotLuz30
      plotLuz30 = new GPlot(this);
      plotLuz30.setPos(25,25);
      plotLuz30.setDim(525,300);
      plotLuz30.setXLim(0,30);
      plotLuz30.setYLim(0,100);
      plotLuz30.getTitle().setText("LUZ 30 DIAS");
      plotLuz30.getXAxis().getAxisLabel().setText(" Tiempo (s)");
      plotLuz30.getYAxis().getAxisLabel().setText("Luz (Unidad)");
      plotLuz30.setBoxBgColor(color(211, 242, 247));
  
  
      /*SETUP MEDIDAS PROCEDENTES ARDUINO*/
      
      //port = new Serial(this, "cu.usbmodem14101", 9600);                                    //Puerto serie Arduino
      
        fill(120, 50, 0);
        m = new Meter(this, 25, 100);
        // Adjust font color of meter value  
        m.setTitleFontSize(20);
        m.setTitleFontName("Arial bold");
        m.setTitle("Temperature (C)");
        m.setDisplayDigitalMeterValue(true);
        
        // Meter Scale
        String[] scaleLabelsT = {"0", "10", "20", "30", "40", "50", "60", "70", "80"};
        m.setScaleLabels(scaleLabelsT);
        m.setScaleFontSize(18);
        m.setScaleFontName("Times New Roman bold");
        m.setScaleFontColor(color(200, 30, 70));
        
        m.setArcColor(color(141, 113, 178));
        m.setArcThickness(10);
        m.setMaxScaleValue(80);
        
        m.setNeedleThickness(3);
        
        m.setMinInputSignal(0);
        m.setMaxInputSignal(80);
      
        // A second meter for reference
        int mx = m.getMeterX();
        int my = m.getMeterY();
        int mw = m.getMeterWidth();
        
        m2 = new Meter(this, mx + mw + 20, my);
        m2.setTitleFontSize(20);
        m2.setTitleFontName("Arial bold");
        m2.setTitle("Humidity (%)");
        m2.setDisplayDigitalMeterValue(true);
        
        String[] scaleLabelsH = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
        m2.setScaleLabels(scaleLabelsH);
        m2.setScaleFontSize(18);
        m2.setScaleFontName("Times New Roman bold");
        m2.setScaleFontColor(color(200, 30, 70));
        
        m2.setArcColor(color(141, 113, 178));
        m2.setArcThickness(10);
        m2.setMaxScaleValue(100);
        
        m2.setNeedleThickness(3);
        
        m2.setMinInputSignal(0);
        m2.setMaxInputSignal(100);
        
        // Third meter
        m3 = new Meter(this, (950/2)-(mw/2), 500);
        // Adjust font color of meter value  
        m3.setTitleFontSize(20);
        m3.setTitleFontName("Arial bold");
        m3.setTitle("Light (%)");
        m3.setDisplayDigitalMeterValue(true);
        
        // Meter Scale
        String[] scaleLabelsL = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
        m3.setScaleLabels(scaleLabelsL);
        m3.setScaleFontSize(18);
        m3.setScaleFontName("Times New Roman bold");
        m3.setScaleFontColor(color(200, 30, 70));
        
        m3.setArcColor(color(141, 113, 178));
        m3.setArcThickness(10);
        m3.setMaxScaleValue(80);
        
        m3.setNeedleThickness(3);
        
        m3.setMinInputSignal(0);
        m3.setMaxInputSignal(80);
}



void draw() {
  
  /* HORA */

    // Obtención de la fecha y hora del PC
    curr_time = PC_Time();        // Cargamos en la variable el valor obtenido al llamar la función "PC_Time()"
    curr_date = PC_Date();        // Cargamos en la variable el valor obtenido al llamar la función "PC_Date()"
  
    
  /* INTERFAZ */  
  
    MEDIDA_PERIODICA_NDVI();
    MEDIDAS_PERIODICAS_ARDUINO();
  
    if (INICIO){
       INICIO();
    }else
    
    if (CAMARA){
      
        if(setupDone==0){
              
              String[] cameras = Capture.list();
              img = createImage(width, height, RGB);
              
              if (cameras.length == 0) {
                println("No hay cámaras conectadas!");
                exit();
              } 
              else {
                println("Cámaras disponibles:");
                for (int i = 0; i < cameras.length; i++) {
                  println(cameras[i]);
                }
                cam = new Capture(this, cameras[0]);
                cam.start(); 
              }
            }
                
       CAMARA();
    }else 
    
    if (SENSORES){
       SENSORES();
    }else 
    
    if (HISTORIAL){
       HISTORIAL();
    }else 
    
    if (ABOUT){
       ABOUT();
    }
  
  
}
