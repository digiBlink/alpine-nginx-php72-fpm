# digiblink/alpine-nginx-php-fpm Docker Container

Maintained by [digiBlink](http://digiblink.eu) - [docker hub link](https://hub.docker.com/r/digiblink/alpine-nginx-php72-fpm/)

Container with:

* Alpine Linux 3.8 (default time zone `Europe/Riga`)
* nginx 1.14.2-r0
* PHP-FPM 7.2.15 (all necessary extensions to be ready for Wordpress deployment)
* WP-CLI 2.1.0
* git

Based on following containers:

* [php](https://hub.docker.com/_/php/)
* [etopian/alpine-php-wordpress](https://github.com/etopian/alpine-php-wordpress)
* [boxedcode/alpine-nginx-php-fpm](https://hub.docker.com/r/boxedcode/alpine-nginx-php-fpm/)
* [celerative/nginx-php-fpm](https://hub.docker.com/r/celerative/nginx-php-fpm/)
* [celerative/wordpress](https://hub.docker.com/r/celerative/wordpress/)

## Usage

To get it running just enter:

`docker run -d --name your_container v /sites/yourdomain.com:/DATA -p 80:80 -t digiblink/alpine-nginx-php-fpm`

After that you can use BusyBox bash, to log into container and use [WP-CLI](http://wp-cli.org), to install [WordPress](https://wordpress.org):

`docker exec -ti your_container bash`

After logging in issue following commands:

```
su nginx
cd /DATA
wp-cli
```
