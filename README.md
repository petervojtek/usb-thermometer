## usb-thermometer 

Read temperature from cheap usb thermometers.

Supported devices:
* TEMPer1
* TEMPer1F

### How to run it

1. clone this repository
2. `$ sudo apt-get install libusb-dev`
3. `$ make`
4. connect the thermometer
5. `$ sudo ./pcsensor`

The output looks like:

```
2014/10/30 07:00:36 Temperature 73.96F 23.31C
```

### Changelog

#### 2015-01-22

Mebus: added Nagios/Icinga Plugin

#### 2014-10-31

Pete Chapman: Fixed poor precision for TEMPer1F (iProduct string "TEMPer1F_V1.3").

#### 2013-05-31

Peter Vojtek: took original version of pcsensor0.0.1 from [this page](http://bailey.st/blog/2012/04/12/dirt-cheap-usb-temperature-sensor-with-python-sms-alerting-system/) and fixed bug: temperatures below zero overflow: 254.3 C is displayed instead of -1.3 C


### Contribution

Send a pull request via github.
