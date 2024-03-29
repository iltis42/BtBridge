#include <string>
#include "sdkconfig.h"
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_task_wdt.h"
#include "string.h"
#include "esp_system.h"
#include "nvs_flash.h"
#include <driver/adc.h>
#include <driver/gpio.h>
#include "ESP32NVS.h"
#include "BTSender.h"
#include "Setup.h"
#include "esp_sleep.h"
#include <esp_wifi.h>
#include "AnalogInput.h"
#include "sensor.h"
#include "Version.h"

#include <SPI.h>
#include <OTA.h>
#include "SetupNG.h"
#include <logdef.h>
#include "Switch.h"

#include "I2Cbus.hpp"
#include "WifiApp.h"
#include "WifiClient.h"
#include "Serial.h"
#include "Switch.h"
#include <esp32/rom/miniz.h>
#include "esp32-hal-adc.h" // needed for adc pin reset
#include "soc/sens_reg.h" // needed for adc pin reset
#include "driver/gpio.h"

OTA *ota = 0;
BTSender btsender;
Switch theButton;

// Sensor board init method. Herein all functions that make the XCVario are launched and tested.
void sensor(void *args){
	esp_wifi_set_mode(WIFI_MODE_NULL);
	// esp_log_level_set("*", ESP_LOG_INFO);
	ESP_LOGI( FNAME, "Log level set globally to INFO %d",  ESP_LOG_INFO);
	esp_chip_info_t chip_info;
	esp_chip_info(&chip_info);
	ESP_LOGI( FNAME,"This is ESP32 chip with %d CPU cores, WiFi%s%s, ",
			chip_info.cores,
			(chip_info.features & CHIP_FEATURE_BT) ? "/BT" : "",
					(chip_info.features & CHIP_FEATURE_BLE) ? "/BLE" : "");
	ESP_LOGI( FNAME,"Silicon revision %d, ", chip_info.revision);
	ESP_LOGI( FNAME,"%dMB %s flash\n", spi_flash_get_chip_size() / (1024 * 1024),
			(chip_info.features & CHIP_FEATURE_EMB_FLASH) ? "embedded" : "external");

	NVS.begin();
	theButton.begin(GPIO_NUM_0);  // push Button

	bool doUpdate = false; //  = software_update.get();
	if( Switch::isClosed() ){
		doUpdate = true;
		ESP_LOGI(FNAME,"Rotary pressed: Do Software Update");
	}
	if( doUpdate ) {
		ota = new OTA();
		ota->begin();
		ota->doSoftwareUpdate();
	}

	String wireless_id;
	if( blue_enable.get() == WL_BLUETOOTH ) {
		btsender.begin();
	}
	wireless_id += SetupCommon::getID();


	if( blue_enable.get() == WL_BLUETOOTH ) {
		btsender.selfTest();
	}else if ( blue_enable.get() == WL_WLAN ){
		wifi_init_softap();
	}
	delay( 1000 );
	if( !doUpdate ) {
		Serial::begin();
		Serial::taskStart();
	}

	ESP_LOGI(FNAME,"For Serial Interface Selftest connect a cable bridging RX pin with TX pin on both serial interfaces" );
	if( Serial::selfTest( 1 ) )
		ESP_LOGI(FNAME,"Serial Interface Selftest S1: OK" );
	else
		ESP_LOGW(FNAME,"Serial Interface Selftest S1: FAILED" );
	if( Serial::selfTest( 2 ) )
		ESP_LOGI(FNAME,"Serial Interface Selftest S2: OK" );
	else
		ESP_LOGW(FNAME,"Serial Interface Selftest S2: FAILED" );

	Version myVersion;
	ESP_LOGI(FNAME,"Program Version %s", myVersion.version() );
	ESP_LOGI(FNAME,"Wireless ID %s", wireless_id.c_str() );

}

extern "C" void  app_main(void){
	ESP_LOGI(FNAME,"app_main" );
	ESP_LOGI(FNAME,"Now init all Setup elements");
	bool setupPresent;
	SetupCommon::initSetup( setupPresent );
	esp_log_level_set("*", ESP_LOG_INFO);
	sensor( 0 );
	vTaskDelete( NULL );
}



