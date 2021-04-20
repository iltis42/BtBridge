/*
 * Setup.h
 *
 *  Created on: August 23, 2020
 *      Author: iltis
 */

#ifndef MAIN_SETUP_NG_H_
#define MAIN_SETUP_NG_H_

extern "C" {
#include "esp_partition.h"
#include "esp_err.h"
#include "nvs_flash.h"
#include "nvs.h"
}

#include <string>
#include <stdio.h>
#include "esp_system.h"
#include "stdio.h"
#include <esp_log.h>
#include <string>
#include "string.h"
#include <iostream>
#include <vector>
#include "logdef.h"
#include <WString.h>


/*
 *
 * NEW Simplified and distributed non volatile config data API with template classes:
 * SetupNG<int>  airspeed_mode( "AIRSPEED_MODE", MODE_IAS );
 *
 *  int as = airspeed_mode.get();
 *  airspeed_mode.set( MODE_TAS );
 *
 */

typedef enum rs232linemode { RS232_NORMAL, RS232_INVERTED } rs232lm_t;
typedef enum e_wireless_type { WL_DISABLE, WL_BLUETOOTH, WL_WLAN, WL_WLAN_CLIENT } e_wireless_t;
typedef enum e_serial_route_type { RT_DISABLE = 0, RT_XCVARIO = 1, RT_WIRELESS = 2, RT_S1 = 4, RT_XCVARIO_S1 = 5  } e_serial_routing_t;

const int baud[] = { 0, 4800, 9600, 19200, 38400, 57600, 115200 };

class SetupCommon {
public:
	SetupCommon() {  memset( _ID, 0, sizeof( _ID )); };
	~SetupCommon() {};
	virtual bool init() = 0;
	virtual bool erase() = 0;
	virtual bool mustReset() = 0;
	virtual const char* key() = 0;
	static std::vector<SetupCommon *> entries;
	static bool initSetup( bool &present );  // returns false if FLASH was completely blank
	static char *getID();
private:
	static char _ID[14];
};

template<typename T>

class SetupNG: public SetupCommon
{
public:
	SetupNG() {};

	SetupNG( const char * akey, T adefault, bool reset=true ) {
		// ESP_LOGI(FNAME,"SetupNG(%s)", akey );
		if( strlen( akey ) > 15 )
			ESP_LOGE(FNAME,"SetupNG(%s) key > 15 char !", akey );
		entries.push_back( this );  // an into vector
		_nvs_handle = 0;
		_key = akey;
		_default = adefault;
		_reset = reset;

	};

	inline T* getPtr() {
		return &_value;
	};
	inline T& getRef() {
		return _value;
	};
	inline T get() {
		return _value;
	};
	const char * key() {
		return _key;
	}

	bool set( T aval, bool save=true ) {
		String val( aval );
		if( save )
			ESP_LOGI( FNAME,"set val: %s", val.c_str() );
		_value = T(aval);
		if( !open() ) {
			ESP_LOGE(FNAME,"NVS Error open nvs handle !");
			return( false );
		}
		bool ret=true;
		if( save )
			ret = commit();
		return ret;
	};

	bool commit() {
		ESP_LOGI(FNAME,"NVS commit(): ");
		if( !open() ) {
			ESP_LOGE(FNAME,"NVS error");
			return false;
		}
		ESP_LOGI(FNAME,"NVS commit(key:%s , addr:%08x, len:%d, nvs_handle: %04x)", _key, (unsigned int)(&_value), sizeof( _value ), _nvs_handle);
		esp_err_t _err = nvs_set_blob(_nvs_handle, _key, (void *)(&_value), sizeof( _value ));
		if(_err != ESP_OK) {
			ESP_LOGE(FNAME,"NVS set blob error %d", _err );
			close();
			return( false );
		}
		_err = nvs_commit(_nvs_handle);
		if(_err != ESP_OK)  {
			ESP_LOGE(FNAME,"NVS nvs_commit error");
			close();
			return false;
		}
		ESP_LOGI(FNAME,"success");
		close();
		return true;
	};

	bool exists() {
		if( !open() ) {
			ESP_LOGE(FNAME,"Error open nvs handle !");
			return false;
		}
		size_t required_size;
		esp_err_t _err = nvs_get_blob(_nvs_handle, _key, NULL, &required_size);
		if ( _err != ESP_OK )
			return false;
		return true;
	};

	virtual bool init() {
		if( !open() ) {
			ESP_LOGE(FNAME,"Error open nvs handle !");
			return false;
		}
		size_t required_size;
		esp_err_t _err = nvs_get_blob(_nvs_handle, _key, NULL, &required_size);
		if ( _err != ESP_OK ){
			ESP_LOGE(FNAME, "NVS nvs_get_blob error: returned error ret=%d", _err );
			set( _default );  // try to init
		}
		else {
			if( required_size > sizeof( T ) ) {
				ESP_LOGE(FNAME,"NVS error: size too big: %d > %d", required_size , sizeof( T ) );
				erase();
				set( _default );  // try to init
				close();
				return false;
			}
			else {
				// ESP_LOGI(FNAME,"NVS size okay: %d", required_size );
				_err = nvs_get_blob(_nvs_handle, _key, &_value, &required_size);
				if ( _err != ESP_OK ){
					ESP_LOGE(FNAME, "NVS nvs_get_blob returned error ret=%d", _err );
					erase();
					set( _default );  // try to init
				}
				else {
					String val( _value );
					ESP_LOGI(FNAME,"NVS key %s exists len: %d value: %s", _key, required_size, val.c_str() );
					// std::cout << _value << "\n";
				}
			}
		}
		close();
		return true;
	};


	virtual bool erase() {
		open();
		esp_err_t _err = nvs_erase_key(_nvs_handle, _key);
		if(_err != ESP_OK)
			return false;
		else {
			ESP_LOGI(FNAME,"NVS erased %s by handle %d", _key, _nvs_handle );
			if( set( _default ) )
				return true;
			else
				return false;
		}
	};

	virtual bool mustReset() {
		return _reset;
	};

	bool erase_all() {
		open();
		esp_err_t _err = nvs_erase_all(_nvs_handle);
		if(_err != ESP_OK)
			return false;
		else
			ESP_LOGI(FNAME,"NVS erased all by handle %d", _nvs_handle );
		if( commit() )
			return true;
		else
			return false;
	};

private:
	T _value;
	T _default;
	const char * _key;
	nvs_handle_t  _nvs_handle;
	bool _reset;

	bool open() {
		if( _nvs_handle == 0) {
			esp_err_t _err = nvs_open("SetupNG", NVS_READWRITE, &_nvs_handle);
			if(_err != ESP_OK){
				ESP_LOGE(FNAME,"ESP32NVS open storage error %d", _err );
				_nvs_handle = 0;
				return( false );
			}
			else {
				// ESP_LOGI(FNAME,"ESP32NVS handle: %04X  OK", _nvs_handle );
				return( true );
			}
		}
		return true;
	};
	void close() {
		if( _nvs_handle != 0) {
			nvs_close(_nvs_handle);
			_nvs_handle = 0;
		}
	};
};



extern SetupNG<int>  		blue_enable;
extern SetupNG<int>  		factory_reset;
extern SetupNG<int>  		rot_default;

extern SetupNG<int>  		serial1_speed;
extern SetupNG<int>  		serial1_rxloop;
extern SetupNG<int>  		serial1_tx;
extern SetupNG<int>			serial1_pins_twisted;
extern SetupNG<int>  		serial1_tx_inverted;
extern SetupNG<int>  		serial1_rx_inverted;
extern SetupNG<int>  		serial1_tx_enable;
extern SetupNG<int>  		serial2_speed;
extern SetupNG<int>  		serial2_tx;
extern SetupNG<int>			serial2_pins_twisted;
extern SetupNG<int>  		serial2_tx_inverted;
extern SetupNG<int>  		serial2_rx_inverted;
extern SetupNG<int>  		serial2_tx_enable;
extern SetupNG<int>  		software_update;
extern SetupNG<int>		    hardwareRevision;

#endif /* MAIN_SETUP_NG_H_ */
