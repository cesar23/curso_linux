# modos mantenimeto htacces

### Modo mantenimento 
modo mantenimeitno `.htaccess`
```shell
RewriteEngine On
RewriteBase /
# :::: ips permitida
RewriteCond %{REMOTE_ADDR} !^132\.184\.131\.202
RewriteCond %{REMOTE_ADDR} !^127\.0\.0\.1$
# :::: end permitida
RewriteCond %{REQUEST_URI} !^/mantenimiento\.php$
RewriteRule ^(.*)$ /mantenimiento.php [R=307,L]
# RewriteRule ^(.*)$ http://domain.com/maintenance.html [R=307,L]
```
v2
```shell
RewriteEngine On
RewriteBase /

# Add all the IP addresses of people that are helping in development
# and need to be able to get past the maintenance mode.
# One might call this the 'allow people list'
RewriteCond %{REMOTE_HOST} !^132\.184\.131\.202
RewriteCond %{REMOTE_HOST} !^190\.213\.189\.555

# This is the 'ignore file list'. It allows access to all
# files that are needed to display the maintenance mode page.
# Example: pages, css files, js files, images, anything.
# IMPORTANT: If you don't do this properly, visitors will end up with
# endless redirect loops in their browser.
RewriteCond %{REQUEST_URI} !/mantenimiento\.php$
RewriteCond %{REQUEST_URI} !/assets\/img\/cariecom-logo\.png$
RewriteCond %{REQUEST_URI} !/assets\/js\/jquery\.countdown\.min\.js$

# Rewrite whatever request is coming in to the maintenance mode page
# The R=302 tells browsers (and search engines) that this
# redirect is only temporarily.
# L stops any other rules below this from executing whenever somebody is redirected.
RewriteRule \.*$ /mantenimiento.php [R=302,L]
```

### Modo mantenimento a redirect

```shell
# redirect all visitors to alternate site but retain full access for you
ErrorDocument 403 http://www.alternate-site.com
Order deny,allow
Deny from all
Allow from 99.88.77.66
```

### realizar test Local
```shell
$ cd ~/public_html 
$ php -S localhost:8000
```