#!/bin/bash

date=`date +%F`/
dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )/"
list=$dir'router.list'
filelines=`cat $list`

mkdir -p $dir$date
echo `date`": ""Backups Run" >> $dir/log.txt
echo `date`": ""Backups Start" >> $dir$date/log.txt

for line in $filelines ; do
	echo $line
	echo 'Backup'
	ssh backups@$line "/system backup save name=[/system identity get name]; /export verbose file=[/system identity get name]"
	VAR1=$?
	sleep 2

	echo 'Copying Backup'
	mkdir -p $dir$date$line
	scp backups@$line:$line.backup $dir$date$line

	echo 'Copying Export'
	scp backups@$line:$line.rsc $dir$date$line
	VAR2=$?
	echo 'Done'
	echo "Router :" $line "Backup Finished at :" `date` "Backup Status :" $VAR1 "Copy Status :" $VAR2 >> $dir$date/log.txt
done

echo `date`": ""Backups End" >> $dir$date/log.txt
