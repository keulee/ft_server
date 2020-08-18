wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
chown -R www-data:www-data wordpress
chmod -R 755 wordpress
cp /tmp/wp-config.php wordpress
rm ./wordpress/wp-config-sample.php
