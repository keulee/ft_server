wget https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
chown -R root:root wordpress
cp /tmp/wp-config.php wordpress
rm ./wordpress/wp-config-sample.php
