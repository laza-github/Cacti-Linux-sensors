#!/bin/sh

# Expects 0 parameter

# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


cat ${SENSORSFILE} | /bin/grep '^CPU Fan:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 2:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 3:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Cover Fan:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^CPU OPT:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^EXT Fan 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^EXT Fan 2:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^EXT Fan 3:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Water Pump 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
