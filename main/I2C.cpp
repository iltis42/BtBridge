#include <inttypes.h>
#include <stdio.h>
#include "I2C.h"
#include <string.h>
#include "sdkconfig.h"
#include <logdef.h>

#define I2C_MASTER_TX_BUF_DISABLE    0   /*!< I2C master do not need buffer */
#define I2C_MASTER_RX_BUF_DISABLE    0   /*!< I2C master do not need buffer */

xSemaphoreHandle i2c_mutex = 0;

void I2C::init(gpio_num_t sda, gpio_num_t scl, uint32_t frequency, i2c_port_t num)
{
	ESP_LOGI(FNAME,"I2C(sda=%02x  scl=%02x)", sda, scl);
	if( i2c_mutex ) {
		ESP_LOGW(FNAME,"I2C driver already installed for sda=%02x  scl=%02x", sda, scl );
		return;
	}
	bool error=false;
	_sda=sda;
	_scl=scl;
	_num=num;
	i2c_config_t conf;
	memset( &conf, 0, sizeof(conf) );
	conf.mode = I2C_MODE_MASTER;
	conf.sda_io_num = sda;
	conf.sda_pullup_en = GPIO_PULLUP_ENABLE;
	conf.scl_io_num = scl;
	conf.scl_pullup_en = GPIO_PULLUP_ENABLE;
	conf.master.clk_speed = frequency;
	esp_err_t ret = i2c_param_config(_num, &conf);
	i2c_mutex = xSemaphoreCreateMutex();
	if( i2c_mutex == 0 )
		ESP_LOGE(FNAME,"Error creating I2C Semaphore");
	else
		ESP_LOGI(FNAME,"I2C Semaphore successfully created");
	if( ret == ESP_FAIL){
				ESP_LOGE(FNAME,"I2C ERROR param config: %x", ret);
				error=true;
			}
	ret = i2c_driver_install(_num, conf.mode, I2C_MASTER_RX_BUF_DISABLE, I2C_MASTER_TX_BUF_DISABLE, 0);
	if( ret == ESP_FAIL){
			ESP_LOGE(FNAME,"I2C ERROR driver install: %x", ret);
			error=true;
		}
	if(!error){
		ESP_LOGI(FNAME,"I2C init SUCCESS");
	}
}

esp_err_t I2C::write(uint8_t byte, int ack, i2c_rw_t rw)
{
	esp_err_t ret = i2c_master_write_byte(cmd, (byte<<1)| rw , ack);
	if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR write byte: %x", ret);
	}
	return ret;
}

esp_err_t I2C::write_byte(uint8_t byte, int ack)
{
	esp_err_t ret = i2c_master_write_byte(cmd, byte , ack);
	if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR write data byte: %x", ret);
	}
	return ret;
}

esp_err_t I2C::write16bit( uint8_t addr, uint16_t word )
{
	xSemaphoreTake(i2c_mutex,portMAX_DELAY );
	cmd = i2c_cmd_link_create();
	uint8_t datah=(uint8_t(word>>8));
	uint8_t datal=(uint8_t(word & 0xFF));
	start();
	write(addr, true, I2C_MASTER_WRITE);
    write_byte(datal, 0);
	write_byte(datah, 1);
	stop();
	esp_err_t ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
    if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR write 16 bit: %x", ret);
	}
    i2c_cmd_link_delete(cmd);
    xSemaphoreGive(i2c_mutex);
    return ret;
}

esp_err_t I2C::write8bit( uint8_t addr, uint16_t word )
{
	xSemaphoreTake(i2c_mutex,portMAX_DELAY );
	cmd = i2c_cmd_link_create();
	uint8_t datal=(uint8_t(word & 0xFF));
	start();
	write(addr, true, I2C_MASTER_WRITE);
    write_byte(datal, 0);
	stop();
	esp_err_t ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
    if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR write 8 bit: %x", ret);
		;
	}
    i2c_cmd_link_delete(cmd);
    xSemaphoreGive(i2c_mutex);
    return ret;
}


esp_err_t I2C::read16bit( uint8_t addr, uint16_t *word )
{
	xSemaphoreTake(i2c_mutex,portMAX_DELAY );
	cmd = i2c_cmd_link_create();
	uint8_t datah, datal;
	start();
	write(addr, true, I2C_MASTER_READ);
    read(&datah, 0);
	read(&datal, 1);
	stop();
	esp_err_t ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
    if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR read 16 bit: %x", ret);
	}
    *word = (datah << 8) | datal;
    i2c_cmd_link_delete(cmd);
    xSemaphoreGive(i2c_mutex);
    return ret;
}

esp_err_t I2C::read32bit( uint8_t addr, uint8_t *data )
{
	xSemaphoreTake(i2c_mutex,portMAX_DELAY );
	cmd = i2c_cmd_link_create();
	start();
	write(addr, true, I2C_MASTER_READ);
	read(&data[0], 0);
    read(&data[1], 0);
    read(&data[2], 0);
	read(&data[3], 1);

	stop();
	esp_err_t ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
    if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR read 16 bit: %x", ret);
	}

    i2c_cmd_link_delete(cmd);
    xSemaphoreGive(i2c_mutex);
    return ret;
}

esp_err_t I2C::read8bit( uint8_t addr, uint16_t *word )
{
	xSemaphoreTake(i2c_mutex,portMAX_DELAY );
	cmd = i2c_cmd_link_create();
	uint8_t datal;
	start();
	write(addr, true, I2C_MASTER_READ);
	read(&datal, 1);
	stop();
	esp_err_t ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
    if( ret == ESP_FAIL){
		ESP_LOGE(FNAME,"I2C ERROR read 8 bit: %x", ret);
    	;
	}
    *word = (uint16_t)datal;
    i2c_cmd_link_delete(cmd);
    xSemaphoreGive(i2c_mutex);
    return ret;
}


esp_err_t I2C::scan(  uint8_t addr  )
{
	bool found=true;
	cmd = i2c_cmd_link_create();
	uint8_t _start = 3;
	uint8_t _stop = 0x78;
	if( addr ) {
		_start = addr;
		_stop = addr;
	}

	for( uint8_t addr=_start; addr<=_stop; addr++ )
	{
		ESP_LOGI(FNAME,"scan a %02x sca %02x scl %02x", addr, _sda, _scl );
		start();
		esp_err_t ret = write(addr, true, I2C_MASTER_WRITE);
		stop();
		if( ret != ESP_OK ){
			found = false;
		}
		ret = i2c_master_cmd_begin(_num, cmd, 100 / portTICK_RATE_MS);
		if( ret != ESP_OK ){
			ESP_LOGE(FNAME,"I2C address not found");
			found = false;
		}
		else
			ESP_LOGI(FNAME,"Found I2C address: %02x", addr);

	}
	i2c_cmd_link_delete(cmd);
	if( !found )
	{
		ESP_LOGI(FNAME,"I2C scan found nothing");
		return ESP_FAIL;
	}
	return ESP_OK;
}

esp_err_t I2C::read(uint8_t *byte, int ack) //(i2c_ack_type_t)
{
	esp_err_t ret = i2c_master_read_byte(cmd, byte, (i2c_ack_type_t)ack); //Read data back on B
	if (ret == ESP_FAIL) {
		ESP_LOGE(FNAME,"ERROR master read byte I2C link: %x", ret);
	}
	return ret;
}


void I2C::start()
{
	i2c_master_start(cmd);
}


void I2C::stop()
{
	i2c_master_stop(cmd);
}

