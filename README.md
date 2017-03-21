# mkbackup
A tool to automate the backups of Mikrotik devices.

Version 1.0.0
by Gavin h8r1dx4@gmail.com
& AnRkey anarkey@gmail.com 
16 November 2016

---

## Prerequisites

---
1. All routers need a user called backups with full permissions.
2. All routers must have a dns record and matching identity
   ie. router dns record  = rtr-router-1.somedomain.com router identity = rtr-router-1
3. DSA public key stored in ~/.ssh

---

## Setup

---

1. Edit the file router.list , enter the routers identity , one router per line.
2. Run the ssh-key-deploy.sh , this will login to every router in the router.list
   and copy the dsa key to it and install it. You will have to enter the password
   for the backups user you created.
3. Run mkbackups.sh this will login to every router in router.list make a backup
   and copy it into a directory labeled with the current day, month and year.

---

## Logs

---

1. Every time mkbackup runs it will write a logfile in the directory where the
   backups are saved.

---

## Automation

---  

1. Backups can be automated by adding cronjob. To do this simply run
   add-cronjob.sh , by default it will add a cronjob that will run 
   mkbackup.sh every day at 00:00.

---

***and remember to pay it forward***
