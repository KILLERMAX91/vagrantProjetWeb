#!/usr/bin/env bash

sed -i 'Ns/opcache.enable=1/;opcache.enable=0/' /etc/php5/apache2/php.ini

sudo service apache2 restart