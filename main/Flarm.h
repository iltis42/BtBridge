#ifndef FLARM_H
#define FLARM_H
#include <cstdlib> // abs
#include <string> // std::string
#include <locale> // std::locale, std::toupper
#include "RingBufCPP.h"  // SString, tbd: extra header


class Flarm {
public:
	static void parsePFLAU( char *pflau );
	static void parsePFLAA( char *pflaa );
	static void parsePFLAX( SString &msg );
	static void parseGPRMC( char *gprmc );
 	static inline int alarmLevel(){ return AlarmLevel; };
 	static void progress();
 	static bool connected(){ return (bool)timeout; };
 	static inline bool getGPS( double &gndSpeedKmh, double &gndTrack ) { if( gpsOK ) {
 																			gndSpeedKmh = gndSpeedKnots/1.852;
 																			gndTrack = gndCourse;
 																			return true; }
 																		else
 																			return false;
 	                                                                   }

 	static bool gpsStatus() { return gpsOK; }
    static double getGndSpeedKnots() { return gndSpeedKnots; }
    static double getGndCourse() { return gndCourse; }
 	static int bincom;

private:

	static int RX,TX,GPS,Power;
	static int AlarmLevel;
	static int RelativeBearing,RelativeVertical,RelativeDistance;
	static double gndSpeedKnots;
	static double gndCourse;
	static bool   gpsOK;
	static int AlarmType;
	static char ID[8];
	static int oldDist;
	static int oldVertical;
	static int oldBear;
	static int alarmOld;
	static int tick;
	static int timeout;
};

#endif
