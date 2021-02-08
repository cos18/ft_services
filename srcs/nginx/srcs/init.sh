#!/bin/sh

mkdir -p /var/www/root
cp /root/localhost.conf /etc/nginx/sites-available/localhost
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

mkdir ~/mkcert
cd ~/mkcert
wget https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64
mv mkcert-v1.4.1-linux-amd64 mkcert
chmod +x mkcert
./mkcert -install
./mkcert localhost
