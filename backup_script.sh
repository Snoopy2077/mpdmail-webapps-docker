## Backup
#docker exec CONTAINER /usr/bin/mysqldump -u root --password=root DATABASE > backup.sql

## Restore
#cat backup.sql | docker exec -i CONTAINER /usr/bin/mysql -u root --password=root DATABASE

docker exec -u www-data nextcloud_app_1 /usr/local/bin/php occ maintenance:mode --on

docker exec nextcloud_db_1 /usr/bin/mysqldump -u nextcloud -pZ2oSnqBDSLjUiHh5LYBQy3JwZO9FX5drkiNgUNRSEMVVL76v nextcloud > backup.sql

docker exec -u www-data nextcloud_app_1 /usr/local/bin/php occ maintenance:mode --off
