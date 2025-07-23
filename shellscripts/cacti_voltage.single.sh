#!/bin/sh

# Expects 1 parameter

# Posibilities of first parameter:
#CPU_Core 
#CPU_SOC 
#DRAM_AB
#DRAM_CD
#1.8V
#12V 
#5V
#3VSB
#VBAT 
#AVCC3
#SB_1.05V 

# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


if [ $# -eq 1 ] 
then
  case "$1" in
    CPU_Core)
	cat ${SENSORSFILE} | /bin/grep '^CPU Core Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    CPU_SOC)
	cat ${SENSORSFILE} | /bin/grep '^CPU SOC Voltage:' | head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) mV .*$/\1/'
    ;;
    DRAM_AB)
	cat ${SENSORSFILE} | /bin/grep '^DRAM AB Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    DRAM_CD)
	cat ${SENSORSFILE} | /bin/grep '^DRAM CD Voltage:' |head -1 | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    1.8V)
	cat ${SENSORSFILE} | /bin/grep '^1.8V PLL Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    12V)
	cat ${SENSORSFILE} | /bin/grep '^+12V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    5V)
	cat ${SENSORSFILE} | /bin/grep '^+5V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    3VSB)
	cat ${SENSORSFILE} | /bin/grep '^3VSB Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    VBAT)
	cat ${SENSORSFILE} | /bin/grep '^VBAT Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    SB_1.05V)
	cat ${SENSORSFILE} | /bin/grep '^SB 1.05V Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    AVCC3)
	cat ${SENSORSFILE} | /bin/grep '^AVCC3 Voltage:' | /bin/sed 's/^.*: *\([0-9\.]*\) V .*$/\1/'
    ;;
    *)
	  echo -1
    ;;
  esac
else
  echo -2
fi
