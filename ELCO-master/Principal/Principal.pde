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
  float luxActual = 0;                                       //Variable de luminosidad

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
      botonC = new GButton(this, width-buttonSize, 0, buttonSize, buttonSize, "CAMERA"); 
      botonS = new GButton(this, width-buttonSize, buttonSize, buttonSize, buttonSize, "SENSORS");
      botonH = new GButton(this, width-buttonSize, buttonSize*2, buttonSize, buttonSize, "HISTOGRAM"); 
      botonA = new GButton(this, width-buttonSize, buttonSize*3, buttonSize, buttonSize, "ABOUT");
      botonGNDVI = new GButton(this, 0, height-button2Height, button2Width, button2Height, "NDVI");
      botonGHum = new GButton(this, button2Width, height-button2Height, button2Width, button2Height, "HUMIDITY");
      botonGTemp = new GButton(this, button2Width*2, height-button2Height, button2Width, button2Height, "TEMPERATURE");
      botonGLuz = new GButton(this, button2Width*3, height-button2Height, button2Width, button2Height, "LIGHT");
      boton24HORAS = new GButton(this, width-buttonSize-button3Width*3.5, 5, button3Width, button3Width, "24 H");
      boton7DIAS = new GButton(this, width-buttonSize-button3Width*2.5, 5, button3Width, button3Width, "7 DAYS");
      boton30DIAS = new GButton(this, width-buttonSize-button3Width*1.5, 5, button3Width, button3Width, "30 DAYS");
      botonOFF = new GButton(this, 5, 5, button3Width/2, button3Width/2, "○");
  
  
  
  /* SETUP GRAFICAS */

     // Initialize PlotNDVI
      plotNDVI = new GPlot(this);
      plotNDVI.setPos(25,25);
      plotNDVI.setDim(525,300);
      plotNDVI.setXLim(0,30);
      plotNDVI.setYLim(-1,1);
      plotNDVI.getTitle().setText("NDVI");
      plotNDVI.getXAxis().getAxisLabel().setText(" Time (s)");
      plotNDVI.getYAxis().getAxisLabel().setText("NDVI");
      plotNDVI.setBoxBgColor(color(211, 242, 247));
     
      // Initialize PlotHum
      plotHum = new GPlot(this);
      plotHum.setPos(25,25);
      plotHum.setDim(525,300);
      plotHum.setXLim(0,24);
      plotHum.setYLim(0,100);
      plotHum.getTitle().setText("HUMIDITY 24 HOURS");
      plotHum.getXAxis().getAxisLabel().setText(" Time (s)");
      plotHum.getYAxis().getAxisLabel().setText("Humidity (%)");
      plotHum.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotHum7
      plotHum7 = new GPlot(this);
      plotHum7.setPos(25,25);
      plotHum7.setDim(525,300);
      plotHum7.setXLim(0,7);
      plotHum7.setYLim(0,100);
      plotHum7.getTitle().setText("HUMIDITY 7 DAYS");
      plotHum7.getXAxis().getAxisLabel().setText(" Time (s)");
      plotHum7.getYAxis().getAxisLabel().setText("Humidity (%)");
      plotHum7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotHum30
      plotHum30 = new GPlot(this);
      plotHum30.setPos(25,25);
      plotHum30.setDim(525,300);
      plotHum30.setXLim(0,30);
      plotHum30.setYLim(0,100);
      plotHum30.getTitle().setText("HUMIDITY 30 DAYS");
      plotHum30.getXAxis().getAxisLabel().setText(" Time (s)");
      plotHum30.getYAxis().getAxisLabel().setText("Humidity (%)");
      plotHum30.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp
      plotTemp = new GPlot(this);
      plotTemp.setPos(25,25);
      plotTemp.setDim(525,300);
      plotTemp.setXLim(0,24);
      plotTemp.setYLim(-10,80);
      plotTemp.getTitle().setText("TEMPERATURE 24 HOURS");
      plotTemp.getXAxis().getAxisLabel().setText(" Time (s)");
      plotTemp.getYAxis().getAxisLabel().setText("Temperature (ºC)");
      plotTemp.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp7
      plotTemp7 = new GPlot(this);
      plotTemp7.setPos(25,25);
      plotTemp7.setDim(525,300);
      plotTemp7.setXLim(0,7);
      plotTemp7.setYLim(-10,80);
      plotTemp7.getTitle().setText("TEMPERATURE 7 DAYS");
      plotTemp7.getXAxis().getAxisLabel().setText(" Time (s)");
      plotTemp7.getYAxis().getAxisLabel().setText("Temperature (ºC)");
      plotTemp7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotTemp30
      plotTemp30 = new GPlot(this);
      plotTemp30.setPos(25,25);
      plotTemp30.setDim(525,300);
      plotTemp30.setXLim(0,30);
      plotTemp30.setYLim(-10,80);
      plotTemp30.getTitle().setText("TEMPERATURE 30 DAYS");
      plotTemp30.getXAxis().getAxisLabel().setText(" Time (s)");
      plotTemp30.getYAxis().getAxisLabel().setText("Temperature (ºC)");
      plotTemp30.setBoxBgColor(color(211, 242, 247));
    
      // Initialize PlotLuz
      plotLuz = new GPlot(this);
      plotLuz.setPos(25,25);
      plotLuz.setDim(525,300);
      plotLuz.setXLim(0,24);
      plotLuz.setYLim(0,100);
      plotLuz.getTitle().setText("LIGHT 24 HOURS");
      plotLuz.getXAxis().getAxisLabel().setText(" Time (s)");
      plotLuz.getYAxis().getAxisLabel().setText("Ligth (%)");
      plotLuz.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotLuz7
      plotLuz7 = new GPlot(this);
      plotLuz7.setPos(25,25);
      plotLuz7.setDim(525,300);
      plotLuz7.setXLim(0,7);
      plotLuz7.setYLim(0,100);
      plotLuz7.getTitle().setText("LIGHT 7 DAYS");
      plotLuz7.getXAxis().getAxisLabel().setText(" Time (s)");
      plotLuz7.getYAxis().getAxisLabel().setText("Ligth (%)");
      plotLuz7.setBoxBgColor(color(211, 242, 247));
      
      // Initialize PlotLuz30
      plotLuz30 = new GPlot(this);
      plotLuz30.setPos(25,25);
      plotLuz30.setDim(525,300);
      plotLuz30.setXLim(0,30);
      plotLuz30.setYLim(0,100);
      plotLuz30.getTitle().setText("LIGHT 30 DAYS");
      plotLuz30.getXAxis().getAxisLabel().setText(" Time (s)");
      plotLuz30.getYAxis().getAxisLabel().setText("Ligth (%)");
      plotLuz30.setBoxBgColor(color(211, 242, 247));
  
  
      /*SETUP MEDIDAS PROCEDENTES ARDUINO*/
      
      port = new Serial(this, "/dev/cu.usbserial-AL03MSOB", 9600);                                    //Puerto serie Arduino
      
         fill(120, 50, 0);
        m = new Meter(this, 20, 60);
        // Adjust font color of meter value 
        m.setMeterWidth(310);
        m.setTitleFontSize(20);
        m.setTitleFontName("Arial bold");
        m.setTitle("Temperature (C)");
        m.setDisplayDigitalMeterValue(true);
        
        // Meter Scale
        String[] scaleLabelsT = {"0", "10", "20", "30", "40", "50", "60", "70", "80"};
        m.setScaleLabels(scaleLabelsT);
        m.setScaleFontSize(18);
        m.setScaleFontName("Times New Roman bold");
        m.setScaleFontColor(color(214, 42, 29));
        
        m.setArcColor(color(158, 185, 229));
        m.setArcThickness(7);
        m.setMaxScaleValue(80);
        
        m.setNeedleThickness(3);
        
        m.setMinInputSignal(0);
        m.setMaxInputSignal(80);
      
        // A second meter for reference
        int mx = m.getMeterX();
        int my = m.getMeterY();
        int mw = m.getMeterWidth();
        
        m2 = new Meter(this, mx + mw + 20, my);
        m2.setMeterWidth(310);
        m2.setTitleFontSize(20);
        m2.setTitleFontName("Arial bold");
        m2.setTitle("Humidity (%)");
        m2.setDisplayDigitalMeterValue(true);
        
        String[] scaleLabelsH = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
        m2.setScaleLabels(scaleLabelsH);
        m2.setScaleFontSize(18);
        m2.setScaleFontName("Times New Roman bold");
        m2.setScaleFontColor(color(214, 42, 29));
        
        m2.setArcColor(color(158, 185, 229));
        m2.setArcThickness(7);
        m2.setMaxScaleValue(100);
        
        m2.setNeedleThickness(3);
        
        m2.setMinInputSignal(0);
        m2.setMaxInputSignal(100);
        
        // Third meter
        m3 = new Meter(this, (width-buttonSize)/2-mw/2, 270);
        // Adjust font color of meter value  
        m3.setMeterWidth(310);
        m3.setTitleFontSize(20);
        m3.setTitleFontName("Arial bold");
        m3.setTitle("Light (%)");
        m3.setDisplayDigitalMeterValue(true);
        
        // Meter Scale
        String[] scaleLabelsL = {"0", "10", "20", "30", "40", "50", "60", "70", "80", "90", "100"};
        m3.setScaleLabels(scaleLabelsL);
        m3.setScaleFontSize(18);
        m3.setScaleFontName("Times New Roman bold");
        m3.setScaleFontColor(color(214, 42, 29));
        
        m3.setArcColor(color(158, 185, 229));
        m3.setArcThickness(7);
        m3.setMaxScaleValue(100);
        
        m3.setNeedleThickness(3);
        
        m3.setMinInputSignal(0);
        m3.setMaxInputSignal(100);
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
