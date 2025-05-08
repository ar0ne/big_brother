#!/bin/bash

mkdir "${HOME}/.config/systemd/user"

cp big-brother-script.sh "${HOME}"/.config/big-brother-script.sh

chmod 755 "${HOME}"/.config/big-brother-script.sh

cp big-brother.service "${HOME}"/.config/systemd/user/big-brother.service

cp big-brother.timer "${HOME}"/.config/systemd/user/big-brother.timer

systemctl --user daemon-reload

systemctl --user enable big-brother.timer

systemctl --user start big-brother.timer
