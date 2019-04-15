#                                                       #
# Cookbook:: example_chef_website                       #
# Recipe:: default                                      #
#                                                       #
# Copyright:: 2019, Tyler Schrock, All Rights Reserved. #

# LAMP-Related Tasks #
## Apache-Related Tasks ##
### Installing Apache ###
package 'httpd' do
  action :install
end

### Installing PHP ###
package 'php' do
  action :install
end

package 'php-mysql' do
  action :install
end

### Starting and enabling Apache ###
service 'httpd' do
  action [ :enable, :start ]
end

### Copying over a simple index.html file ###
cookbook_file "/var/www/html/index.html" do
  source "index.html"
  mode "0644"
end

## MySQL / MariaDB-Related Tasks ##
### Installing MySQL / MariaDB ###
package 'mariadb-server' do
  action :install
end

package 'mariadb' do
  action :install
end

### Starting and enabling MySQL / MariaDB ###
service 'mariadb.service' do
  action [ :enable, :start ]
end

### Configuring a MySQL / MariaDB root password ###
cookbook_file "/tmp/mysql_secure_install.sh" do
  source "mysql_secure_install.erb"
  mode "0755"
end

### Setting Data Bag Variables ###
mysql_root_password_information = search(:example_chef_website_mysql_root_password, 'id:mysql_data')
mysql_root_password_information.each do |mysql_root_password_information|
  mysql_root_password_nostrip = mysql_root_password_information['_default']['password']
  mysql_root_password = mysql_root_password_nostrip.strip
  execute "Configuring a MySQL / MariaDB root password" do
    command "bash /tmp/mysql_secure_install.sh #{mysql_root_password}"
  end
end

execute "Removing the script used to set the root password." do
  command "rm -rf /tmp/mysql_secure_install.sh"
end

# Firewall-Related Tasks #
## Setting up appropriate firewall rules ##
execute 'httpd_firewall' do
  command '/usr/bin/firewall-cmd  --permanent --zone public --add-service http'
  ignore_failure true
end

## Reloading firewalld ##
execute 'reload_firewall' do
  command '/usr/bin/firewall-cmd --reload'
  ignore_failure true
end
