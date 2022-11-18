#!/bin/bash
#------ date.sh
#!/bin/bash
while :
do

  DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
  echo "HORA ${DATE_HOUR}" #ojo si hay un echo en el proceso segundo plano se vera

  sleep 2
done

   #------------------------------------------#
   #                      _           _       #
   # 		 _ __   ___ | |__  _   _| |__     #
   # 		| '_ \ / _ \| '_ \| | | | '_ \    #
   # 		| | | | (_) | | | | |_| | |_) |   #
   # 		|_| |_|\___/|_| |_|\__,_|_.__/    #
   #------------------------------------------#


nohub -> # Ejecuta una aplicacion sin asociarla a la session
      # > nohup comando&
	  
	  #la  salida se guardara en el fichero nohup.out
	  
	
	
	#-------------------------------------------------------
	#---------- Ejemplo paso 1 (corremos la atrea) ---------
	#-------------------------------------------------------
	  
	root@ubuntu:~# nohup ./date.sh&  
	 [1] 31522
	 root@ubuntu:~# nohup: ignoring input and appending output to 'nohup.out'  #OJO se generara el archivo  log
	
	#recomendable
	#nohup ./date.sh>date.log &
	#Con la combinación CTRL+C proceguimos
	
	
	#-----------------------------------------------------
	#----------------- paso 2 ver tabla de tareas----------------
	#-----------------------------------------------------
	 root@ubuntu:~# jobs
	 [1]+  Running                 nohup ./date.sh &
	
	
	#-----------------------------------------------------
	#----------------- paso 3 ver el log que  genera -----
	#-----------------------------------------------------
	
	root@ubuntu:~# tail -f nohup.out
	# HORA 21/10/2019 - 17:51:09
	# HORA 21/10/2019 - 17:51:11
	# HORA 21/10/2019 - 17:51:13
	# HORA 21/10/2019 - 17:51:15
	# HORA 21/10/2019 - 17:51:17
	# HORA 21/10/2019 - 17:51:19
	# HORA 21/10/2019 - 17:51:21
	
	.
	# ahora  si  salimos o deslogeamos ese comando ya pertenecera  al sistema y lo podremos  ver corriendo el log

	root@ubuntu:~# tail -f nohup.out
	# HORA 21/10/2019 - 17:57:54
	# HORA 21/10/2019 - 17:57:56
	# HORA 21/10/2019 - 17:57:58
	
	
	
	#--------------matamos el procesoo
		#lo buscamos
	cesar@ubuntu:~$ ps axjf|grep "date"
	 36120  36572  36571  36120 pts/5     36571 S+    1000   0:00              \_ grep date
		 1  31522  31522   3998 ?            -1 S        0   0:00 /bin/bash ./date.sh
	
	# lo mtamos
	kill –9 31522
	
	
	
#-------------------------------------#	
#       _ _                            #
#    __| (_)___  _____      ___ __     #
#   / _` | / __|/ _ \ \ /\ / / '_ \    #
#  | (_| | \__ \ (_) \ V  V /| | | |   #
#  \__,_|_|___/\___/ \_/\_/ |_| |_|   #
#                                     #
#-------------------------------------#


disown -> # Desasocia trabajos de session
      # > nohup comando&
	  
	  #la  salida se guardara en el fichero nohup.out
	  
	  #sintaxis: disown [%n]
	  #ejemplo poner un jobs en sistema: diswon %1
	  


#corremos el preoceso  normal
root@ubuntu:~# ./date.sh>date2.log
#Con la combinación CTRL+Z  lo paramos
[1]+  Stopped                 ./date.sh > date2.log

#ahora  lo ponemso  en background 
root@ubuntu:~# bg %1
[1]+ ./date.sh > date2.log &

#miramos  si  esta  en ejecucion
root@ubuntu:~# tail -f date2.log
# HORA 22/10/2019 - 10:09:14
# HORA 22/10/2019 - 10:09:17
# HORA 22/10/2019 - 10:09:45
# HORA 22/10/2019 - 10:09:47
# HORA 22/10/2019 - 10:09:49

# miramos   la  tabla
root@ubuntu:~# jobs
# [1]-  Running                 ./date.sh > date2.log &
# [2]+  Running                 sleep 150 &

#ponemos una tarea en el sistema
root@ubuntu:~# disown %1
#ahora miramos  la  tabla que  ya  el proceso  esta  en el sistema
root@ubuntu:~# jobs
# [2]+  Running                 sleep 150 &


#verificamos si se esta  ejecutando la tarea
root@ubuntu:~# tail -f date2.log
# HORA 22/10/2019 - 10:19:04
# HORA 22/10/2019 - 10:19:06
# HORA 22/10/2019 - 10:19:08