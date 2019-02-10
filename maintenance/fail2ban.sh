###
# StatusQuo: Fail2Ban
# please issue: /usr/local/src/install-nextcloud/fail2ban.sh
###
#!/bin/bash
fail2ban-client status nextcloud && fail2ban-client status nginx-http-auth && fail2ban-client status sshd
exit 0
