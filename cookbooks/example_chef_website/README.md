# example_chef_website

This is a cookbook built to install Apache, MySQL and PHP on a CentOS server.

It has been tested on CentOS 7 at this time, but not on any other Operating Systems.

## Installed Packages

The following packages will be installed when this cookbook runs:
* httpd
* php
* php-mysql
* mariadb-server
* mariadb

### MySQL / MariaDB

MySQL / MariaDB is automatically installed and secured using a shell script which is included in **files/mysql_secure_install.erb**

That requires a data bag to be created in your chef organization. To do that, follow these steps:
1. Create a new data bag with the following command:
* knife data bag create example_chef_website_mysql_root_password
2. Create a new JSON file named data.json which contains information in the following format:
```{
  "id": "mysql_data",
  "_default": {
    "password": "your_mysql_password_here"
  }
}```
3. Import your data.json file into the data bag using the following command:
* knife data bag from file example_chef_website_mysql_root_password data.json
