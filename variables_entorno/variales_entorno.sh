#Ubicacion de los archivos que almacenan las variables persistentes
/etc/profile
/etc/environment #---si vamos a poner alguna variable global en linux ponerla aqui
    #ojo para ver esta variable desde cualquier usuario
    ls -lF /etc/environment
$HOME/.bash_login
$HOME/.bash_profile
$HOME/.profile


#---------------------------------------
#para ver todas las variables definidas
#--------------------------------------
>> printenv | more 
>> cat /etc/profile
>> cat /etc/environment
>> cat /etc/profile
>> printenv | more 



#para ver el contenido de una variable de emtorno
>> echo $PATH
#para agregar una ruta nueva al path de Linux
>> PATH=$PATH:$HOME/scripts

	 Ejemplo:
        # root@web:~/scripts# echo $PATH
        # /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games
        # root@web:~/scripts# PATH=$PATH:$HOME/scripts
        # root@web:~/scripts# echo $PATH
        # /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/root/scripts

#---------------------------------------------
# 1. creacion de variables por la shell active
#---------------------------------------------
SALUDO_1="olas" 
export SALUDO_2="olas" 
# 2. eliminar 
unset SALUDO


##--------si queremos que una variable sea persistente para todos los usuarios editar
/etc/profile


##------midifcando la zona horaia
echo date
export TZ="US/Pacific"
echo date
#regresandola por defecto a su valor
unset TZ


##---------------------------------------------------------------------------
##---------------------------------------------------------------------------
##-----------------------------UTLIZANDO DOLO CON LENGUAJES------------------
##---------------------------------------------------------------------------
##---------------------------------------------------------------------------
->php

#apache
#1. editar el archivo  /etc/apache2/envvars  y hacer que jale las variables
    export ENV_CESAR_EMAIL_USER=$ENV_CESAR_EMAIL_USER
    export ENV_CESAR_EMAIL_PASS=$ENV_CESAR_EMAIL_PASS

#2 /etc/apache2/sites-available/example.com.conf

    # ServerAdmin admin@geosupply.com.pe
	# ServerName gsptrack.geosupply.com.pe
	# ServerAlias gsptrack.geosupply.com.pe
	# #Redirect permanent / https://www.geosupply.com.pe/
	# DocumentRoot /var/www/geosupply.com.pe/public_html/gsptrackv1
	
	
	# #cesar--add------------------------------------------
	# SetEnv ENV_CESAR_EMAIL_USER ${ENV_CESAR_EMAIL_USER}
	# SetEnv ENV_CESAR_EMAIL_PASS ${ENV_CESAR_EMAIL_PASS}
	# SetEnv CI_ENV production

 	# <Directory /var/www/geosupply.com.pe/public_html/gsptrackv1>
    #             Options Indexes FollowSymLinks MultiViews
    #             AllowOverride All
    #             Order allow,deny
    #             allow from all
    #     </Directory>

# 3. luego de eso reinicar el servidor (/usr/sbin/apache2ctl)

    systemctl stop apache2.service
     apachectl stop && apachectl start && apachectl status
     apachectl restart

     Ó poner algp para que cada vez que se reicnicie el systema corra un scripts
     sudo nano /etc/rc.local

      sleep 100 #poner un sleep 100 antees qeu  inicie  systema
        systemctl stop apache2.service
        apachectl stop
        apachectl restart

        exit 0


$variable=`echo %VARIABLE%`
->node
process.env.PORT = process.env.PORT || 3000;
