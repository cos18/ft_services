#!/bin/sh

tar -xvf /custom-pma.tar.gz > /dev/null
rm -rf /custom-pma.tar.gz
mv /custom-pma /var/www/pma

php-fpm7 && nginx -g "daemon off;"
