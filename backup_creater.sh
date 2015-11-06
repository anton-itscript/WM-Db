#!/bin/bash

if [  -f /var/wm_backups/new ]; then
	set BACKUPNAME;
	BACKUPNAME=$(cat /var/wm_backups/new);
	/usr/bin/mysqldump --user=wm --password=wm_pass --result-file=/var/wm_backups/${BACKUPNAME} wm_docker
	
	rm /var/wm_backups/new 
fi

if [  -f /var/wm_backups/new_long ]; then
	set BACKUPNAME_LONG
	BACKUPNAME_LONG=$(cat /var/wm_backups/new_long);
	/usr/bin/mysqldump --user=wm --password=wm_pass --result-file=/var/wm_backups/${BACKUPNAME_LONG} wm_docker_long
	
	rm /var/wm_backups/new_long
fi
