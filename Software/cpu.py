import httplib
import urllib
import time
key = "S7F39UVBAOZOOFQ0"
def thermometer():
	while True:
		temp = int(open('/sys/class/thermal/thermal_zone0/temp').read())/1e3
		params = urllib.urlencode({'field1':temp, 'key':key})
		headers = {"Content-typZZe": "application/x-www-form-urlencoded","Accept":"text/plain"}
		conn = httplib.HTTPConnection("api.thingspeak.com:80")
		try:
			conn.request("POST", "/update", params,headers)
			responce = conn.getresponse()
			print temp
			print response.status, response.reason
			data = response.read()
			conn.close()
		except:
			print"connection failed"
			time.sleep(15)
		break
if __name__=="__main__":
	while True:
		thermometer()
