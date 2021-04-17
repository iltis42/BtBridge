/*
 * Setup.cpp
 *
 *  Created on: Dec 23, 2017
 *      Author: iltis
 */

#include "Setup.h"
#include <string>
#include <stdio.h>
#include "esp_system.h"
#include <esp_log.h>
#include "sdkconfig.h"
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "ESP32NVS.h"
#include "esp32/rom/uart.h"
#include <iostream>
#include <map>
#include <math.h>
#include <esp32/rom/miniz.h>
#include "esp_task_wdt.h"
#include <logdef.h>
#include "sensor.h"

std::vector<SetupCommon *> SetupCommon::entries;
char SetupCommon::_ID[14];



SetupNG<int>  			blue_enable( "BT_ENABLE" ,  1);
SetupNG<int>  			factory_reset( "FACTORY_RES" , 0 );
SetupNG<int>  			rot_default( "ROTARY_DEFAULT", 0 );

SetupNG<int>  			serial1_speed( "SERIAL1_SPEED", 3 );   // tag will stay SERIAL2 from historical reason
SetupNG<int>  			serial1_rxloop( "SERIAL1_RXLOOP", 0 );
SetupNG<int>  			serial1_tx( "SERIAL1_TX", 2 );      // Just BT device = XCSoar to control FLARM
SetupNG<int>  			serial1_pins_twisted( "SERIAL1_PINS", 0 );
SetupNG<int>  			serial1_tx_inverted( "SERIAL1_TX_INV", RS232_INVERTED );
SetupNG<int>  			serial1_rx_inverted( "SERIAL1_RX_INV", RS232_INVERTED );
SetupNG<int>  			serial1_tx_enable( "SER1_TX_ENA", 1 );
SetupNG<int>  			serial2_speed( "SERIAL2_SPEED", 3 );
SetupNG<int>  			serial2_pins_twisted( "SERIAL2_PINS", 0 );
SetupNG<int>  			serial2_tx( "SERIAL2_TX", 1 );     //  BT device and XCVario, Serial2 is foreseen for Protocols or Kobo
SetupNG<int>  			serial2_tx_inverted( "SERIAL2_TX_INV", RS232_INVERTED );
SetupNG<int>  			serial2_rx_inverted( "SERIAL2_RX_INV", RS232_INVERTED );
SetupNG<int>  			serial2_tx_enable( "SER2_TX_ENA", 1 );

SetupNG<int>  			software_update( "SOFTWARE_UPDATE", 0 );


bool SetupCommon::initSetup( bool& present ) {
	bool ret=true;
	ESP_LOGI(FNAME,"SetupCommon::initSetup()");
	esp_err_t _err = nvs_flash_init();
	if (_err == ESP_ERR_NVS_NO_FREE_PAGES) {
		ESP_LOGE(FNAME,"Error no more space in NVS: erase partition");
		const esp_partition_t* nvs_partition = esp_partition_find_first(ESP_PARTITION_TYPE_DATA, ESP_PARTITION_SUBTYPE_DATA_NVS, NULL);
		_err = (esp_partition_erase_range(nvs_partition, 0, nvs_partition->size));
		if ( _err != ESP_OK ){
			ESP_LOGE(FNAME, "partition erase returned error ret=%d", _err );
			ret = false;
		}
	}

	for(int i = 0; i < entries.size(); i++ ) {
			bool ret = entries[i]->init();
			if( ret != true )
				ESP_LOGE(FNAME,"Error init with default NVS: %s", entries[i]->key() );
	}

	if( factory_reset.get() ) {
		ESP_LOGI(FNAME,"\n\n******  FACTORY RESET ******");
		for(int i = 0; i < entries.size(); i++ ) {
			ESP_LOGI(FNAME,"i=%d %s erase", i, entries[i]->key() );
			if( entries[i]->mustReset() ){
				bool ret = entries[i]->erase();
				if( ret != true ) {
					ESP_LOGE(FNAME,"Error erasing %s", entries[i]->key() );
					ret = false;
				}
				ret = entries[i]->init();
				if( ret != true ) {
					ESP_LOGE(FNAME,"Error init with default %s", entries[i]->key() );
					ret = false;
				}
				else
					ESP_LOGI(FNAME,"%s successfully initialized with default", entries[i]->key() );
			}
		}
	}
	return ret;
};

char * SetupCommon::getID() {
	if( strlen( _ID ) == 0 ) {
		uint8_t mac[6];
		unsigned long  crc = 0;
		if ( esp_efuse_mac_get_default(mac) == ESP_OK ){
			crc = mz_crc32(0L, mac, 6);
		}
		sprintf( _ID, "BTSerial-%04d", int(crc % 10000) );
	}
	return _ID;
}

