#!/bin/sh

[ -f /run-pre.sh ] && /run-pre.sh

if [ ! -d /DATA/htdocs ] ; then
  mkdir -p /DATA/htdocs
  chmod g+w /DATA/htdocs
fi

if [ ! -d /DATA/sessions ] ; then
  mkdir -p /DATA/sessions
  chmod g+w /DATA/sessions
fi

# start php-fpm
mkdir -p /DATA/logs/php-fpm
# start nginx
mkdir -p /DATA/logs/nginx
mkdir -p /tmp/nginx
chown nginx:nginx /tmp/nginx

if [ ! -d /DATA/bin ] ; then
  mkdir /DATA/bin
  cp /usr/bin/wp-cli /DATA/bin/wp-cli
else
  curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
  chmod +x wp-cli.phar
  mv wp-cli.phar /DATA/bin/wp-cli
fi

chown -R nginx:nginx /DATA

php-fpm
nginx
