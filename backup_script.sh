#!/bin/bash

## Backup
#docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

## Restore
#cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

#configuration
BACKUP_DIR=/home/snoopy/backup/

#credentials are read from the proper environment file
MYSQL_PASSWORD=$(grep MYSQL_PASSWORD nextcloud/credentials_nextcloud.env | sed 's/MYSQL_PASSWORD=//')

#create BACKUP_DIR if it doesn't exist
mkdir -p $BACKUP_DIR

docker exec -u www-data nextcloud_app_1 /usr/local/bin/php occ maintenance:mode --on

docker exec nextcloud_db_1 /usr/bin/mysqldump -u nextcloud -p$MYSQL_PASSWORD nextcloud > $BACKUP_DIR'db_backup/backup.sql'



docker exec -u www-data nextcloud_app_1 /usr/local/bin/php occ maintenance:mode --off
