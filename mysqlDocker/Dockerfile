##Dockerfile to make a mysql 5.6 server

FROM oraclelinux:7-slim

ARG MYSQL_SERVER_PACKAGE=mysql-community-server-minimal-5.6.42
ARG MYSQL_ROOT_PASSWORD=password
ARG MYSQL_USER=iuhealth-user
ARG MYSQL_PASSWORD=password
ARG MYSQL_DATABASE=stage


# Install server
RUN yum install -y https://repo.mysql.com/mysql-community-minimal-release-el7.rpm \
      https://repo.mysql.com/mysql-community-release-el7.rpm \
  && yum-config-manager --enable mysql56-server-minimal \
  && yum install -y \
      $MYSQL_SERVER_PACKAGE \
      $MYSQL_SHELL_PACKAGE \
      libpwquality \
  && yum clean all \
  && mkdir /docker-entrypoint-initdb.d

#make directories in server
VOLUME /var/lib/mysql
RUN chmod 755 /var/lib/mysql
COPY /stage.sql /var/lib/mysql

COPY docker-entrypoint.sh ./entrypoint.sh
COPY healthcheck.sh ./healthcheck.sh
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306
CMD ["mysqld"]

###########################################################################################
