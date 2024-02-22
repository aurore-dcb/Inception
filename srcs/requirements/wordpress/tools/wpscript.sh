SQL_DATABASE=wordpress
SQL_USER=username
SQL_PASSWORD=password
DOMAIN_NAME=domain
SITE_TITLE=title
ADMIN_USER=user
ADMIN_PASSWORD=1234abcd
ADMIN_EMAIL=adnak@asdla
USER1_LOGIN=login1
USER1_MAIL=mail1@dhskcjsd
USER1_PASSWORD=jkfasdkj

#!/bin/sh

# Verifie si le fichier wp-conf.php existe (pour ne pas reconfigurer Wordpress a chaque lancement)
if [ -e "/var/www/aducobu/wordpress/wp-config.php" ]
then
	sleep 5
else
	# Si le fichier n'existe pas -> installation de Wordpress
	sleep 10
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp

	wp core download --allow-root --version=6.4 --path=/var/www/aducobu/wordpress

	cd /var/www/aducobu/wordpress/

	# Cree le fichier de configuration Wordpress
	wp config create --allow-root \
		--dbname=${SQL_DATABASE} \
		--dbuser=${SQL_USER} \
		--dbpass=${SQL_PASSWORD} \
		--dbhost=mariadb ;

	# Installe Wordpress
	wp core install --allow-root \
		--url=https://${DOMAIN_NAME} \
		--title=${SITE_TITLE} \
		--admin_user=${ADMIN_USER} \
		--admin_password=${ADMIN_PASSWORD} \
		--admin_email=${ADMIN_EMAIL} ;

	# Cree un utilisateur Wordpress
	wp user create --allow-root \
		${USER1_LOGIN} ${USER1_MAIL} \
		--user_pass=${USER1_PASSWORD} \
		--role=author ;
fi

# Execute PHP_FPM (FastCGI Process Manager) en avant plan
exec /usr/sbin/php-fpm7.4 -F
