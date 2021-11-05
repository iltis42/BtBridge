/*
 * Protocols.cpp
 *
 *  Created on: Dec 20, 2017
 *      Author: iltis
 */

#include "Protocols.h"
#include <stdio.h>
#include <string.h>
#include "sensor.h"
#include "Setup.h"
#include "math.h"
#include <logdef.h>

#include "Router.h"
#include "Flarm.h"


Protocols::Protocols() {
}

Protocols::~Protocols() {

}


int countPFLAU=0;

int tickNMEA=0;
// The XCVario Protocol or Cambridge CAI302 protocol to adjust MC,Ballast,Bugs.
void Protocols::parseNMEA( const char *str ){
	// ESP_LOGI(FNAME,"parseNMEA %s", str);
	tickNMEA++;
	if( !strncmp( str, "$PFLAU,", 6 )) {
		Flarm::parsePFLAU( str );
		if( Flarm::bincom  ) {
			Flarm::bincom--;
			ESP_LOGI(FNAME,"Flarm::bincom %d", Flarm::bincom  );
		}
	}
	else if( !strncmp( str, "$GPRMC,", 6 )) {
		Flarm::parseGPRMC( str );
		if( Flarm::bincom  ) {
			Flarm::bincom--;
			ESP_LOGI(FNAME,"Flarm::bincom %d", Flarm::bincom  );
		}
	}
	else if( !strncmp( str, "$PFLAX,", 6 ) ){
		Flarm::parsePFLAX( str );
	}
}


// Calculate the checksum and output it as an int
// is required as HEX in the NMEA data set
// between $ or! and * character
int Protocols::getCheckSum(char * s) {
	int i, XOR, c;
	for (XOR = 0, i = 0; i < strlen(s); i++) {
		c = (unsigned char)s[i];
		if (c == '*') break;
		if ((c != '$') && (c != '!')) XOR ^= c;
	}
	return XOR;
}

