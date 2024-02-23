FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	curl

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

RUN mkdir -p /var/www/aducobu/wordpress

RUN mkdir /run/php/

COPY tools/wpscript.sh /

# Attribution des droits appropries sur le repertoire Wordpress
RUN chown -R root:root /var/www/aducobu/wordpress

ENTRYPOINT ["sh", "/wpscript.sh"]
