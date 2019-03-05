#!/bin/bash
echo "00 00 * * * root sudo sh /root/04.sh" >> /etc/crontab; /etc/init.d/cron restart
