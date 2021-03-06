import os
import time
import busio
import digitalio
import board
import adafruit_mcp3xxx.mcp3008 as MCP
from adafruit_mcp3xxx.analog_in import AnalogIn

import http.client
import urllib
import time

# create the spi bus
spi = busio.SPI(clock=board.SCK, MISO=board.MISO, MOSI=board.MOSI)

# create the cs (chip select)
cs = digitalio.DigitalInOut(board.D22)

# create the mcp object
mcp = MCP.MCP3008(spi, cs)

# create an analog input channel on pin 0
chan0 = AnalogIn(mcp, MCP.P0)

print('Raw ADC Value: ', chan0.value)
print('ADC Voltage: ' + str(chan0.voltage) + 'V')

slope = -0.00831
intercept = 335.42

key = "S7F39UVBAOZOOFQ0"

while True:

    # read the analog pin
    value = chan0.value

    # convert 16bit adc0 (0-65535) read into voltage level
    voltage = chan0.voltage
    # convert 16bit adc0 (0-65535) read into moisture level
    water_cont = (slope*value)+intercept
    if water_cont > 100:
        water_cont = 100
    elif water_cont < 0:
        water_cont = 0

    # print calculated values
    #print('ADC = %i' % value)
    #print('Voltage = %.2f V' % voltage)
    print('Water = %.2f procent' % water_cont)

    # send value to thingspeak
    params = urllib.parse.urlencode({'field1':water_cont, 'key':key})
    headers = {"Content-typZZe": "application/x-www-form-urlencoded","Accept":"text/plain"}
    conn = http.client.HTTPConnection("api.thingspeak.com:80")
    try:
        conn.request("POST", "/update", params,headers)
        responce = conn.getresponse()
        print (water_cont)
        print (response.status, response.reason)
        data = response.read()
        conn.close()
    except:
        print("connection failed")
        time.sleep(900)

