# WordPress on Google App Engine
A starter project for running WordPress on Google App Engine

[![Build Status](https://travis-ci.org/GoogleCloudPlatform/appengine-php-wordpress-starter-project.png?branch=master)](https://travis-ci.org/GoogleCloudPlatform/appengine-php-wordpress-starter-project)

This project provides a simple quickstart for Wordpress on Google App Engine. This includes:

* [WordPress 3.8](http://wordpress.org/download/) from wordpress.org
* The [Google App Engine for Wordpress](http://wordpress.org/plugins/google-app-engine/) plugin
* The [Batcache](http://wordpress.org/plugins/batcache/) and [Memcache](http://wordpress.org/plugins/memcache/) plugins for improved performance
* Starter app.yaml and php.ini configuration files

**If you're not familiar with git, GitHub, or composer, and just want to skip this step - you can just [download Wordpress for Google App Engine](https://github.com/GoogleCloudPlatform/appengine-php-wordpress-starter-project/raw/gh-pages/google-appengine-wordpress-latest.zip)**

To learn more about running this package of WordPress on Google App Engine, visit our [Getting Started guide for Wordpress on App Engine](https://developers.google.com/appengine/articles/wordpress)

To build WordPress for App Engine from source, first install [Composer](http://getcomposer.org) and then from the base directory of this repository, run:

    $ composer install

