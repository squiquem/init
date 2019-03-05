#!/bin/bash
echo "00 04 * * 1 root sudo sh /root/02.sh" >> /etc/crontab; /etc/init.d/cron restart
