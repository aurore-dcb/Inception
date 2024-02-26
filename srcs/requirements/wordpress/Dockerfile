FROM debian:bullseye

RUN apt update -y \
	&& apt upgrade -y
# RUN apt-get -y install wget
RUN apt install -y php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client \
	curl

EXPOSE 9000

COPY conf/www.conf /etc/php/7.4/fpm/pool.d

RUN mkdir -p /var/www/aducobu/wordpress

RUN mkdir /run/php/

COPY tools/wpscript.sh /

RUN chmod +x ./wpscript.sh

# Attribution des droits appropries sur le repertoire Wordpress
RUN chown -R root:root /var/www/aducobu/wordpress

ENTRYPOINT ["sh", "/wpscript.sh"]
