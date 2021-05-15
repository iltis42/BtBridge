
#include <esp_log.h>
#include "BTSender.h"
#include <string>
#include "sdkconfig.h"
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_task_wdt.h"
#include <freertos/semphr.h>
#include "RingBufCPP.h"
#include <logdef.h>
#include "Switch.h"
#include "sensor.h"
#include "Router.h"
#include "Protocols.h"
#include "Flarm.h"

RingBufCPP<SString, QUEUE_SIZE> wl_8880_tx_q;
RingBufCPP<SString, QUEUE_SIZE> wl_8880_rx_q;
RingBufCPP<SString, QUEUE_SIZE> wl_8881_tx_q;
RingBufCPP<SString, QUEUE_SIZE> wl_8881_rx_q;

RingBufCPP<SString, QUEUE_SIZE> bt_tx_q;
RingBufCPP<SString, QUEUE_SIZE> bt_rx_q;

RingBufCPP<SString, QUEUE_SIZE> s1_tx_q;
RingBufCPP<SString, QUEUE_SIZE> s2_tx_q;

RingBufCPP<SString, QUEUE_SIZE> s1_rx_q;
RingBufCPP<SString, QUEUE_SIZE> s2_rx_q;

// RingBufCPP<SString, QUEUE_SIZE> xcv_tx_q;

portMUX_TYPE btmux = portMUX_INITIALIZER_UNLOCKED;

// Utility methods to push and pull data into/from queues

// checks if Queue is full, otherwise appends SString
bool Router::forwardMsg( SString &s, RingBufCPP<SString, QUEUE_SIZE>& q ){
	if( !q.isFull() ) {
		portENTER_CRITICAL_ISR(&btmux);
		q.add( s );
		portEXIT_CRITICAL_ISR(&btmux);
		return true;
	}
	return false;
}

// gets last message from ringbuffer FIFO
bool Router::pullMsg( RingBufCPP<SString, QUEUE_SIZE>& q, SString& s ){
	if( !q.isEmpty() ){
		portENTER_CRITICAL_ISR(&btmux);
		q.pull( &s );
		portEXIT_CRITICAL_ISR(&btmux);
		return true;
	}
	return false;
}


// Route messages from serial interface S1
void Router::routeS1(){
	SString s1;
	if( pullMsg( s1_rx_q, s1) ){
		// ESP_LOGI(FNAME,"S1 RX len: %d bytes, Q full:%d", s1.length(), bt_tx_q.isFull() );
		// ESP_LOG_BUFFER_HEXDUMP(FNAME,s1.c_str(),s1.length(), ESP_LOG_DEBUG);
		Protocols::parseNMEA( s1.c_str() );
		if( serial1_route.get() & RT_WIRELESS )
		{
			// ESP_LOGI(FNAME,"WIRELESS for S1 enabled  blue_enable=%d", blue_enable.get());
			if( blue_enable.get() == WL_WLAN ){
				// ESP_LOGI(FNAME,"WLAN enabled");
				if( forwardMsg( s1, wl_8880_tx_q ))
					ESP_LOGI(FNAME,"S1 RX bytes %d forward to wl_8880_tx_q port 8880", s1.length() );
			}
			else if( blue_enable.get() == WL_BLUETOOTH ){
				ESP_LOGI(FNAME,"WL_BLUETOOTH enabled");
				if( forwardMsg( s1, bt_tx_q ))
					ESP_LOGI(FNAME,"S1 RX bytes %d forward to bt_tx_q", s1.length() );
			}
		}
		if( serial1_route.get() & RT_SERIAL ){  // cross route to other interface
			if( forwardMsg( s1, s2_tx_q ))
				ESP_LOGI(FNAME,"S1 RX bytes %d forward to s2_tx_q", s1.length() );
		}
	}
}

// Route messages from serial interface S2
void Router::routeS2(){
	SString s2;
	if( pullMsg( s2_rx_q, s2) ){
		// ESP_LOGD(FNAME,"S2 RX len: %d bytes, Q full:%d", s2.length(), bt_tx_q.isFull() );
		// ESP_LOG_BUFFER_HEXDUMP(FNAME,s2.c_str(),s2.length(), ESP_LOG_DEBUG);
		Protocols::parseNMEA( s2.c_str() );

		if( serial2_route.get() & RT_WIRELESS )
		{
			// ESP_LOGI(FNAME,"S2 WIRELESS enabled");
			if( blue_enable.get() == WL_WLAN){
				// ESP_LOGI(FNAME,"WL_WLAN enabled");
				if( forwardMsg( s2, wl_8881_tx_q ))
					ESP_LOGI(FNAME,"S2 RX bytes %d forward to wl_8881_tx_q port 8881", s2.length() );
			}
			else if( blue_enable.get() == WL_BLUETOOTH ){
				// ESP_LOGI(FNAME,"WL_BLUETOOTH enabled");
				if( forwardMsg( s2, bt_tx_q ))
					ESP_LOGI(FNAME,"S2 RX bytes %d forward to bt_tx_q", s2.length() );
			}
		}
		if( serial2_route.get() & RT_SERIAL ){  // cross route to other interface
			if( forwardMsg( s2, s1_tx_q ))
				ESP_LOGV(FNAME,"S2 RX bytes %d forward to s1_tx_q", s2.length() );
		}
	}
}

// route messages from WLAN
void Router::routeWLAN(){
	if( blue_enable.get() != WL_WLAN )
		return;
	// Route received data from WLAN ports
	SString wlmsg;
	if( pullMsg( wl_8880_rx_q, wlmsg ) ){
		ESP_LOGI(FNAME,"WIFI RX len: %d bytes, S1 Q full:%d", wlmsg.length(), s1_tx_q.isFull() );
		ESP_LOG_BUFFER_HEXDUMP(FNAME,wlmsg.c_str(),wlmsg.length(), ESP_LOG_INFO);
		Protocols::parseNMEA( wlmsg.c_str() );
		if( serial1_route.get() & RT_WIRELESS )
			if( forwardMsg( wlmsg, s1_tx_q ) )
				ESP_LOGI(FNAME,"Send to S1, from WLAN TCP port 8880 received %d bytes", wlmsg.length() );
	}
	if( pullMsg( wl_8881_rx_q, wlmsg ) ){
		ESP_LOGI(FNAME,"WIFI RX len: %d bytes, S2 Q full:%d", wlmsg.length(), s2_tx_q.isFull() );
		ESP_LOG_BUFFER_HEXDUMP(FNAME,wlmsg.c_str(),wlmsg.length(), ESP_LOG_INFO);
		Protocols::parseNMEA( wlmsg.c_str() );
		if( serial2_route.get() & RT_WIRELESS )
			if( forwardMsg( wlmsg, s2_tx_q ) )
				ESP_LOGI(FNAME,"Send to S2 device, from WLAN TCP port 8881 received %d bytes", wlmsg.length() );
	}
}

// route messages from Bluetooth
void Router::routeBT(){
	if( blue_enable.get() != WL_BLUETOOTH )
		return;
	SString bt;
	if( pullMsg( bt_rx_q, bt ) ){
		Protocols::parseNMEA( bt.c_str() );
		if( serial1_route.get() & RT_WIRELESS )  // Serial data TX from bluetooth enabled ?
			if( forwardMsg( bt, s1_tx_q ) )
				ESP_LOGV(FNAME,"Send to S1 device, BT received %d bytes", bt.length() );
		if( serial2_route.get() & RT_WIRELESS )  // Serial data TX from bluetooth enabled ?
			if( forwardMsg( bt, s2_tx_q ) )
				ESP_LOGV(FNAME,"Send to S2 device, BT received %d bytes", bt.length() );
	}
}


