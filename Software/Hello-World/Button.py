import RPi.GPIO as GPIO
from time import sleep

GPIO.setwarnings(False)
GPIO.setmode(GPIO.BOARD)
GPIO.setup(8,GPIO.OUT, initial=GPIO.LOW)
GPIO.setup(10,GPIO.IN, pull_up_down=GPIO.PUD_UP)

while True:
  button_state = GPIO.input(10)
  if button_state == True:
    GPIO.output(8,False)
    sleep(0.2)
   else:
    GPIO.output(8,True)
