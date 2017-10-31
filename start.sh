#!/bin/sh

curl -sS https://codeload.github.com/ContentCoffee/DrupalBase/zip/master > file.zip 
unzip file.zip 
rm file.zip
composer install
rm start.sh

