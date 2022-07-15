



fuente: http://www.estrellateyarde.org/logs-en-linux
fuente: https://likegeeks.com/es/servidor-syslog-de-linux/

#-----------------------------------------------------------------
# ------------------ Servidor Syslog De Linux Y Log Management
#-----------------------------------------------------------------



# Puedes verificar si este servicio se está ejecutando de la siguiente manera:

$ systemctl status rsyslog




# Journalctl se utiliza para consultar y visualizar los contenidos 
# de los datos de registro recopilados por el servicio systemd-journald.

$ journalctl



#-----------------------------------------------------------------
# ------------------ Configurando Rsyslog
# ------------------ El archivo de configuración del demonio Rsyslog es  /etc/rsyslog.conf.
#-----------------------------------------------------------------
vim /etc/rsyslog.conf
 # dentro de estan las configuraciones extras
vim  /etc/rsyslog.d/*.conf 

# OJO en   /etc/rsyslog.d/50-default.conf 

				# ║			*.*       -/var/log/all.log
				# ║			auth,authpriv.*                 /var/log/auth.log
				# ║			*.*;auth,authpriv.none          -/var/log/syslog
				# ║			#cron.*                         /var/log/cron.log
				# ║			#daemon.*                       -/var/log/daemon.log
				# ║			kern.*                          -/var/log/kern.log
				# ║			#lpr.*                          -/var/log/lpr.log
				# ║			mail.*                          -/var/log/mail.log
				# ║			#user.*                         -/var/log/user.log		
				# ╚═ 


#-----------------------------------------------------------------
# ------------------ Enviando menssages
#-----------------------------------------------------------------


logger "¡Hola mundo!"
		#leer mensajes	
		root@debian9:~# tail -n1 /var/log/syslog
		# Sep 11 12:46:54 debian9 root: ¡Hola mundo!



# a opción -t:
logger -t scriptcito "systemd apesta"
		#leer mensajes	
		root@debian9:~# tail -n1 /var/log/syslog
		# Sep 11 13:58:48 debian9 scriptcito: systemd apesta
		



#     |----------------------------------------------|    |---------------------------------------------------------------------|
#     |            TABLA RECURSOS			         |    |              CODIGOS DE SEVERIDAD                                   |
#     |----------------------------------------------|    |---------------------------------------------------------------------|
#     |N° | Keyword  | Descripción                   |    |Cód  Severidad	| Keyword | Descripción                             |
#     |----------------------------------------------|    |---------------------------------------------------------------------|
#     | 0 | kern     | Mensajes del kernel           |    |0    | Emergency	| emerg   | Emergencia: el sistema está inutilizable|
#     | 1 | user     | Mensajes del nivel de usuario |    |1    | Alert	    | alert	  | Alerta: se debe actuar inmediatamente   |
#     | 2 | mail	 | Sistema de correo             |    |2    | Critical	| crit	  | Crítico: condiciones críticas           |
#     | 3 | daemon	 | Demonios de sistema           |    |3    | Error	    | err	  | Error: condiciones de error             |
#     | 4 | auth	 | Seguridad/Autorización        |    |4    | Warning	| warning | Peligro: condiciones de peligro         |
#     | 5 | syslog	 | Mensage generados por syslogd |    |5    | Notice	| notice  | Aviso: normal, pero condiciones notables|
#     | 6 | lpr	     | Subsistema de impresión       |    |6    | Info	    | info    | Información: mensajes informativos      |
#     | 7 | news	 | Subsistema de noticias red    |    |7    | Debug	    | debug   | Depuración: mensajes de bajo nivel      |
#     | 8 | uucp     | Subsistema UUCP               |    ----------------------------------------------------------------------|
#     | 9 | clock    | Demonio de reloj              |   
#     | 10| authpriv | Seguridad/Autorización        |   
#     | 11| ftp	     | Demonio de FTP                |   
#     | 12| –	     | Subsistema de NTP             |   
#     | 13| –	     | Inspección del registro       |   
#     | 14| –	     | Alerta sobre el registro      |   
#     | 15| cron	 | Demonio de reloj              |   
#     | 16| local0	 | Uso local 0                   |   
#     | 17| local1	 | Uso local 1                   |   
#     | 18| local2	 | Uso local 2                   |   
#     | 19| local3	 | Uso local 3                   |   
#     | 20| local4	 | Uso local 4                   |   
#     | 21| local5	 | Uso local 5                   |   
#     | 22| local6	 | Uso local 6                   |   
#     | 23| local7	 | Uso local 7                   |   
#     | ---------------------------------------------|   

#-------------
#logger -p <recurso>.<severidad> "<mensaje>"


logger -p local0.info "Mensaje de información"  # esto llegara al log (/var/log/syslog)



#-----------------------------------------------------------------
# ------------------ Creando un log con Ruta  personalizada
#-----------------------------------------------------------------

vim /etc/rsyslog.conf
	#agregar en la ultima  linea
	local6.*   -/var/log/miapp.log #(IMPORTANTE solo  se puede  agregar hasta el local7 )


#crear el archivo y darle permisos 
	touch /var/log/miapp.log 
	chown syslog:adm /var/log/miapp.log #para el (usuarios syslog) (grupo adm) 
	chmod  640 /var/log/miapp.log #para que  el dueño= lea y escriba , grupo =lea , otro= no tengan permiso 

# reiniciar  servicio
systemctl status rsyslog

# generar reporte
logger -p local6.info "Mensaje de informaciónff"

# ver registro generado
tail -f /var/log/miapp.log


#-----------------------------------------------------------------
# ------------------ Principales log de Linux
#-----------------------------------------------------------------

#: Registro de mensajes relativos a la seguridad del sistema.
tail -1000f /var/log/syslog
# : Información de usuario.
tail -1000f /var/log/user.log
# : registro de los mensajes generales del sistema.
tail -1000f /var/log/message
# : Conexiones al sistema incluídos los intententos fallidos.
tail -1000f /var/log/auth.log  
# : registro del kernel, muy interesante para detectar problemas con el núcleo.
tail -1000f /var/log/kern.log  
# : registro de la herramienta de crond
tail -1000f /var/log/cron.log  
# : registro del servidor de emails.
tail -1000f /var/log/maillog   
# : registro de Qmail.
tail -1000f /var/log/qmail   
# apache
tail -f  /var/log/apache2/access.log | grep -v "geosupply.com.pe" #dodne no coincida geosupply.com.pe

# : registro de errores y acceso a Lighttpd.
tail -1000f /var/log/lightpd   
# : registro de inicio del sistema, si se producen problemas al inicio, es aquí donde tenemos que acudir.
tail -1000f /var/log/boot.log  
#------------------------------------------------------------------------------------
# : registro de errores y accesos del servidor web Apache
#------------------------------------------------------------------------------------
	#--Redhad
		tail -1000f /etc/httpd/logs/access_log  
		tail -1000f /etc/httpd/logs/error.log  | less -p ssh.php #buscar ssh.php
	#--Debian
 		tail -1000f /var/log/apache2/access.log
 		tail -1000f /var/log/apache2/error.log

#informacion detallada d e  estructura https://phoenixnap.com/kb/apache-access-log

190.187.49.250 - - [15/Nov/2019:17:22:48 -0500] "GET /gspmarino/index.php/gestionunidades/ultimatx HTTP/1.1" 200 8770 "https://www.geosupply.com.pe/gspmarino/index.php/ultimoreportegsp" "Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.97 Safari/537.36"

"%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-agent}i\""

# %h : la dirección IP del cliente (la fuente de la solicitud de acceso)
# %l : esta siguiente entrada puede ser simplemente un guión , lo que significa que no se recuperó información. Este es el resultado de verificar identd en el cliente.
# %u : ID de usuario del cliente, si la solicitud de acceso requiere autenticación http.
# %t - Marca de tiempo de la solicitud entrante
# \%r\ - Línea de solicitud que se utilizó. Esto le indica el método http (GET, POST, HEAD, etc.), la ruta a lo que se solicitó y el protocolo http que se está utilizando.
# %>s : código de estado que se devolvió del servidor al cliente ()
# %b : tamaño del recurso solicitado
# \”%{Referer}i\”  : le indica si el acceso se produjo al hacer clic en un enlace de otro sitio web u otras formas en que se remitió al cliente a su página.
# \”%{User-agent}i\” : le brinda información sobre la entidad que realiza la solicitud, como el navegador web, el sistema operativo, la fuente del sitio web (en el caso de un robot), etc.


#-----------------------------------------------------------------------------------		 
# : registro para la base de datos MySQL.
#-----------------------------------------------------------------------------------
/var/log/mysqld.log

# : log de autenticación, muy importante para la seguridad, ya que podrás ver lo referente a autenticación del sistema.
/var/log/secure  


 # : registro de logins
tail -1000f /var/log/utmp  
tail -1000f /var/log/wtmp  

cd /var/log
 
grep sshd/var/log/auth.log | less


