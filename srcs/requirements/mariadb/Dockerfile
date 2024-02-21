FROM debian:bullseye
RUN apt update -y
RUN apt upgrade -y
RUN apt-get install mariadb-server -y
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/mdb_script.sh ./
RUN chmod +x ./mdb_script.sh
EXPOSE 3306
ENTRYPOINT ["bash", "./mdb_script.sh"]
