#!/usr/bin/env sh
# This is a post-build script used by Travis to push the compiled project to GitHub

echo "Starting post build...\n"

if [ "$TRAVIS_PULL_REQUEST" = "false" ]; then
  echo "Starting to update gh-pages\n"

  # move the config file to where it should be
  mv wp-config.php wordpress/wp-config.php

  # clear out the junk we don't need
  rm composer.lock
  rm composer.phar
  rm composer.json
  rm post-build.sh
  rm -Rf vendor

  #copy data we're interested in to other place
  tar cf $HOME/google-appengine-wordpress.tar *
  tar cfz $HOME/google-appengine-wordpress.tgz *

  #go to home and setup git
  cd $HOME
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis"

  #using token clone gh-pages branch
  git clone --branch=gh-pages https://${GH_TOKEN}@github.com/ajessup/appengine-php-wordpress-starter-project.git gh-pages > /dev/null

  #go into diractory and copy data we're interested in to that directory
  cd gh-pages
  cp -Rf $HOME/google-appengine-wordpress.tar google-appengine-wordpress-$TRAVIS_BUILD_NUMBER.tar
  cp -Rf $HOME/google-appengine-wordpress.tgz google-appengine-wordpress-$TRAVIS_BUILD_NUMBER.tgz
  cp -Rf $HOME/google-appengine-wordpress.tar google-appengine-wordpress-latest.tar
  cp -Rf $HOME/google-appengine-wordpress.tgz google-appengine-wordpress-latest.tgz

  #add, commit and push files
  git add -A .
  git commit -m "Pushing build $TRAVIS_BUILD_NUMBER to gh-pages branch"
  git push origin gh-pages > /dev/null
fi

echo "Post-build completed\n"
