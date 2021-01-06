import os
import time
import busio
import digitalio
import board
import adafruit_mcp3xxx.mcp3008 as MCP
from adafruit_mcp3xxx.analog_in import AnalogIn

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

last_read = 0       # this keeps track of the last potentiometer value
tolerance = 250     # to keep from being jittery we'll only change volume when the pot has moved a significant amount on a 16-bit ADC
                    
slope = 2.48
intercept = 0

while True:
    # we'll assume that the pot didn't move
    value_changed = False

    # read the analog pin
    value = chan0.value

    # how much has it changed since the last read?
    value_adjust = abs(value - last_read)

    if value_adjust > tolerance:
        value_changed = True

    if value_changed:
        # convert 16bit adc0 (0-65535) trim pot read into 0-100 volume level
        voltage = chan0.voltage
        
        water_cont = ((1.0/voltage)*slope)+intercept

        # set OS volume playback volume
        print('ADC = %i' % value)
        print('Voltage = %.2f V' % voltage)
        print('Water = %.2f cm^3/cm^3' % water_cont)
        #set_vol_cmd = 'sudo amixer cset numid=1 -- {volume}% > /dev/null'.format(volume = voltage)
        #os.system(set_vol_cmd)

        # save the potentiometer reading for the next loop
        last_read = value

    # hang out and do nothing for a half second
    time.sleep(0.5)
