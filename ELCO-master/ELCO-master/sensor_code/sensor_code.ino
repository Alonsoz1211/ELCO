// Librerías para el sensor DHT
#include <DHT_U.h>
#include <DHT.h>

// Librería del sensor de Luz
#include <Adafruit_TSL2591.h>

// Pin para el DHT
#define DHTPIN 4
// Pin para el sensor de agua
#define WSPIN 3

#define LSPIN 5
Adafruit_TSL2591 tsl = Adafruit_TSL2591(2591);

DHT dht(DHTPIN, DHT11);

void configureSensor(void)
{
  tsl.setGain(TSL2591_GAIN_MED);
  tsl.setTiming(TSL2591_INTEGRATIONTIME_100MS);
}

void setup()
{
  Serial.begin(9600);
  delay(10);
  dht.begin();

  configureSensor();
}




void loop()
{
  char valor = 0;     // usamos una constante tipo char, ya
                       // que van a ser letras los caracteres
                       // que se van a enviar
  if (Serial.available() > 0) // se abre el puerto serial
    // leyendo los datos de entrada
  {
    valor = Serial.read();   // el valor recibido por el puerto
    // serial se almacena en la
    // variable "valor"
    if (valor == 'E')        // se compara el valor recibido
      // con la letra "E"
    { // si el valor es igual a "E"
      // Sesor DHT: Humedad y Temperatura
      float h = dht.readHumidity();
      float t = dht.readTemperature();

      // Sensor de luz
      uint16_t l = tsl.getLuminosity(TSL2591_VISIBLE);
      int ldec = l;
      float lux = ((float)ldec / (65535)) * 100;

      if ( lux < 0 ) lux = 0;

      if (isnan(h) || isnan(t))
      {
        Serial.println("Failed to read from DHT sensor!");
        return;
      }
      Serial.print((float)t);
      Serial.print(":");
      Serial.print((float)h);
      Serial.print(":");
      Serial.println(lux);

      // Tiempo de espera entre medidas
      delay(1000);
    }
    else if (valor == 'A')                  // de lo contrario si se introduce
    { // un caracter que no sea "E" ni "A"
      Serial.println("Caracter NO PERMITIDO");  // imprime
      // vía serial
    }
  }
}
