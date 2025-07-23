#!/bin/sh

# Expects 0 parameter


# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


cat ${SENSORSFILE} | /bin/grep '^CPU Core Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^CPU SOC Voltage:' | head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) mV .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^DRAM AB Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^DRAM CD Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^1.8V PLL Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^+12V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^+5V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^3VSB Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^VBAT Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^SB 1.05V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^AVCC3 Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
