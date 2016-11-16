# mkbackup
a Tool to automate the backups of Mikrotik devices.

Version 1.0.0
by Gavin h8r1dx4@gmail.com
& AnRkey anarkey@gmail.com 
16 November 2016
---
##PREREQUISITES
---
1. All routers need a user called backups with full permissions.
2. All routers must have dns record and matching identity
   ie. router dns record  = rtr-router-1.somedomean.com router identity = rtr-router-1
3. DSA public key stored in ~/.ssh
---
##SETUP
---
1. Edit the file router.list enter the routers identity , one router per line.
2. Run the ssh-key-deploy.sh , this will login to every router in the router.list
   and copy the dsa key to it and install it. You will have to enter the password
   for the backups user you created.
3. Run mkbackups.sh this will login to every router in router.list make a backup
   and copy it into a directory labelled with the current day, month and year.
---
##LOGS
---
1. Every time mkbackup runs it will write a logfile in the directory where the
   backups are saved.
---
##AUTOMATION
---  
1. Backups can be automated by adding cron job. to do this simply run
   add-cronjob.sh by default it will add a cronjob that will run mkbackup.sh
   every day at 00:00.
---
***and remember to pay it forward***
