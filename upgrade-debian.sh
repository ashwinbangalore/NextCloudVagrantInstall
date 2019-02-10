# Debian 9.x Stretch
#!/bin/bash
/usr/sbin/service nginx stop
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/updater/updater.phar'
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ status'
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ -V'
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ db:add-missing-indices'
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ db:convert-filecache-bigint'
sed -i "s/upload_max_filesize=.*/upload_max_filesize=10240M/" /var/www/nextcloud/.user.ini
sed -i "s/post_max_size=.*/post_max_size=10240M/" /var/www/nextcloud/.user.ini
sed -i "s/output_buffering=.*/output_buffering='Off'/" /var/www/nextcloud/.user.ini
chown -R www-data:www-data /var/www/nextcloud
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ update:check'
/usr/sbin/service php7.3-fpm restart
/usr/sbin/service nginx restart
exit 0
