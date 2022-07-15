#!/bin/bash
#------ demo.sh
# while :
# do

  # DATE_HOUR="`date +%d`/`date +%m`/`date +%Y` - `date +%H`:`date +%M`:`date +%S`"
  # #echo "Press <CTRL+C> to exit." #ojo si hay un echo en el proceso segundo plano se vera
  # echo "Termino a las ${DATE_HOUR}">>demo.log
  # sleep 2
# done




#--------------------------------------------------------------
#------------------ jobs -----------------------
#--------------------------------------------------------------

jobs -> # + =>Mas reciente  
        # - =>Segundo Reciente
		
	# Muestra el listado de tareas que se estan ejecutando en background. 
	#Con la combinación CTRL+Z se detiene o para el proceso que se este ejecutando en la actualidad.
	#Con la combinación CTRL+C Elimina proceso que esta  en primer plano.
	
		# -l Visualiza el PID (identificador de proceso) de cada proceso
		# -r Visualiza los procesos que se encuentran en estado de ejecución (running)
		# -s Visualiza los procesos que están en estado suspendido (stopped)

fg %job -># (foreground) Pasa una tarea a Primer plano
bg %job -># (background) Pasa una tarea a Segundo plano
	
	
	
	#--------------------------------------------------------------------
	#--------------------- OJO IMPORTANTE  ------------------------------
	#------------- si usamos 
	#-- > sh demo.sh&
	#-- si hay un echo en el script se visualizara la salida del echo
	#-- lo recomendable es que no aya un echo y si lo hay  echo "xxx">> log.log
	#-- si aun se sigue bisualizando usar fg para ponerlo a primer plano
	#-- luego usar bg para ponerlo en segundo
	#----------------------------------------------------------------------
	
	#--------------------------------------------------------------------
	#--------------------- OJO IMPORTANTE  ------------------------------
	#------------- NO usar > ping 8.8.8.8& 
	#------------- USAR    > ping 8.8.8.8   luego   CTRL+Z
	#----------------------------------------------------------------------
	
	
	##---ejemplo listamos la  tabla	
	root@ubuntu:~# jobs
	[1]+  Stopped                 sh demo.sh
	[2]-  Running                 sleep 300 &
	
	
	root@ubuntu:~# fg %1 # pasando a primer plano ([1]+  Stopped                 sh demo.sh)
	# sh demo.sh
	# Press <CTRL+C> to exit.
	# Press <CTRL+C> to exit.
	# Press <CTRL+C> to exit.
	# Press <CTRL+C> to exit.
	# Press <CTRL+C> to exit.
	# Press <CTRL+C> to exit.
	
	
	
	# CTRL+Z se detiene el proceso que se este ejecutando en la actualidad.

	
	fg %1
	bg %1

