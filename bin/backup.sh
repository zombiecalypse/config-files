#!/bin/sh

if [ -z "$(iwconfig 2>/dev/null | grep ESSID:\"Phi\")" ]
then
  echo `iwconfig 2>/dev/null | grep ESSID:`
  exit 1
else
  TIME=`date --utc -Iminutes`
  ssh local-server cp -val /mount/backup/laptop/current/ /mount/backup/laptop/$TIME
  rsync -a --delete --password-file=~/.rsync-password -v --link-dest=../$TIME --exclude-from=~/.rsync-exclude ~/ /mount/backup/laptop/current/ >> /tmp/backup.log
  echo DONE >> /tmp/backup.log
fi
