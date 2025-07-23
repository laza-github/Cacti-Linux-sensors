# Cacti-Linux-sensors
Cacti Templates, data collection script for Linux lm-sensors
Author Marco Re
Contact: laza_bsd@laza.it
Template version: 0.1
Cacti version: 0.8.8a and above

I prepared Cacti templates to collect Linux servers temperature, fan and voltage. 

Advantages:
- Data are collected only via snmp 
- Lower load against collecting data via ssh command
- It is possible to add another values
- You can use data from shell script or a binary
- In combination with threshold = very useful alerting tool for everything (raid volume fail, ...)
- all important values from different sources (raid, smartmontools, apcupsd) are stored in one place
- you can easily change shell scripts and change or add another value 


Templates contains 3 types of graphs:
-------------------------------------
1) Fan
2) Temperature
3) Voltage

Installation:
-------------
1) 
    a) apt install snmpd
    b) edit /etc/snmp/snmpd.conf
	- change location, community, ... 
    c) cp net-snmp/net-snmp-cacti.conf /etc/snmp/snmpd.conf.d
    d) start net-snmp: service snmpd start


2) Shell scripts
     a) mkdir /usr/local/vbin/
     b chown root:wheel /usr/local/vbin/
     c) chmod 755 /usr/local/vbin/
     d) cp shellscripts/cacti_*.sh to /usr/local/vbin/
     e) chown root:wheel /usr/local/vbin/cacti_*.sh
     f) chmod 750 /usr/local/vbin/cacti_*.sh
3) crontab
add "*  *  *  *  * root /usr/local/vbin/crontab_script.sh " to /etc/crontab inside the script there is a check if the file is not older than THRESHOLD_MINUTES is not updated

4) Import templates
    a) import templates/*.xml (console -> import templates)

