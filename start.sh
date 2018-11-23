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
# ln -s web public

# Make a config sync dir
mkdir config
mkdir config/sync

# Move the Content and Coffee Defaults
mv web/sites/default/cc_default.services.yml web/sites/default/services.yml
mv web/sites/default/cc_default_settings.php web/sites/default/settings.php
mv web/sites/default/cc_settings.local.php web/sites/default/settings.local.php
chmod 0644 web/sites/default/settings.php

# Get the starter theme
mkdir web/themes/custom
curl https://codeload.github.com/ContentCoffee/D8ProjectTheme/zip/master > file.zip
unzip file.zip
mv D8ProjectTheme-master web/themes/custom/project
rm file.zip

# Get the starter module
mkdir web/modules/custom
curl https://codeload.github.com/ContentCoffee/D8ProjectModule/zip/master > file.zip
unzip file.zip
mv D8ProjectModule-master web/modules/custom/project
rm file.zip

# Send out some help.
echo "Almost done, now you need to put your database details into:"
echo ""
echo "web/sites/default/settings.local.php"
echo ""

# Get rid of yourself.
rm start.sh
