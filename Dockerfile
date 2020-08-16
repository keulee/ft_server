#DOCKER BASE OS
FROM debian:buster

#MAINTAINER
MAINTAINER keungeun LEE <keulee@student.42.fr>

#COPY THE FILES TO THE CONTAINER
COPY srcs/nginx-conf ./tmp/
COPY srcs/start.sh ./tmp/
COPY srcs/wp-config.php ./tmp/
COPY srcs/config.inc.php ./tmp/
COPY srcs/mysql.sh ./tmp/

#INSTALL NGINX, PHP, MYSQL(MARIADB), wget
RUN apt-get update 
RUN apt-get install -y nginx \
		mariadb-server mariadb-client \
		php7.3-fpm php7.3-mysql \
		php7.3-common php7.3-xml php7.3-cli php7.3-curl php7.3-json php7.3-mbstring php7.3-zip php7.3-gd \
		gpg \
		wget

#AUTORIATION CHANGE
RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

#SSL
RUN mkdir /etc/nginx/ssl/ && mkdir /etc/nginx/ssl/certs/ /etc/nginx/ssl/private/
RUN chmod -R 700 /etc/nginx/ssl/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private/localhost.key -out /etc/nginx/ssl/certs/localhost.crt -subj "/C=FR/ST=Paris/L=Paris/O=ECOLE 42PARIS/OU=ECOLE 42PARIS/CN=localhost"
RUN echo "ssl_certificate /etc/nginx/ssl/certs/localhost.crt;" >> /etc/nginx/snippets/self-signed.conf
RUN echo "ssl_certificate_key /etc/nginx/ssl/private/localhost.key;" >> /etc/nginx/snippets/self-signed.conf

#NGINX CONFIGURATION
RUN cp ./tmp/nginx-conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
RUN rm /etc/nginx/sites-enabled/default

#TEST FOR THE INSTALLATION PHP
RUN echo "<?php phpinfo(); ?>" >> /var/www/html/phpinfo.php

#MYSQL
RUN bash ./tmp/mysql.sh

WORKDIR /var/www/html/

#INSTALL WORDPRESS
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN chown -R root:root wordpress
RUN cp /tmp/wp-config.php wordpress
RUN rm ./wordpress/wp-config-sample.php

#INSTALL PHPMYADMIN
RUN mkdir phpmyadmin
RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
RUN tar -xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
RUN cp /tmp/config.inc.php phpmyadmin
RUN rm ./phpmyadmin/config.sample.inc.php

RUN rm latest.tar.gz phpMyAdmin-latest-all-languages.tar.gz

EXPOSE 80 443

CMD bash /tmp/start.sh

#CMD tail -f /dev/null
