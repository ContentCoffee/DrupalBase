# A Drupal Project

This is the default readme file that come from the Content and Coffee drupal base repo.

Ideally this should have been replaced or updated.

## What to do with this?

### First:

Create a repository in the bitbucket for the project.

### Second:

Clone the empty repo in local development directory.

### Third:

Go into that directory and run the start script.

```
cd Sites/blahblah
curl https://raw.githubusercontent.com/ContentCoffee/DrupalBase/master/start.sh | sh
```

This will download the repo, unzip it to your current directory, then run composer install. You will also have the start project module start project theme.

Lastly you will have a settings.php and settings.local.php.
```
web/sites/default/settings.php
web/sites/default/settings.local.php
```

Update the local with the information of your local database.

Then install Drupal.

```
cd web
drush si
```

At this point you now have a vanilla drupal. The drupal public will be the ^web/^ folder. Don't be a moron and make a virtualhost point to the main repo dir. 

Have Fun!
