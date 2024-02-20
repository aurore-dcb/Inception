FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
#EXPOSE 3306
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
#RUN service mysql start
#RUN systemctl start mariadb
COPY ./conf/mdb_script.sh /mdb_script.sh
CMD ["sh", "-c", "/mdb_script.sh && exec mysqld_safe"]
