usb-thermometer: TEMPer1
===============

The original version of pcsensor0.0.1 contains a bug: temperatures below zero overflow and instead of displaying -1.3 C, 254.3 C is displayed. This is a quick and dirty hack to fix it.

http://bailey.st/blog/2012/04/12/dirt-cheap-usb-temperature-sensor-with-python-sms-alerting-system/
