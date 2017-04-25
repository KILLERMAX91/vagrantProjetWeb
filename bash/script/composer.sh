#!/bin/bash

curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

eval cd /vagrant/web && composer update -vvv

eval cd