#! /bin/sh

cd /sickbeard
if [ -b /config/config.ini ]
then
	rm -rf /sickbeard/config.ini
else
	mv -f /sickbeard/config.ini /config/config.ini
fi
ln -sf /config/config.ini /sickbeard/
/usr/bin/python SickBeard.py
