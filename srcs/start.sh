#SERVICES START WITH CHANGES
service nginx reload
service nginx restart
service php7.3-fpm start
service mysql restart

#STAY VERIFYING LOGS
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
