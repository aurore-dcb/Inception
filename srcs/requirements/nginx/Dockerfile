FROM debian:bullseye
RUN apt update
RUN apt install nginx -y
RUN apt install vim -y
RUN apt install curl -y
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y
RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/inception.key -out /etc/nginx/ssl/inception.crt -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=aducobu.42.fr/UID=aducobu@student.42.fr"
EXPOSE 443
COPY conf/nginx.conf /etc/nginx/nginx.conf
RUN mkdir /var/www/aducobu
RUN chmod 755 /var/www/aducobu
RUN chown -R www-data:www-data /var/www/aducobu
CMD [ "nginx", "-g", "daemon off;" ]
