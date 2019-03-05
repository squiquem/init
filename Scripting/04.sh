#!/bin/bash
if ! [ -f /home/vagrant/crontab.sum ]
then
	cat /etc/crontab > /home/vagrant/crontab.sum
	echo “Crontab copied”
elif ! [ -f /etc/crontab ]
then
	printf “There is no %s \n” “$2”
	exit 2
fi

old="$(md5sum /home/vagrant/crontab.sum | cut -d ' ' -f1)"
current="$(md5sum /etc/crontab | cut -d ' ' -f1)"

if [ "$old" = "$current" ]
then
	echo “No change”
	exit 0
else
	echo “Change detected, sending mail”
	echo “Crontab has changed” | mail –s “Crontab has changed” root
	cat /etc/crontab > /home/vagrant/crontab.sum
	exit 1
fi
