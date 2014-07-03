#!/bin/sh

TIME=`date --utc -Iminutes`
ssh remote-server cp -val /mount/backup/laptop/current/ /mount/backup/laptop/$TIME
rsync -a --delete --password-file=~/.rsync-password -v --link-dest=../$TIME --exclude-from=.rsync-exclude ~/ remote-server:/mount/backup/laptop/current/ >> /tmp/backup.log
echo DONE >> /tmp/backup.log
