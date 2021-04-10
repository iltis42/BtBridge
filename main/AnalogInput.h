/*
 * AnalogInput.h
 *
 *  Created on: Mar 18, 2018
 *      Author: iltis
 */

#ifndef MAIN_BATVOLTAGE_H_
#define MAIN_BATVOLTAGE_H_

#include "esp_adc_cal.h"
#include "Setup.h"
#include "soc/sens_reg.h" // needed for adc pin reset

//  ADC_CHANNEL_7,     /*!< ADC1 channel 7 is GPIO_NUM_35 */
//  ADC_CHANNEL_6,     /*!< ADC1 channel 6 is GPIO_NUM_34 */
//  ADC_CHANNEL_2,     /*!< ADC2 channel 2 is GPIO_NUM_2 */
// https://randomnerdtutorials.com/esp32-adc-analog-read-arduino-ide/

#define DEFAULT_VREF    1100

class AnalogInput {
public:
	AnalogInput( float multiplier, adc_atten_t attenuation, adc_channel_t ch, adc_unit_t unit=ADC_UNIT_1, bool calibration=true );
	virtual ~AnalogInput();

	void begin();
	float get( bool nofilter=false, int loops=64 );
	unsigned int getRaw( int loops=32 );

private:
	float _value;
	adc_unit_t _unit;
	adc_atten_t _attenuation;
	float _correct;   // reverse mV after voltage divider 22K/1.2K to Volt
	adc_channel_t _adc_ch;
    esp_adc_cal_characteristics_t adc_chars;
    bool _cal;
};



#endif /* MAIN_BATVOLTAGE_H_ */
