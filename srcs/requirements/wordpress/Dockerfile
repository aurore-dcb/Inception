FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/aducobu/wordpress

RUN mkdir /run/php/

COPY tools/wpscript.sh /

# Telecharge Wordpress
RUN wget -P /var/www/aducobu/wordpress https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz
RUN cd /var/www/aducobu/wordpress && tar -zxvf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz

# Attribution des droits appropries sur le repertoire Wordpress
RUN chown -R root:root /var/www/aducobu/wordpress

# Telecharge WP-CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

ENTRYPOINT ["sh", "/wpscript.sh"]
