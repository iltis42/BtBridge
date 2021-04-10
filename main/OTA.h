/*
 * OTA.h
 *
 *  Created on: Feb 24, 2019
 *      Author: iltis
 */
#ifndef MAIN_OTA_H_
#define MAIN_OTA_H_


class OTA
{
public:
	OTA();
	~OTA() {};
	void begin();
	void doSoftwareUpdate();
private:
};

#endif /* MAIN_SWITCH_H_ */
