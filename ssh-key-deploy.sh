#!/bin/bash

date=`date +%F`/
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
list=$dir'router.list'
filelines=`cat $list`

echo `date`": ""SSH Key Deploy Start" >> $dir/log.txt
echo Start

for line in $filelines ; do
	echo $line
	scp ~/.ssh/id_rsa.pub backups@$line:/
	VAR1=$?

	wait 10

	ssh backups@$line /user ssh-keys import user=backups public-key-file=id_rsa.pub
	VAR2=$?
	echo "Router :" $line "Key Deploy Finished at :" `date` "Key Copy :" $VAR1 "Key Install :" $VAR2 >> $dir/log.txt
done

echo `date`": ""SSH Key Deploy End" >> $dir/log.txt
