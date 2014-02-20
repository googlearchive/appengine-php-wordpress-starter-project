move wp-config.php wordpress\
move batcache\advanced-cache.php wordpress\wp-content\
move batcache\batcache.php wordpress\wp-content\plugins\
move wp-memcache\object-cache.php wordpress\wp-content\
xcopy /s/Y appengine-wordpress-plugin wordpress\wp-content\plugins\
rmdir /s/q batcache\
rmdir /s/q wp-memcache\
rmdir /s/q appengine-wordpress-plugin\
