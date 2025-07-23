#!/bin/bash

# This script recreates a file if its last modification time is older than a specified duration.

# --- Configuration ---
. /usr/local/vbin/cacti_env.sh


# --- Script Logic ---
TEMP=`mktemp /var/tmp/sensor.XXXXXX` || exit 1
trap "rm -f ${TEMP}" EXIT TERM

# Check if the file exists. If not, create it and exit.
if [ ! -f "$SENSORSFILE" ]
then
	/usr/bin/sensors > $SENSORSFILE
	err=$?
	if [ "$?" != 0 ]
	then
		echo "ERROR in /usr/bin/sensors "
		exit -1
	fi
	chmod 644 $SENSORSFILE
	exit 0
fi

# Use 'find' to check if the file's modification time is older than the threshold.
# '-mmin +N' finds files modified more than N minutes ago.
# '-print -quit' prints the first match and exits immediately for efficiency.
# 'grep -q .' checks if any output was received from find (i.e., if the file was found to be old).
if find "$SENSORSFILE" -mmin +"$THRESHOLD_MINUTES" -print -quit 2>/dev/null | grep -q .
then
	/usr/bin/sensors > $TEMP
	err=$?
	if [ "$?" != 0 ]
	then
		echo "ERROR in refresh /usr/bin/sensors sleep then exit "
		sleep 60
		exit -2
	fi
	if [ ! -s ${TEMP} ]
	then
        	echo "/usr/bin/sensors output is 0"
        	exit -3 
	fi
	mv $TEMP $SENSORSFILE
	chmod 644 $SENSORSFILE
fi
