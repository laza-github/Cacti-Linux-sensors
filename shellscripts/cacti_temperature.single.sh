#!/bin/sh

# Expects 1 parameter

# Posibilities of first parameter:
# CPU_socket - CPU Socket Temperature
# CPU - CPU Temperature
# CPU_VRM - CPU VRM Temperature
# Motherboard - Motherboard Temperature
# Chipset - Chipset Temperature

# Return value or negative number when error occurs

# Requirements !!!
# - 

. /usr/local/vbin/cacti_env.sh


if [ $# -eq 1 ] 
then
  case "$1" in
    CPU)
	cat ${SENSORSFILE} | /bin/grep '^CPU Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
    ;;
    CPU_socket)
	cat ${SENSORSFILE} | /bin/grep '^CPU Socket Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
    ;;
    CPU_VRM)
	cat ${SENSORSFILE} | /bin/grep '^CPU VRM Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
    ;;
    Motherboard)
	cat ${SENSORSFILE} | /bin/grep '^Motherboard Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
    ;;
    Chipset)
	cat ${SENSORSFILE} | /bin/grep '^Chipset Temperature:' | /bin/sed 's/^.*: *+\([0-9\.]*\).*$/\1/'
    ;;
    *)
	  echo -1
    ;;
  esac
else
  echo -2
fi
