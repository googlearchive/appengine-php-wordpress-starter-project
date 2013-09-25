
# WordPress on App Engine Starter Project

For more detailed instructions, see [Running Wordpress](https://developers.google.com/appengine/articles/wordpress).

1. Download WordPress: http://wordpress.org/download/

2. Unpack WordPress to a subdirectory here called "wordpress/"

4. Set up MySQL in your local development environment as necessary.  See [xxx] for more information.
Then, run databasesetup.sql locally to set up your local MySQL database, first changing the password inside that file.

5. Set up a Cloud SQL instance, as described [here](https://developers.google.com/appengine/articles/wordpress#cloudsql).

6. Move wp-config.php from this directory into "wordpress/".  Edit it to reflect your database settings.  You'll need to edit the password, and your Cloud SQL instance name if it is not 'wordpress'.
Then, in app.yaml and wp-config.php, change YOUR_PROJECT_ID to match the project ID you entered in the Cloud Console.

After doing these steps, you can run WordPress locally using dev_appserver, or deploy the application.

To run WordPress locally:

On Windows and OS X, you can use the [SDK](https://developers.google.com/appengine/downloads#Google_App_Engine_SDK_for_PHP) Launcher.
Or, you can run from the command line.  On Windows and OS X, the default is to use the PHP binary bundled with the SDK:

$ APP_ENGINE_SDK_PATH/dev_appserver.py path_to_this_directory

On Linux, or to use your own php build, use:
$ APP_ENGINE_SDK_PATH/dev_appserver.py --php_executable_path=PHP_CGI_EXECUTABLE_PATH path_to_this_directory

To deploy:

Set up your Cloud SQL instance's database by "Importing" databasesetup.sql, then upload your application:
$ APP_ENGINE_SDK_PATH/appcfg.py update APPLICATION_DIRECTORY

See [Running Wordpress](https://developers.google.com/appengine/articles/wordpress) for information about installing and using the Google App Engine Wordpress plugin.
