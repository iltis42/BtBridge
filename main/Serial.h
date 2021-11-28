#ifndef __SERIAL_H__
#define __SERIAL_H__

#include <cstring>
#include "driver/gpio.h"
#include <esp_log.h>
#include "RingBufCPP.h"
#include <string>

#define SERIAL_STRLEN 512

class Serial {
public:
  Serial() {};
  static void begin();
  static void taskStart();
  static void serialHandlerS1(void *pvParameters);
  static void serialHandlerS2(void *pvParameters);
  static void routerTask(void *pvParameters);
  static bool selfTest( int num );

private:
  static char rxbuf1[SERIAL_STRLEN];
  static char rxbuf2[SERIAL_STRLEN];
  static bool _selfTest;


};

#endif
