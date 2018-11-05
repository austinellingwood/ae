##Dockerfile to make a mysql 5.6 server

FROM oraclelinux:7-slim

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.6.42
ARG MYSQL_ROOT_PASSWORD=
ARG MYSQL_USER=
ARG MYSQL_PASSWORD=
ARG MYSQL_DATABASE=
ARG MYSQL_ALLOW_EMPTY_PASSWORD=


# Install server
RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql56-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
      cifs-utils \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d

#make directories in server
VOLUME /var/lib/mysql /tmp
RUN chmod 777 /var/lib/mysql

COPY stage.sql /var/lib/mysql/stage.sql
COPY entrypoint.sh /entrypoint.sh
COPY healthcheck.sh /healthcheck.sh
COPY my.cnf /etc/my.cnf
RUN chmod 777 /entrypoint.sh
RUN chmod 777 /healthcheck.sh
ENTRYPOINT ["bash", "/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306
CMD ["mysqld"]


###########################################################################################
