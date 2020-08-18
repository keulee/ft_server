mkdir phpmyadmin
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz
tar -xvf phpMyAdmin-latest-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin
cp /tmp/config.inc.php phpmyadmin
rm ./phpmyadmin/config.sample.inc.php
rm latest.tar.gz phpMyAdmin-latest-all-languages.tar.gz
