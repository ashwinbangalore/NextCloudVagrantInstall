#!/bin/bash

# Specify the DB names, IDs and Passwords you'd like to use
# with the NextCloud installation:

# This is the name of the internal NextCloud Database that will run on 
# the installed MariaDB database.
export NEXTCLOUDDBNAME="ncdb"

# This is the user ID NextCloud connects to the internal MariaDB database:
# Edit the values within the quotes to your liking.
export NEXTCLOUDDBUSER="ncdbuser"
export NEXTCLOUDDBPASSWORD="ncdbuserpass"

# This section sets up the first/admin user of the NextCloud installation:
# Subsequent users can be added via NextCloud GUI.
export NEXTCLOUDADMINUSER="ncuser"
export NEXTCLOUDADMINUSERPASSWORD="ncuserpass"


