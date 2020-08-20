#AUTORISATION CHANGE
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#SERVICES START WITH CHANGES
service nginx start
service php7.3-fpm start
service mysql restart

#STAY VERIFYING LOGS
tail -f /var/log/nginx/access.log /var/log/nginx/error.log
