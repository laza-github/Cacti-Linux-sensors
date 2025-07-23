#!/bin/sh

# Expects 0 parameter

# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


cat ${SENSORSFILE} | /bin/grep '^CPU Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^CPU Socket Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^CPU VRM Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Motherboard Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
cat ${SENSORSFILE} | /bin/grep '^Chipset Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
