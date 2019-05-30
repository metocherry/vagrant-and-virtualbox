#!/usr/bin/env bash
#
# References
# - https://www.hostinger.com/tutorials/how-to-install-postgresql-on-centos-7/

# Install PostgreSQL
sudo yum install -y postgresql-server postgresql-contrib

# Initialize the database
sudo postgresql-setup initdb

# Start the database
sudo systemctl start postgresql

# Enable PostgreSQL
sudo systemctl enable postgresql


# In linux by default, a user named `postgres` is created once PostgreSQL is installed.
# output:
# postgres  :     x     : 26            : 26            : PostgreSQL Server : /var/lib/pgsql  : /bin/bash
# user name : password  : user id(UID)  : group id(GID) : info              : home directory  : shell env
cat /etc/passwd | grep postgres

# change the password for the PostgreSQL
sudo passwd postgres

# su(switch user)
# su - <user_name> : change a user with env(shell and home directory)
su - postgres
