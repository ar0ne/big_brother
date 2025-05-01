#!/bin/bash

cp big-brother-script.sh /opt/big-brother-script.sh

chmod 744 /opt/big-brother-script.sh

cp big-brother.service /etc/systemd/system/big-brother.service

cp big-brother.timer /etc/systemd/system/big-brother.timer

systemctl daemon-reload

systemctl enable big-brother.timer