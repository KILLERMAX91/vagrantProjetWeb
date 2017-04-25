#!/bin/bash

if [ ! -f /usr/local/bin/composer ]; then
    curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
fi

eval cd /vagrant/web && composer update -vvv

eval cd