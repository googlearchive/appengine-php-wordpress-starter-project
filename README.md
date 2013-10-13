# WordPress on App Engine Starter Project

This repo is designed to be as close as possible to  "clone and deploy" given that the Google App Engine
team doesn't have a license to distribute WordPress, MySQL, or the 3rd party WordPress plugins we use here.
However, through the use of submodules (which "include" other Git repos), we can at least get all the files on
your machine at once. We have also pre-configured some files so you can just drag-and-drop them into place,
and we've also automated the database setup process.

But first, you'll need a couple pieces of software and an active Google Cloud Project.

## Prerequisites

1. Install the [PHP SDK for Google App Engine](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP)
2. Install [MySQL](http://dev.mysql.com/downloads/)
3. [Sign up](http://cloud.google.com/console) for a Google Cloud Platform project, and
set up a Cloud SQL instance, as described [here](https://developers.google.com/cloud-sql/docs/instances). 

**Note: You'll want to name your Cloud SQL instance "wordpress" to match the config files provided here.
Also, installing the PHP SDK for App Engine will prompt you to install Python 2.7 if you don't have it already.**

## Cloning and setup

Clone this git repo and its submodules by running the following commands:
   
    git clone https://github.com/GoogleCloudPlatform/appengine-php-wordpress-starter-project.git
    cd appengine-php-wordpress-starter-project/
    git submodule init
    git submodule update

Edit `wp-config.php` and `app.yaml`, replacing `YOUR_PROJECT_ID` to match the Project ID (not the name) you entered
in the Cloud Console when you signed up for a Google Cloud Platform project.

When you're done, move `wp-config.php` into into `WordPress/`, replacing the file there.

You now need to run WordPress locally so you can install some important plugins. **The workflow for using
WordPress plugins with App Engine is to install them locally first, then re-deploy your app.**

## Running WordPress locally

Using MySQL, run `databasesetup.sql` to set up your local database, first changing the password inside that file.

To run WordPress locally on Windows and OS X, you can use the 
[Launcher](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP), 
or you can run from the command line. The default is to use the PHP binaries bundled with the SDK:

    $ APP_ENGINE_SDK_PATH/dev_appserver.py path_to_this_directory

On Linux, or to use your own PHP binaries, use:

    $ APP_ENGINE_SDK_PATH/dev_appserver.py --php_executable_path=PHP_CGI_EXECUTABLE_PATH path_to_this_directory
    
### Installing Google App Engine for WordPress Plugin

The Google App Engine for WordPress plugin extends WordPress to take advantage of several App Engine services,
including using the Mail API to send e-mail notifications, and Google Cloud Storage to store and serve uploaded
media such as images. There are several different ways to install plugins - in this step we're going to show just one.

**The following steps should be performed on your local development copy of WordPress**

*   In the Admin section of the WordPress installation in your local development environment, visit **Plugins > Add New > Search**
*   Search for the plugin called **Google App Engine for Wordpress**. Once you've found it, choose **Install Now**.

#### Installing the Memcached Object Cache Plugin

This will speed up your WordPress installation by storing frequently accessed data in Memcache.
This plugin automatically takes advantage of Google App Engine's Memcache service.

**The following steps should be performed on your local development copy of WordPress**

*   In the Admin section of the WordPress installation in your local development environment, visit **Plugins > Add New > Search**
*   Search for the plugin called Memcached Object Cache. Once you've found it, choose **Install Now**

In your local copy of this repo, find the file 
`APPLICATION_DIRECTORY/wordpress/wp-content/plugins/memcached/object-cache.php` and copy it to `APPLICATION_DIRECTORY/wordpress/wp-content/object-cache.php`

#### Installing the Batcache Plugin

**The following steps should be performed on your local development copy of WordPress**

*   Follow the Batcache [installation instructions](http://wordpress.org/plugins/batcache/installation) to install it on your local blog.
    
## Deploying WordPress

To deploy your application live, you'll first need to set up your Cloud SQL instance's 
database by [importing](https://developers.google.com/cloud-sql/docs/import_export)
`databasesetup.sql` from this repo. 

### Creating your Cloud Storage Bucket

You will then need to create a Cloud Storage bucket that will be used by your WordPress blog to efficiently 
store and serve the files that you upload to WordPress.

To set this up, visit your project in the [Google Cloud Console](http://cloud.google.com/console). 
Visit the **App Engine** section, which should take you to the App Engine dashboard for your App Engine app. 
Visit the **Application Settings** section and make a note of the **Service Account Name**, which looks like an 
e-mail address, e.g. `hello-php-gae@appspot.gserviceaccount.com`.

Next, visit the **Cloud Storage** section of your Cloud Console project, and choose **New Bucket**. 
Give the bucket a unique name. Then, check the box next to the  bucket name so that **Bucket Permissions**
appears. Enther the **Service Account Name** that you noted above, and give it **Read/Write** permission.

### Deploy!

Then you can upload your application using the Launcher or by using this command:

    $ APP_ENGINE_SDK_PATH/appcfg.py update APPLICATION_DIRECTORY

### Enable the WordPress plugin for Google App Engine

**The following steps should be performed on your hosted copy of WordPress on App Engine**

Now, we just need to activate the Google App Engine for WordPress plugin and configure it. Log into the WordPress 
administration section of your blog, and visit the Plugins section. Activate the **Google App Engine for Wordpress** 
plugin.

Now visit **Settings > App Engine**. Enable the App Engine mail service - this will use the App Engine Mail 
API to send notifications from WordPress. Optionally, enter a valid e-mail address that mail should be sent f
rom (if you leave this blank, the plugin will determine a default address to use). The address of the account 
you used to the create the Cloud Console project should work. Under Upload Settings, put in the name of the 
bucket you created above. Hit **Save Changes** to commit everything.

## That's all! (PHEW)

Congratulations! You should now have a blog that loads rapidly, can send mail, and can support 
adding images and other media to blog posts! Most importantly, it will take advantage of Google's incredibly
powerful infrastructure and always scale gracefully to accomodate traffic that is hitting your blog.
