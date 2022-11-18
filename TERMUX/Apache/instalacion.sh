#fuente:https://gist.github.com/vilkoz/73588f8a7b9122a93c369502d61fd922

pkg update
pkg upgrade

#instalacmos  paquetes  necesarios
pkg install autoconf automake bison bzip2 clang cmake coreutils diffutils flex gawk git grep gzip libtool make patch perl sed silversearcher-ag tar
#creamos enlace  simbolico
ln -s /data/data/com.termux/files/usr/etc/ ~/etc

pkg install apache2


#----------isntalar php opcional

pkg add-apt-repository ppa:ondrej/php

pkg install php php-apache


LoadModule mpm_worker_module libexec/apache2/mod_mpm_worker.so

LoadModule mpm_prefork_module libexec/apache2/mod_mpm_prefork.so


LoadModule php7_module libexec/apache2/libphp7.so
AddHandler php7-script .php


LoadModule php7_module libexec/apache2/libphp7.so
AddHandler php7-script .php


Include etc/apache2/extra/php7_module.conf


echo "<?php phpinfo();?>" > ~/../usr/share/apache2/default-site/htdocs/index.php


killall httpd; httpd
