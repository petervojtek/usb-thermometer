#! /usr/bin/env python
import sys
import subprocess
import os

status = { 'OK' : 0 , 'WARNING' : 1, 'CRITICAL' : 2 , 'UNKNOWN' : 3}

warn=False
crit=False

warn_limit = 23
crit_limit = 26

program  = os.path.join(os.path.dirname(os.path.abspath(__file__)), "pcsensor")
output = subprocess.Popen([program, "-n"], stdout=subprocess.PIPE).communicate()[0]
temperatur = float(output.strip())

if temperatur >= warn_limit :
    warn = True

if temperatur >= crit_limit:
    crit = True

if temperatur < 13:
    crit = True

if warn == True:
       if crit == True:
               print 'Critical Temperature: '+str(temperatur) + ' Celsius'
               sys.exit(status['CRITICAL'])
       else:
               print 'Warning Temperature: '+str(temperatur) + ' Celsius'
               sys.exit(status['WARNING'])
else:
       print 'status OK info ' +str(temperatur) + ' Celsius'
       sys.exit(status['OK'])
