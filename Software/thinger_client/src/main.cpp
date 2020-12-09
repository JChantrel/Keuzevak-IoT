// The MIT License (MIT)
//
// Copyright (c) 2015 THINGER LTD
// Author: alvarolb@gmail.com (Alvaro Luis Bustamante)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#include "thinger/thinger.h"
#include "mmapGpio.h"

#define USER_ID             "JChantrel"
#define DEVICE_ID           "raspberry"
#define DEVICE_CREDENTIAL   "soil_sensor"

#define LED_PIN  14
#define BUTTON_PIN  15

mmapGpio rpiGpio;

int main(int argc, char *argv[])
{
    thinger_device thing(USER_ID, DEVICE_ID, DEVICE_CREDENTIAL);

    // define thing resources here. i.e, this is a sum example

    rpiGpio.setPinDir(LED_PIN, mmapGpio::OUTPUT);
    rpiGpio.setPinDir(BUTTON_PIN, mmapGpio::INPUT);

    thing["led"] << [](pson& in){
	if(in.is_empty()){
            in = rpiGpio.readPin(LED_PIN) ? true : false;
	}else{
	    if(in){
		rpiGpio.writePinHigh(LED_PIN);
	    }else{
		rpiGpio.writePinLow(LED_PIN);
	    }
	}
    };
    
    thing["button"] >> [](pson& out){
        out = rpiGpio.readPin(BUTTON_PIN) ? true : false;
    };

    thing.start();
    return 0;
}
