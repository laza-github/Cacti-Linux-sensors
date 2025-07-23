# Cacti-Linux-sensors
Cacti Templates, data collection script for Linux lm-sensors   
Author Marco Re  
Template version: 0.1
Cacti version: 0.8.8a and above

I created these Cacti templates to collect Linux servers temperature, fan and voltage.   

Advantages:   
- Data are collected only via snmp   
- Lower load against collecting data via ssh command  
- It is possible to add another values  
- You can use data from shell script or a binary  

Templates contains 3 types of graphs:
-------------------------------------
1. Fan
2. Temperature
3. Voltage  

Installation:
-------------
1. install snmpd
```
apt install snmpd
```
  - edit /etc/snmp/snmpd.conf
	- change location, community, ...
```
cp net-snmp/net-snmp-cacti.conf /etc/snmp/snmpd.conf.d
service snmpd start
```

2. Shell scripts
```
mkdir /usr/local/vbin/
chown root /usr/local/vbin/
chmod 755 /usr/local/vbin/
cp shellscripts/cacti_*.sh to /usr/local/vbin/
chown root /usr/local/vbin/cacti_*.sh
chmod 750 /usr/local/vbin/cacti_*.sh
```
3. crontab add to /etc/crontab  this line
```
*  *  *  *  * root /usr/local/vbin/crontab_script.sh
```
  - **NOTE** inside the script there is a check if the file is not older than THRESHOLD_MINUTES is not updated

4. Import templates   
   - import templates/*.xml (console -> import templates)

