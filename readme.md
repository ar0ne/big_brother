# HOWTO

If you have an app (little brother) that must be running during your working hours, but it should not know about some other apps that you might also want to run. Then you could install this service with your systemd timer and limit work of the app. 

Basically, timer executes script each minute during your desired time window and ensures you aren't runnig any not desired apps simultaneously.

Edit *little_brother* and *whitelist* in `big-brother-script.sh`.

If you need different working hours, you might also want to update timer config (by default from 09:00 till 20:00)

To install you could use `$ sudo ./install.sh` or do it manually.

To check logs: `journalctl -u big-brother.service`