#!/bin/sh

# Expects 1 parameter

# Posibilities of first parameter:
# CPU - CPU fan
#Chassis_Fan_1
#Chassis Fan_2
#Chassis_Fan_3
#Water_Pump_1
#CPU_OPT
#EXT_Fan_1
#EXT_Fan_2
#EXT_Fan_3
#Cover_Fan

# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


if [ $# -eq 1 ] 
then
  case "$1" in
    CPU)
	cat ${SENSORSFILE} | /bin/grep '^CPU Fan:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    Chassis_Fan_1)
	cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    Chassis_Fan_2)
	cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 2:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    Chassis_Fan_3)
	cat ${SENSORSFILE} | /bin/grep '^Chassis Fan 3:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    Cover_Fan)
	cat ${SENSORSFILE} | /bin/grep '^Cover Fan:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    CPU_OPT)
	cat ${SENSORSFILE} | /bin/grep '^CPU OPT:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    EXT_Fan_1)
	cat ${SENSORSFILE} | /bin/grep '^EXT Fan 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    EXT_Fan_2)
	cat ${SENSORSFILE} | /bin/grep '^EXT Fan 2:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    EXT_Fan_3)
	cat ${SENSORSFILE} | /bin/grep '^EXT Fan 3:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    Water_Pump_1)
	cat ${SENSORSFILE} | /bin/grep '^Water Pump 1:' | /bin/sed 's/^.*: *\([0-9\.]*\) RPM.*$/\1/'
    ;;
    *)
	  echo -1
    ;;
  esac
else
  echo -2
fi
