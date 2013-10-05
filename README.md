# WordPress on App Engine Starter Project

Clone this git repo and its submodules by running the following commands:
   
    git clone https://github.com/GoogleCloudPlatform/appengine-php-wordpress-starter-project.git
    cd appengine-php-wordpress-starter-project/
    git submodule init
    git submodule update

Set up MySQL in your local development environment as necessary. 
Then, run `databasesetup.sql` to set up your local MySQL database, first changing the password inside that file.

Set up a Cloud SQL instance, as described [here](https://developers.google.com/cloud-sql/docs/instances).

Edit `wp-config.php` and `app.yaml` to reflect your settings.
You'll need to edit the password, and your Cloud SQL instance name if it is not `wordpress`. 
You'll also need to change `YOUR_PROJECT_ID` to match the project ID you entered in the Cloud Console.

Move `wp-config.php` into into `WordPress/`, replacing the file there.

After doing these steps, you can run WordPress locally.

To run WordPress locally on Windows and OS X, you can use the 
[Launcher](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP), 
or you can run from the command line. The default is to use the PHP binaries bundled with the SDK:

    $ APP_ENGINE_SDK_PATH/dev_appserver.py path_to_this_directory

On Linux, or to use your own PHP binaries, use:

    $ APP_ENGINE_SDK_PATH/dev_appserver.py --php_executable_path=PHP_CGI_EXECUTABLE_PATH path_to_this_directory

To deploy your application live, you'll first need to set up your Cloud SQL instance's 
database by [importing](https://developers.google.com/cloud-sql/docs/import_export)
`databasesetup.sql` from this repo. Then you can upload your application using the Launcher or this command:

    $ APP_ENGINE_SDK_PATH/appcfg.py update APPLICATION_DIRECTORY

See [Running Wordpress](https://developers.google.com/appengine/articles/wordpress) for information about installing and using the Google App Engine Wordpress plugin.
