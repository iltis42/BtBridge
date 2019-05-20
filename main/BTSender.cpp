#include "BTSender.h"
#include <string>
#include <esp_log.h>
#include "sdkconfig.h"
#include <stdio.h>
#include "freertos/FreeRTOS.h"
#include "freertos/task.h"
#include <queue>
#include <algorithm>

char rxBuffer[100];
int BTSender::i=0;

#define RFCOMM_SERVER_CHANNEL 1
#define HEARTBEAT_PERIOD_MS 40

bool     *BTSender::_enable;
uint8_t   BTSender::rfcomm_channel_nr = 1;
uint16_t  BTSender::rfcomm_channel_id = 0;
uint8_t   BTSender::spp_service_buffer[100];
btstack_timer_source_t BTSender::heartbeat;
btstack_packet_callback_registration_t BTSender::hci_event_callback_registration;
void ( * BTSender::_callback)(char * rx, uint16_t len);

typedef struct _msg {
	char buf[100];
	int len;
} t_msg;

std::queue<t_msg> queue;


void BTSender::send(char * s, int len){
	// printf("%s",s);
	t_msg msg;
	memcpy( msg.buf, s, len );
	msg.len = len;
	if (queue.size() < 100) {
		queue.push( msg );
	}
}


void BTSender::heartbeat_handler(struct btstack_timer_source *ts){
	if (rfcomm_channel_id ){
		gpio_set_level(GPIO_NUM_2, 1);
		if ( queue.size() ){
			if (rfcomm_can_send_packet_now(rfcomm_channel_id)){
				int err = rfcomm_send(rfcomm_channel_id, (uint8_t*) queue.front().buf, queue.front().len );
				queue.pop();
				if (err) {
					printf("rfcomm_send -> error %d", err);
				}
			}
		}
	}
	else{
		int n=i++/5;
		gpio_set_level(GPIO_NUM_2, n&1);
	}
	btstack_run_loop_set_timer(ts, HEARTBEAT_PERIOD_MS);
	btstack_run_loop_add_timer(ts);
}

// Bluetooth logic
void BTSender::packet_handler (uint8_t packet_type, uint16_t channel, uint8_t *packet, uint16_t size){
	bd_addr_t event_addr;
	uint16_t  mtu;
	// printf("BTstack packet type %02x size %d\n", packet_type, size);
	switch (packet_type) {
	case RFCOMM_DATA_PACKET:
		printf("Received RFCOMM data on channel id %u, size %u %s\n", channel, size, packet);
		memcpy( rxBuffer, packet, size );
		rxBuffer[size] = 0;
		printf("Received RFCOMM data on channel id %u, size %u %s\n", channel, size, rxBuffer);
		_callback( rxBuffer, size );
		break;

	case HCI_EVENT_PACKET:
		switch (hci_event_packet_get_type(packet)) {

		case BTSTACK_EVENT_STATE:
			if (btstack_event_state_get_state(packet) == HCI_STATE_WORKING){
				printf("BTstack is up and running\n");
			}
			break;

		case HCI_EVENT_PIN_CODE_REQUEST:
			// inform about pin code request
			printf("Pin code request - using '0000'\n\r");
			reverse_bd_addr(&packet[2], event_addr);
			hci_send_cmd(&hci_pin_code_request_reply, &event_addr, 4, "0000");
			break;

		case RFCOMM_EVENT_INCOMING_CONNECTION:
			// data: event (8), len(8), address(48), channel (8), rfcomm_cid (16)
			rfcomm_event_incoming_connection_get_bd_addr(packet, event_addr);
			rfcomm_channel_nr = rfcomm_event_incoming_connection_get_server_channel(packet);
			rfcomm_channel_id = rfcomm_event_incoming_connection_get_rfcomm_cid(packet);
			printf("RFCOMM channel %u requested for %s\n", rfcomm_channel_nr, bd_addr_to_str(event_addr));
			rfcomm_accept_connection(rfcomm_channel_id);
			break;

		case RFCOMM_EVENT_CHANNEL_OPENED:
			// data: event(8), len(8), status (8), address (48), server channel(8), rfcomm_cid(16), max frame size(16)
			if (rfcomm_event_channel_opened_get_status(packet)) {
				printf("RFCOMM channel open failed, status %u\n", rfcomm_event_channel_opened_get_status(packet));
			} else {
				rfcomm_channel_id = rfcomm_event_channel_opened_get_rfcomm_cid(packet);
				mtu = rfcomm_event_channel_opened_get_max_frame_size(packet);
				printf("RFCOMM channel open succeeded. New RFCOMM Channel ID %u, max frame size %u\n", rfcomm_channel_id, mtu);
			}
			break;

		case RFCOMM_EVENT_CHANNEL_CLOSED:
			rfcomm_channel_id = 0;
			break;


		default:
			// printf("RFCOMM ignored packet event %u size: %d\n", hci_event_packet_get_type(packet), size );
			break;
		}

	}
};

void BTSender::one_shot_timer_setup(void){
	// set one-shot timer
	heartbeat.process = &heartbeat_handler;
	btstack_run_loop_set_timer(&heartbeat, HEARTBEAT_PERIOD_MS);
	btstack_run_loop_add_timer(&heartbeat);
};

void BTSender::begin( bool *enable, char * bt_name ){
	_enable = enable;
	// hci_dump_enable_log_level( LOG_LEVEL_INFO, 0 );
	// hci_dump_enable_log_level( LOG_LEVEL_ERROR, 0 );
	// hci_dump_enable_log_level( LOG_LEVEL_DEBUG, 0 );
	l2cap_init();
	rfcomm_init();
	one_shot_timer_setup();
	// register for HCI events
	hci_event_callback_registration.callback = &packet_handler;
	hci_add_event_handler(&hci_event_callback_registration);
	rfcomm_register_service(packet_handler, rfcomm_channel_nr, 100); // reserved channel, mtu=100
	memset(spp_service_buffer, 0, sizeof(spp_service_buffer));
	spp_create_sdp_record(spp_service_buffer, 0x10001, RFCOMM_SERVER_CHANNEL, "SPP Counter");
	sdp_register_service(spp_service_buffer);
	printf("SDP service record size: %u\n", de_get_len(spp_service_buffer));
	gap_discoverable_control(1);
	gap_set_local_name(bt_name);
	sdp_init();
	hci_power_control(HCI_POWER_ON);
};



