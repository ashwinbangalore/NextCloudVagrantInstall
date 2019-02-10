####
# Optimize your Nextcloud instance
# create a daily cronjob, e.g.:
# crontab -e
# 5 1 * * *  /usr/local/src/install-nextcloud/optimize.sh 2>&1
####
#!/bin/bash
redis-cli -s /var/run/redis/redis.sock <<EOF
FLUSHALL
quit
EOF
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ files:scan --all'
su - www-data -s /bin/bash -c 'php /var/www/nextcloud/occ files:scan-app-data'
exit 0
