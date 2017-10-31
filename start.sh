#!/bin/sh

# Get the repo
curl -sS https://codeload.github.com/ContentCoffee/DrupalBase/zip/master > file.zip

# Unzip it nicely
bsdtar -xf file.zip -s'|[^/]*/||'

# Clean up
rm -rf DrupalBase-master
rm file.zip

# Composer
composer install

# Make a link to public Apache/Nginx
ln -s web public

# Make a config sync dir
mkdir config
mkdir config/sync

# Remove the default files
rm web/sites/example.settings.local.php
rm web/sites/default/default.services.yml
rm web/sites/example.sites.php
rm web/sites/default/default.settings.php

# Move the Content and Coffee Defaults
mv web/sites/default/cc_default.services.yml web/sites/default/services.yml
mv web/sites/default/cc_default_settings.php web/sites/default/settings.php
mv web/sites/default/cc_settings.local.php web/sites/default/settings.local.php


# Send out some help.
echo "Almost done, now you need to put your database details into:"
echo ""
echo "web/sites/default/settings.local.php"
echo ""

# Get the starter theme
mkdir web/themes/custom
curl https://codeload.github.com/ContentCoffee/D8ProjectTheme/zip/master > file.zip
bsdtar -xf file.zip -s'|[^/]*/||'
mv D8ProjectTheme-master web/themes/custom/project
rm file.zip

# Get the starter module
mkdir web/modules/custom
curl https://codeload.github.com/ContentCoffee/D8ProjectModule/zip/master > file.zip
bsdtar -xf file.zip -s'|[^/]*/||'
mv D8ProjectModule-master web/modules/custom/project
rm file.zip

# Get rid of yourself.
rm start.sh