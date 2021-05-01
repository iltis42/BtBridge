
#include <esp_log.h>
#include "BTSender.h"
#include <string>
#include "sdkconfig.h"
#include <stdio.h>
#include <string>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include "esp_task_wdt.h"
#include <freertos/semphr.h>
#include <algorithm>
#include <HardwareSerial.h>
#include "RingBufCPP.h"
#include <driver/uart.h>
#include <logdef.h>
#include "Switch.h"
#include "sensor.h"
#include "Router.h"
#include "Serial.h"
#include "Flarm.h"

/* Note that the standard NMEA 0183 baud rate is only 4.8 kBaud.
Nevertheless, a lot of NMEA-compatible devices can properly work with
higher transmission speeds, especially at 9.6 and 19.2 kBaud.
As any sentence can consist of 82 characters maximum with 10 bit each (including start and stop bit),
any sentence might take up to 171 ms (at 4.8k Baud), 85 ms (at 9.6 kBaud) or 43 ms (at 19.2 kBaud).
This limits the overall channel capacity to 5 sentences per second (at 4.8k Baud), 11 msg/s (at 9.6 kBaud) or 23 msg/s (at 19.2 kBaud).
If  too  many  sentences  are  produced  with  regard  to  the  available  transmission  speed,
some sentences might be lost or truncated.

*/


int sim=100;
int numS1=0;
int long_press=0;
#define HEARTBEAT_PERIOD_MS_SERIAL 25

// Serial Handler  ttyS1, S1, port 8881
void Serial::serialHandlerS1(void *pvParameters){
	while(1) {
		SString s;
		// Serial Interface tty1 send
		if ( !s1_tx_q.isEmpty() && Serial1.availableForWrite() ){
			ESP_LOGD(FNAME,"Serial Data and avail");
			while( Router::pullMsg( s1_tx_q, s ) ) {
				ESP_LOGD(FNAME,"Serial 1 TX len: %d bytes", s.length() );
				// ESP_LOG_BUFFER_HEXDUMP(FNAME,s.c_str(),s.length(), ESP_LOG_DEBUG);
				int wr = Serial1.write( s.c_str(), s.length() );
				ESP_LOGI(FNAME,"Serial 1 TX written: %d", wr);
			}
		}
		int num = Serial1.available();
		if( num > 0 ) {
			// ESP_LOGI(FNAME,"Serial 1 RX avail %d bytes", num );
			if( num >= SSTRLEN ) {
				ESP_LOGW(FNAME,"Serial 1 Overrun RX >= %d bytes avail: %d, Bytes", SSTRLEN, num);
				num=SSTRLEN;
			}
			// ESP_LOGI(FNAME,"Flarm::bincom %d", Flarm::bincom  );
			if( (numS1 == num) || Flarm::bincom ){    // normally wait unit sentence has ended, or in binary mode just continue
				int numread = Serial1.read( s.c_str(), num );
				ESP_LOGI(FNAME,"Serial 1 RX bytes read: %d  bincom: %d", numread,  Flarm::bincom  );
				// ESP_LOG_BUFFER_HEXDUMP(FNAME,s.c_str(),numread, ESP_LOG_INFO);
				s.setLen( numread );
				Router::forwardMsg( s, s1_rx_q );
				numS1 = 0;
			}
			else
				numS1 = num;
		}

		if( Switch::isClosed() ){
			long_press++;
			if( long_press > 10 ){
				ESP_LOGI(FNAME,"Switch long pressed, restart!");
				// software_update.set(1);
				esp_restart();
			}
		}
		else
			long_press = 0;
		esp_task_wdt_reset();
		vTaskDelay( HEARTBEAT_PERIOD_MS_SERIAL/portTICK_PERIOD_MS );
	}
}

int numS2=0;
// ttyS2, port 8882
void Serial::serialHandlerS2(void *pvParameters){
	while(1) {
		SString s;
		if ( !s2_tx_q.isEmpty() && Serial2.availableForWrite() ){
			if( Router::pullMsg( s2_tx_q, s ) ) {
				ESP_LOGI(FNAME,"Serial Data and avail");
				ESP_LOGI(FNAME,"Serial 2 TX len: %d bytes", s.length() );
				ESP_LOG_BUFFER_HEXDUMP(FNAME,s.c_str(),s.length(), ESP_LOG_INFO);
				int wr = Serial2.write( s.c_str(), s.length() );
				ESP_LOGI(FNAME,"Serial 2 TX written: %d", wr);
			}
		}
		int num = Serial2.available();
		if( num > 0 ) {
			// ESP_LOGI(FNAME,"Serial 2 RX avail %d bytes", num );
			if( num >= SSTRLEN ) {
				ESP_LOGW(FNAME,"Serial 2 RX Overrun >= %d bytes avail: %d, Bytes", SSTRLEN, num);
				num=SSTRLEN;
			}
			if( (numS2 == num) || Flarm::bincom ){  // normally wait unit sentence has ended, or in binary mode just continue
				int numread = Serial2.read( s.c_str(), num );
				ESP_LOGI(FNAME,"Serial 2 RX bytes read: %d", numread );
				// ESP_LOG_BUFFER_HEXDUMP(FNAME,s.c_str(),numread, ESP_LOG_INFO);
				s.setLen( numread );
				Router::forwardMsg( s, s2_rx_q );
				s.clear();
				numS2 = 0;
			}
			else
				numS2 = num;
		}

		esp_task_wdt_reset();
		vTaskDelay( HEARTBEAT_PERIOD_MS_SERIAL/portTICK_PERIOD_MS );  // 48 bytes each 20 mS traffic at 19.200 baud
	}
}


void Serial::routerTask(void *pvParameters){
	while(1) {
		Router::routeBT();
		Router::routeWLAN();
		Router::routeS1();
		Router::routeS2();
		BTSender::progress();   // piggyback this here, saves one task for BT sender
		vTaskDelay( HEARTBEAT_PERIOD_MS_SERIAL/portTICK_PERIOD_MS );  // 48 bytes each 20 mS traffic at 19.200 baud
	}
}

bool Serial::selfTest(int num){
	HardwareSerial *mySerial;
	if( num == 1 )
		mySerial = &Serial1;
	else if( num == 2 )
		mySerial = &Serial2;
	else
		return false;
	ESP_LOGI(FNAME,"Serial %d selftest", num );
	delay(100);  // wait for serial hardware init
	std::string test( PROGMEM "The quick brown fox jumps over the lazy dog" );
	int tx = 0;
	if( mySerial->availableForWrite() ) {
		tx = mySerial->write( test.c_str(), test.length() );
		ESP_LOGI(FNAME,"Serial TX written: %d", tx );
	}
	else {
		ESP_LOGI(FNAME,"Serial not avail for sending, abort");
		return false;
	}
	char recv[50];
	int numread = 0;
	for( int i=1; i<10; i++ ){
			int avail = mySerial->available();
			if( avail >= tx ){
				if( avail > tx )
					avail = tx+1;
				numread = mySerial->read( recv, avail );
				ESP_LOGI(FNAME,"Serial RX bytes read: %d %s", numread, recv );
				break;
			}
		delay( 30 );
		ESP_LOGI(FNAME,"Serial bytes avail: %d", numread );
	}
	std::string r( recv );
	if( r.find( test ) != std::string::npos )  {
		ESP_LOGI(FNAME,"Serial Test PASSED");
		return true;
	}
	else {
		ESP_LOGI(FNAME,"Serial Test FAILED !");
		return false;
	}
	return false;
}

void Serial::begin(){
	ESP_LOGI(FNAME,"Serial::begin()" );

	if( serial1_speed.get() != 0  || blue_enable.get() != 0 ){
		int baudrate = baud[serial1_speed.get()];
		if( baudrate != 0 ) {
			ESP_LOGI(FNAME,"Serial Interface ttyS1 enabled with serial speed: %d baud: %d tx_inv: %d rx_inv: %d",  serial1_speed.get(), baud[serial1_speed.get()], serial1_tx_inverted.get(), serial1_rx_inverted.get() );
			if( serial1_pins_twisted.get() ){
				if( serial1_tx_enable.get() ){
					Serial1.begin(baudrate,SERIAL_8N1,16,17, serial1_rx_inverted.get(), serial1_tx_inverted.get());   //  IO16: RXD2,  IO17: TXD2
				}else{
					Serial1.begin(baudrate,SERIAL_8N1,16,36, serial1_rx_inverted.get(), serial1_tx_inverted.get());   //  IO16: RXD2,  IO17: TXD2
					gpio_set_direction(GPIO_NUM_17, GPIO_MODE_INPUT);     // 2020 series 1, analog in
					gpio_pullup_dis( GPIO_NUM_17 );
				}
			}
			else{
				if( serial1_tx_enable.get() ){
					Serial1.begin(baudrate,SERIAL_8N1,17,16, serial1_rx_inverted.get(), serial1_tx_inverted.get());   //  IO16: RXD2,  IO17: TXD2
				}else{
					Serial1.begin(baudrate,SERIAL_8N1,17,36, serial1_rx_inverted.get(), serial1_tx_inverted.get());   //  IO16: RXD2,  IO17: TXD2
					gpio_set_direction(GPIO_NUM_16, GPIO_MODE_INPUT);     // 2020 series 1, analog in
					gpio_pullup_dis( GPIO_NUM_16 );
				}
			}
			Serial1.setRxBufferSize(256);
		}
		// need this for bluetooth
	}
	if( serial2_speed.get() != 0  ){
		ESP_LOGI(FNAME,"Serial Interface ttyS2 enabled with serial speed: %d baud: %d tx_inv: %d rx_inv: %d",  serial2_speed.get(), baud[serial2_speed.get()], serial2_tx_inverted.get(), serial2_rx_inverted.get() );
		if( serial2_pins_twisted.get() ){  //   speed, RX, TX, invRX, invTX
			if( serial2_tx_enable.get() ){
				Serial2.begin(baud[serial2_speed.get()],SERIAL_8N1,19,18, serial2_rx_inverted.get(), serial2_tx_inverted.get());   //  IO4: RXD2,  IO18: TXD2
			}else{
				Serial2.begin(baud[serial2_speed.get()],SERIAL_8N1,19,36, serial2_rx_inverted.get(), serial2_tx_inverted.get());
				gpio_set_direction(GPIO_NUM_18, GPIO_MODE_INPUT);     // 2020 series 1, analog in
				gpio_pullup_dis( GPIO_NUM_18 );
			}
		}
		else{
			if( serial2_tx_enable.get() ){
				Serial2.begin(baud[serial2_speed.get()],SERIAL_8N1,18,19, serial2_rx_inverted.get(), serial2_tx_inverted.get());   //  IO18: RXD2,  IO4: TXD2
			}
			else{
				Serial2.begin(baud[serial2_speed.get()],SERIAL_8N1,18,36, serial2_rx_inverted.get(), serial2_tx_inverted.get());
				gpio_set_direction(GPIO_NUM_19, GPIO_MODE_INPUT);     // 2020 series 1, analog in
				gpio_pullup_dis( GPIO_NUM_19 );
			}
		}
		Serial2.setRxBufferSize(256);
	}
}

void Serial::taskStart(){
	ESP_LOGI(FNAME,"Serial::taskStart()" );

	if( serial1_speed.get() != 0  || blue_enable.get() != 0 ){
		xTaskCreatePinnedToCore(&Serial::serialHandlerS1, "serialHandlerS1", 4096, NULL, 16, 0, 0);
	}

	if( serial2_speed.get() != 0 ){
		xTaskCreatePinnedToCore(&Serial::serialHandlerS2, "serialHandlerS2", 4096, NULL, 15, 0, 0);
	}

	if( serial2_speed.get() != 0 || serial1_speed.get() != 0 ){
			xTaskCreatePinnedToCore(&Serial::routerTask, "routerTask", 4096, NULL, 29, 0, 0);
	}
}



