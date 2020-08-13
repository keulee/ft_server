#Docker base OS
FROM debian:buster
MAINTAINER keungeun LEE <keulee@student.42.fr>

COPY srcs/nginx-conf ./nginx-conf
COPY srcs/start.sh ./

RUN apt-get update 
RUN apt-get install -y nginx
RUN apt-get install -y mariadb-server
RUN apt-get install -y php7.3-fpm php7.3-mysql
RUN apt-get install -y wget

RUN chown -R www-data:www-data /var/www/*
RUN chmod -R 755 /var/www/*

#RUN service nginx start
#RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf
RUN cp ./nginx-conf /etc/nginx/sites-available/localhost
RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
RUN rm /etc/nginx/sites-enabled/default

RUN echo "<?php phpinfo(); ?>" >> /var/www/html/phpinfo.php

EXPOSE 80

#RUN service nginx reload
#RUN service nginx start
#RUN service php7.3-fpm start

CMD bash start.sh
#RUN service mysql start

#CMD tail -f /dev/null

#WORKDIR /etc/nginx

#CMD ["nginx", "-g", "daemon off;"]
