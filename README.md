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

### collectd integration

    sudo make install collectd-install
    sudo systemctl restart collectd

### Changelog

#### 2016-01-10

[asac](https://github.com/asac): add make install rule for easier distro integration

#### 2015-11-11

[Hendrik Bergunde](https://github.com/hendrikb/): Introduce the ```-s``` parameter, that takes an offset as mandatory argument that gets **substracted** from (all) displayed temperatures. This can become handy, since the measured temperature sometimes looks significantly too high. The argument is considered to be given in degree Celsius (°C) and supports integer and float values. Practically, I can recommend an offset of about ```-s7.5```. The Fahrenheit values automatically take advantage of the offset as well.

#### 2015-01-22

Mebus: added Nagios/Icinga Plugin

#### 2014-10-31

Pete Chapman: Fixed poor precision for TEMPer1F (iProduct string "TEMPer1F_V1.3").

#### 2013-05-31

Peter Vojtek: took original version of pcsensor0.0.1 from [this page](http://bailey.st/blog/2012/04/12/dirt-cheap-usb-temperature-sensor-with-python-sms-alerting-system/) and fixed bug: temperatures below zero overflow: 254.3 C is displayed instead of -1.3 C


### Contribution

Send a pull request via github.
