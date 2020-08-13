service nginx reload
service nginx start
service php7.3-fpm start
service mysql start

tail -f /var/log/nginx/access.log /var/log/nginx/error.log
