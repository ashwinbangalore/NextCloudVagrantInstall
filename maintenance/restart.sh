###
# restart all Nextcloud related services
# issue: /usr/local/src/install-nextcloud/restart.sh
###
#!/bin/bash
/usr/sbin/service nginx stop
/usr/sbin/service mysql restart
/usr/sbin/service redis-server restart
/usr/sbin/service php7.3-fpm restart
/usr/sbin/service nginx restart
exit 0
