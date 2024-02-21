#!/bin/bash
SQL_DATABASE=database
SQL_USER=mysql
SQL_PASSWORD=1234
SQL_ROOT_PASSWORD=42Paris
service mariadb start;
sleep 5

mysql -u root -p"${SQL_ROOT_PASSWORD}" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mariadb -u root -p"${SQL_ROOT_PASSWORD}" -e "FLUSH PRIVILEGES;"
mysqladmin -u root --password=${SQL_ROOT_PASSWORD} shutdown

#sleep 5
mysqld_safe
#exec mysqld -u root

echo "Successfully created"
