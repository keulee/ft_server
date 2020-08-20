#AUTORIATION CHANGE
chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

#SSL
mkdir /etc/nginx/ssl/ && mkdir /etc/nginx/ssl/certs/ /etc/nginx/ssl/private/
chmod -R 700 /etc/nginx/ssl/
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/ssl/private/localhost.key -out /etc/nginx/ssl/certs/localhost.crt -subj "/C=FR/ST=Paris/L=Paris/O=ECOLE 42PARIS/OU=ECOLE 42PARIS/CN=keulee"
echo "ssl_certificate /etc/nginx/ssl/certs/localhost.crt;" >> /etc/nginx/snippets/self-signed.conf
echo "ssl_certificate_key /etc/nginx/ssl/private/localhost.key;" >> /etc/nginx/snippets/self-signed.conf

#NGINX CONFIGURATION
cp ./tmp/nginx-conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/localhost
rm /etc/nginx/sites-enabled/default
