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
	int count = 0;
	for( int i=900; i>0; i-- ) {
		sleep(1);
		if( getFlashStatus() == 1 ){
			break;
		}
		if( Switch::isClosed() ) {  // 10 second press to exit OTA
			count++;
			if( count > 10 ){
				ESP_LOGI(FNAME,"Switch pressed > 10 sec: Abort");
				break;
			}
		}else{
			count = 0;
		}
	}
	sleep(3);
	software_update.set( 0 );
	esp_restart();
}
