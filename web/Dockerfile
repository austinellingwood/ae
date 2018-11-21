#Dockerfile for centos 6 release to install apache, configure it to display a webpage

FROM systemd:latest

#add user user
RUN useradd -ms /bin/bash user

# Install dependencies

RUN yum install httpd -y; yum clean all; service httpd start
EXPOSE 80
CMD ["/sbin/init"]
RUN chkconfig httpd on

#ensure packages up to date
RUN yum update -y

RUN yum install mysql git -y

# Configure apache
RUN groupadd www
RUN usermod -a -G www user
RUN chown -R root:www /var/www
RUN chmod 2775 /var/www
RUN find /var/www -type d -exec chmod 2775 {} +
RUN find /var/www -type f -exec chmod 0664 {} +

# Install apache and write files

RUN yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-6.noarch.rpm -y
RUN yum install http://rpms.remirepo.net/enterprise/remi-release-6.rpm -y
RUN yum install yum-utils -y
RUN yum-config-manager --enable remi-php70 -y
RUN yum install php70-php php70-php-mysqlnd php70-php-pdo php70-php-gd php70-php-mbstring php70-php-pecl-imagick php70-php-mcrypt php70-php-pecl-memcached php70-php-soap php70-php-xml php70-php-cli php70-php-pecl-redis -y

COPY /php.ini /etc/opt/remi/php70

##Adding files into craft
#COPY ./iuhealth /var/www/html/
#COPY ./sample.php /var/www/html/
#COPY ./dbinfo.inc /var/www/inc/




##############################################################################################################################################################
