#include "Flarm.h"
#include "logdef.h"
#include "math.h"

int Flarm::RX = 0;
int Flarm::TX = 0;
int Flarm::GPS = 0;
int Flarm::Power = 0;
int Flarm::AlarmLevel = 0;
int Flarm::RelativeBearing = 0;
int Flarm::AlarmType = 0;
int Flarm::RelativeVertical = 0;
int Flarm::RelativeDistance = 0;
double Flarm::gndSpeedKnots = 0;
double Flarm::gndCourse = 0;
bool Flarm::gpsOK = true;
char Flarm::ID[8] = "";
int Flarm::bincom = 0;


/* PFLAU,<RX>,<TX>,<GPS>,<Power>,<AlarmLevel>,<RelativeBearing>,<AlarmType>,<RelativeVertical>,<RelativeDistance>,<ID>
		$PFLAU,3,1,2,1,2,-30,2,-32,755*FLARM is working properly and currently receives 3 other aircraft.
		The most dangerous of these aircraft is at 11 o’clock, position 32m below and 755m away. It is a level 2 alarm


*/

/*  <AcftType>
 *
0 = unknown
1 = glider / motor glider
2 = tow / tug plane
3 = helicopter / rotorcraft
4 = skydiver
5 = drop plane for skydivers
6 = hang glider (hard)
7 = paraglider (soft)
8 = aircraft with reciprocating engine(s)
9 = aircraft with jet/turboprop engine(s)
A = unknown
B = balloon
C = airship
D = unmanned aerial vehicle (UAV)
E = unknown
F = static object
*/


/*
PFLAA,<AlarmLevel>,<RelativeNorth>,<RelativeEast>,<RelativeVertical>,<IDType>,<ID>,<Track>,<TurnRate>,<GroundSpeed>,<ClimbRate>,<AcftType>
e.g.
$PFLAA,0,-1234,1234,220,2,DD8F12,180,,30,-1.4,1*

*/

void Flarm::parsePFLAA( const char *pflaa ){

}

#define CENTERX 120
#define CENTERY 120

#define RTD(x) (x*RAD_TO_DEG)
#define DTR(x) (x*DEG_TO_RAD)

int Flarm::oldDist = 0;
int Flarm::oldVertical = 0;
int Flarm::oldBear = 0;
int Flarm::alarmOld=0;
int Flarm::tick=0;
int Flarm::timeout=0;

void Flarm::progress(){  // once per second
	if( timeout )
		timeout--;
}

/*
eg1. $GPRMC,081836,A,3751.65,S,14507.36,E,000.0,360.0,130998,011.3,E*62
eg2. $GPRMC,225446,A,4916.45,N,12311.12,W,000.5,054.7,191194,020.3,E*68
     $GPRMC,201914.00,A,4857.58740,N,00856.94735,E,0.172,122.95,310321,,,A*6D

           225446.00    Time of fix 22:54:46 UTC
           A            Navigation receiver warning A = OK, V = warning
           4916.45,N    Latitude 49 deg. 16.45 min North
           12311.12,W   Longitude 123 deg. 11.12 min West
           000.5        Speed over ground, Knots
           054.7        Course Made Good, True
           191194       Date of fix  19 November 1994
           020.3,E      Magnetic variation 20.3 deg East
           *68          mandatory checksum


*/
void Flarm::parseGPRMC( const char *gprmc ) {
	float time;
	int date;
	char warn;
	float lat,lon;
	float magvar;
	char dir;
	int cs;

	// ESP_LOGI(FNAME,"parseGPRMC: %s", gprmc );
	sscanf( gprmc, "$GPRMC,%f,%c,%f,N,%f,E,%lf,%lf,%d,%f,%c*%02x",&time,&warn,&lat,&lon,&gndSpeedKnots,&gndCourse,&date,&magvar,&dir,&cs);
	if( warn == 'A' )
		gpsOK = true;
	else
		gpsOK = false;
	// ESP_LOGI(FNAME,"parseGPRMC() GPS: %d, Speed: %3.1f knots, Track: %3.1f° ", gpsOK, gndSpeedKnots, gndCourse );
}


void Flarm::parsePFLAU( const char *pflau ) {
	int cs;
	int id;
	sscanf( pflau, "$PFLAU,%d,%d,%d,%d,%d,%d,%d,%d,%d,%x*%02x",&RX,&TX,&GPS,&Power,&AlarmLevel,&RelativeBearing,&AlarmType,&RelativeVertical,&RelativeDistance,&id,&cs);
	// ESP_LOGI(FNAME,"parsePFLAU() RB: %d ALT:%d  DIST %d",RelativeBearing,RelativeVertical, RelativeDistance );
	sprintf( ID,"%06x", id );
	tick=0;
	timeout = 10;
}

void Flarm::parsePFLAX( const char * msg ) {
	ESP_LOGI(FNAME,"parsePFLAX");
	ESP_LOG_BUFFER_HEXDUMP(FNAME, msg, strlen(msg), ESP_LOG_INFO);
	int start=0;
    if( !strncmp( msg, "\n", 1 )  ){
    	start=1;
    }
	if( !strncmp( msg+start, "$PFLAX,", 6 ) ){
		Flarm::bincom = 5;
		ESP_LOGI(FNAME,"Flarm::bincom %d", Flarm::bincom  );
	}
	timeout = 10;
}






