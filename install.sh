#!/bin/bash

mkdir -p "${HOME}/.config/systemd/user"

mkdir -p "${HOME}/.scripts"

cp big-brother-script.sh "${HOME}"/.scripts/big-brother-script.sh

chmod 755 "${HOME}"/.scripts/big-brother-script.sh

cp big-brother.service "${HOME}/.config/systemd/user/big-brother.service"

sed -i "s|ExecStart=|ExecStart=$HOME/.scripts/big-brother-script.sh|g" "${HOME}"/.config/systemd/user/big-brother.service

cp big-brother.timer "${HOME}"/.config/systemd/user/big-brother.timer

systemctl --user daemon-reload

systemctl --user enable big-brother.timer

systemctl --user start big-brother.timer
