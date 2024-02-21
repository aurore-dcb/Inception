FROM debian:bullseye
RUN apt-get update -y \
	&& apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get install -y php7.4 \
	php-fpm \
	php-mysql \
	mariadb-client

RUN wget -P /var/www https://fr.wordpress.org/wordpress-6.4.3-fr_FR.tar.gz
RUN cd /var/www && tar -zxvf wordpress-6.4.3-fr_FR.tar.gz && rm wordpress-6.4.3-fr_FR.tar.gz
RUN chown -R root:root /var/www/wordpress

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

#CMD ["php-fpm7.4", "--nodaemonize"]
