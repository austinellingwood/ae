##Dockerfile to make a mysql 5.6 server

FROM 767423847625.dkr.ecr.us-east-2.amazonaws.com/golf-repo/systemd:latest

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
VOLUME /etc/mysql

COPY docker-entrypoint.sh ./entrypoint.sh
COPY healthcheck.sh ./healthcheck.sh
ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK CMD /healthcheck.sh
EXPOSE 3306

RUN service mysqld start

RUN mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE}"
RUN mysql -u root stage < /tmp/stage.sql

###########################################################################################
