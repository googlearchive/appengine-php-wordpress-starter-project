# WordPress on App Engine Starter Project

[![Build Status](https://travis-ci.org/ajessup/appengine-php-wordpress-starter-project.png)](https://travis-ci.org/ajessup/appengine-php-wordpress-starter-project)

This project provides a simple quickstart for setting up and optimizing Wordpress to run on Google App Engine. This includes:

* Wordpress 3.8
* The Google App Engine for Wordpress plugin
* The Batcache and Memcached pluigns for improved performance
* Boilderplate app.yaml and php.ini configuration files for App Engine

## Prerequisites

1. Install the [PHP SDK for Google App Engine](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP)
2. Install [MySQL](http://dev.mysql.com/downloads/)
3. [Sign up](http://cloud.google.com/console) for a Google Cloud Platform project, and
set up a Cloud SQL instance, as described [here](https://developers.google.com/cloud-sql/docs/instances), and a 
Cloud Storage bucket, as described [here](https://developers.google.com/storage/docs/signup). You'll want to name 
your Cloud SQL instance "wordpress" to match the config files provided here.
4. Visit your project in the
[Google Cloud Console](http://cloud.google.com/console), going to the App Engine section's **Application Settings**
area, and make a note of the **Service Account Name** for your application, which has an e-mail address 
(e.g. `<PROJECT_ID>@appspot.gserviceaccount.com`). Then, visit the Cloud Storage section of your project,
select the checkbox next to the bucket you created in step 3, click 
**Bucket Permissions**, and add your Service Account Name as a **User** account that has **Writer** permission.
5. (optional) Install [composer](https://getcomposer.org/download/)

## Getting Started

### (optional) Step 1: Run composer to bring in dependancies

**If you're not familiar with git, GitHub, or composer, and just want to skip this step - you can just [download Wordpress for Google App Engine](https://github.com/ajessup/appengine-php-wordpress-starter-project/raw/gh-pages/google-appengine-wordpress-latest.tgz)**

In the base directory of your clone of the respository, run

    $ composer install

This will install Wordpress and the necessary plugins

### Step 2: Edit the config files

Edit `wp-config.php` and `app.yaml`, replacing `YOUR_PROJECT_ID` to match the Project ID (not the name) you entered
in the Cloud Console when you signed up for a Google Cloud Platform project.

## Running WordPress locally

Using MySQL, run `databasesetup.sql` to set up your local database. For a default installation (no root password) 
this would be: 

    /usr/local/mysql/bin/mysql -u root < databasesetup.sql
    
But really, all it's doing is running this line -- the WordPress installation script will do the heavy lifting
when it comes to setting up your database. 

    CREATE DATABASE IF NOT EXISTS wordpress_db;

To run WordPress locally on Windows and OS X, you can use the 
[Launcher](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP) 
by going to **File > Add Existing Project** or you can the following from the command line: 

    $ dev_appserver.py .
    
Now, with App Engine running locally, visit `http://localhost:8080/wp-admin/install.php` in your browser and run 
the setup process, changing the port number from 8080 if you aren't using the default. 
You should be able to log in, and confirm that your app is ready to deploy. 

### Deploy!

If all looks good, you can upload your application using the Launcher or by using this command from within the :

    $ appcfg.py update 
    
Just like you had to do with the local database, you'll need to set up the Cloud SQL instance. The SDK includes
a tool for doing just that:

    google_sql.py <PROJECT_ID>:wordpress
    
This launches a browser window that authorizes the `google_sql.py` tool to connect to your Cloud SQL instance.
After clicking **Accept**, you can return to the command prompt, which has entered into the SQL command tool
and is now connected to your instance. Next to `sql>`, enter this command:

    CREATE DATABASE IF NOT EXISTS wordpress_db;    
    
You should see that it inserted 1 row of data creating the database. You can now type `exit` -- we're done here.

Now, just like you did when WordPress was running locally, you'll need to run the install script by visiting:

    http://<PROJECT_ID>.appspot.com/wp-admin/install.php

### Activating the plugins, configuring email, and hooking up WordPress to your Cloud Storage

**The following steps should be performed on your hosted copy of WordPress on App Engine**

#### Activating the plugins

Now, we just need to activate the plugins that were packaged with your app. Log into the WordPress 
administration section of your blog at `http://<PROJECT_ID>.appspot.com/wp-admin`, and visit the 
Plugins section. Click the links to activate **Batcache Manager** and **Google App Engine for WordPress**.

#### Configuring email and hooking WordPress up to your Cloud Storage

Now visit **Settings > App Engine**. Enable the App Engine mail service - this will use the App Engine Mail 
API to send notifications from WordPress. Optionally, enter a valid e-mail address that mail should be sent
from (if you leave this blank, the plugin will determine a default address to use). The address of the account 
you used to the create the Cloud Console project should work.

Stay on this page, because in order to be able to embed images and other multimedia in your WordPress content,
you need to enter the name of the Cloud Storage bucket you created when going through all the Prequisites earlier
under **Upload Settings**. 

Hit **Save Changes** to commit everything.