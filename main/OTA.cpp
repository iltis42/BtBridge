/*
 * OTA.cpp
 *
 *  Created on: Mar 17, 2020
 *      Author: iltis
 *
 *
 *
 */

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_task_wdt.h"

#include "esp_ota_ops.h"
#include "freertos/event_groups.h"
#include "OTAServer.h"
#include "MyWiFi.h"
#include "Setup.h"
#include "OTA.h"
#include <logdef.h>
#include "Switch.h"

OTA::OTA(){
}

void OTA::begin(){
}


// OTA
void OTA::doSoftwareUpdate(){
	ESP_LOGI(FNAME,"Now start Wifi OTA");
	// xTaskCreate(&systemRebootTask, "rebootTask", 2048, NULL, 5, NULL);

	init_wifi_softap(&OTA_server);
	for( int i=900; i>0; i-- ) {
		char txt[40];
		sprintf(txt,"Timeout in %d sec  ", i);
		sleep(1);
		if( getFlashStatus() == 1 ){
			sleep(3);
			break;
		}
		if( Switch::isClosed()  ) {
			sleep(3);
			break;
		}
	}
	software_update.set( 0 );
	esp_restart();
}
