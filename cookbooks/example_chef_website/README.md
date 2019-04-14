# example_chef_website

This is a cookbook built to install Apache, MySQL and PHP on a CentOS server.

It has been tested on CentOS 7 at this time, but not on any other Operating Systems. 

## Installed Packages

The following Packages will be installed when this cookbook runs:
* httpd
* php
* php-mysql
* mariadb-server
* mariadb

### MySQL / MariaDB

MySQL / MariaDB is automatically installed and secured using a shell script which is included in **files/mysql_secure_install.erb**

Keep in mind, it does this using a pre-defined password which is, at this time **VAdTdqNtE3w2J44s5A38WT8ZGwcQf4fN**

That can be changed by modifying the default recipe included in this cookbook.
