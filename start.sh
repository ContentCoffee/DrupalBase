#!/bin/sh

curl -sS https://codeload.github.com/ContentCoffee/DrupalBase/zip/master > file.zip 
bsdtar -xf file.zip -s'|[^/]*/||'
rm -rf DrupalBase-master
rm file.zip
composer install
rm start.sh
ln -s web public
mkdir config
mkdir config/sync

