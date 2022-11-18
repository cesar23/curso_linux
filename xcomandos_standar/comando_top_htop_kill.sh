#--------------------------------------------------------------
#------------------ comando - TOP -----------------------------
#--------------------------------------------------------------
top
	# top - 11:36:06 up  1:03,  2 users,  load average: 0,38, 0,31, 0,32
	# Tareas: 249 total,   2 ejecutar,  247 hibernar,    0 detener,    0 zombie
	# %Cpu(s):  1,1 usuario,  0,4 sist,  0,0 adecuado, 98,4 inact,  0,0 en espera,  0,0 hardw int,  0,0 softw int,  0,0 robar tiempo
	# KiB Mem:  16348032 total,  4008256 used, 12339776 free,   275200 buffers
	# KiB Swap: 16690172 total,        0 used, 16690172 free.  1255640 cached Mem

	  # PID USUARIO   PR  NI    VIRT    RES    SHR S  %CPU %MEM     HORA+ ORDEN                                                     
	 # 4436 mario     20   0  982792 154512  91896 S   3,0  0,9   0:56.36 spotify                                                   
	 # 4807 mario     20   0  902092 240028  74752 S   2,3  1,5   0:21.27 chrome                                                    
	 # 3072 mario     20   0 1138196 282700 110108 S   2,0  1,7   2:14.22 chrome                                                    
	 # 1608 root      20   0  404816 138800  55904 S   1,3  0,8   2:39.46 Xorg                                                      
	 # 2649 mario     20   0 1978388 258592  93712 S   1,0  1,6   2:06.50 cinnamon                                                  
	 # 4017 mario     20   0 1027028 355312  80784 S   1,0  2,2   1:24.25 chrome                                                    
	 # 2404 mario      9 -11  512236  12708   9988 S   0,7  0,1   0:17.32 pulseaudio                                                
	 # 4879 mario     20   0  718964  52856  31332 S   0,7  0,3   0:02.09 chrome                                                    
	 # 2685 mario     20   0 2421212 119344  32568 S   0,3  0,7   0:16.68 dropbox                                                   
	 # 3206 mario     20   0  864884 168212  56048 S   0,3  1,0   0:43.57 chrome                                                    
	 # 4762 mario     20   0  622428  33680  23552 S   0,3  0,2   0:01.74 gnome-terminal                                            
	 # 4849 root      20   0       0      0      0 S   0,3  0,0   0:00.09 kworker/1:2                                               
		# 1 root      20   0   33888   4368   2600 S   0,0  0,0   0:01.27 init                                                      
		# 2 root      20   0       0      0      0 S   0,0  0,0   0:00.00 kthreadd                                                  
		# 3 root      20   0       0      0      0 S   0,0  0,0   0:00.01 ksoftirqd/0                                               
		# 5 root       0 -20       0      0      0 S   0,0  0,0   0:00.00 kworker/0:0H                                              
		# 7 root      20   0       0      0      0 R   0,0  0,0   0:01.99 rcu_sched
	
	
	
#----------------------------------------------------
# 1. Tiempo de actividad y carga media del sistema
#---------------------------------------------------

	# top - 11:36:06 up  1:03,  2 users,  load average: 0,38, 0,31, 0,32
	
#----- En la primera línea nos muestra:
	# Hora actual.
	# Tiempo que ha estado el sistema encendido.
	# Número de usuarios (mario y root).
	# Carga media en intervalos de 5, 10 y 15 minutos respectivamente.
	
	
#----------------------------------------------------	
# 2. Tareas
#----------------------------------------------------
	# Tasks: 249 total,   2 running,  247 sleeping	,    0 stopped,    0 zombie
	
	# La segunda línea muestra el total de tareas y procesos, los cuales pueden estar en diferentes estados.
		# Running (ejecutar): procesos ejecutándose actualmente o preparados para ejecutarse.
		# Sleeping (hibernar): procesos dormidos esperando que ocurra algo (depende del proceso) para ejecutarse.
		# Stopped (detener): ejecución de proceso detenida.
		# Zombie: el proceso no está siendo ejecutado. Estos procesos se quedan en este estado cuando el proceso que los ha iniciado muere (padre).
		
#----------------------------------------------------			
# 3. Estados de la CPU.
#----------------------------------------------------	
	# %Cpu(s):  0.1 us,  0.2 sy,  0.0 ni, 99.2 id,  0.0 wa,  0.0 hi,  0.2 si,  0.3 st
	
	# Esta línea nos muestra los porcentajes de uso del procesador diferenciado por el uso que se le de.
		# us (usuario): tiempo de CPU de usuario.
		# sy (sistema): tiempo de CPU del kernel.
		# id (inactivo): tiempo de CPU en procesos inactivos.
		# wa (en espera): tiempo de CPU en procesos en espera.
		# hi (interrupciones de hardware): interrupciones de hardware.
		# si (interrupciones de software): tiempo de CPU en interrupciones de software.
		
#----------------------------------------------------		
# 4. Memoria física
#----------------------------------------------------	
	# KiB Mem :  2029728 total,   934620 free,   325312 used,   769796 buff/cache
	
		# Memoria total.
		# Memoria libre.
		# Memoria utilizada.
		# Memoria utilizada por buffer.
		
#----------------------------------------------------		
# 5. Memoria virtual
#----------------------------------------------------
# KiB Swap: 16690172 total,  0 used, 16690172 free.  1255640 cached Mem

		# Memoria total.
		# Memoria usada.
		# Memoria libre.
		# Memoria en caché.
		
		
#----------------------------------------------------		
# 6. Columnas
#----------------------------------------------------
		
  # PID USER      PR  NI    VIRT    RES    SHR S  %CPU %MEM     TIME+ COMMAND
    # 9 root      20   0       0      0      0 S   0.3  0.0  54:09.42 rcu_sched
 # 3749 root      20   0  162252   6760   5092 S   0.3  0.1   0:00.34 sshd
 # 3794 root      20   0  113180   1576   1320 S   0.3  0.0   0:00.19 bash
 # 4118 root      20   0   62816  16808   2736 S   0.3  0.2   3:10.58 tailwatchd
 # 4248 root      20   0  160100   2228   1556 R   0.3  0.0   0:00.02 top
# 14217 root      20   0  587276  37856  29112 S   0.3  0.5   0:52.72 php-fpm
# 18905 mysql     20   0 1638776 179132   9116 S   0.3  2.2  50:59.11 mysqld
    # 1 root      20   0  191144   4108   2604 S   0.0  0.1   5:44.43 systemd
    # 2 root      20   0       0      0      0 S   0.0  0.0   0:00.23 kthreadd
    # 3 root      20   0       0      0      0 S   0.0  0.0   0:18.12 ksoftirqd/0
    # 5 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/0:0H
    # 7 root      rt   0       0      0      0 S   0.0  0.0   0:04.05 migration/0
    # 8 root      20   0       0      0      0 S   0.0  0.0   0:00.00 rcu_bh
   # 10 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 lru-add-drain
   # 11 root      rt   0       0      0      0 S   0.0  0.0   0:01.77 watchdog/0
   # 12 root      rt   0       0      0      0 S   0.0  0.0   0:01.45 watchdog/1
   # 13 root      rt   0       0      0      0 S   0.0  0.0   0:03.78 migration/1
   # 14 root      20   0       0      0      0 S   0.0  0.0   0:20.37 ksoftirqd/1
   # 16 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/1:0H
   # 17 root      rt   0       0      0      0 S   0.0  0.0   0:01.95 watchdog/2
   # 18 root      rt   0       0      0      0 S   0.0  0.0   0:02.82 migration/2
   # 19 root      20   0       0      0      0 S   0.0  0.0   0:14.93 ksoftirqd/2
   # 21 root       0 -20       0      0      0 S   0.0  0.0   0:00.00 kworker/2:0H
   # 22 root      rt   0       0      0      0 S   0.0  0.0   0:01.42 watchdog/3
   # 23 root      rt   0       0      0      0 S   0.0  0.0   0:06.48 migration/3
   
   
# PID: es el identificador de desarrollo. Cada desarrollo tiene un identificador exclusivo.
# USER (USUARIO): usuario dueño del desarrollo.
# PR: prioridad del desarrollo. Si pone RT es que se está corriendo en el mismo instante.
# NI: asigna la prioridad. Si tiene un valor bajo (hasta -20) significa que tiene más prioridad que otro con valor prominente (hasta 19).
# VIRT: proporción de memoria virtual usada por el desarrollo.
# RES: proporción de memoria RAM física que usa el desarrollo.
# SHR: memoria compartida.
# S (ESTADO): estado del desarrollo.
# %CPU: porcentaje de CPU central de procesamiento usado desde la más reciente renovación.
# %MEM: porcentaje de memoria física usada por el desarrollo desde la más reciente renovación.
# TIME+ (HORA+): tiempo total de CPU de procesamiento que ha utilizado el desarrollo desde su inicio.
# COMMAND: comando usado para comenzar el desarrollo.



top –d 5 #(Donde 5 es el número de segundos a transcurrir entre cada muestreo)

top –o %CPU #(Donde %CPU es el valor por el que vamos a ordenar los procesos )

top –u cesar #(Donde Toushiro es el usuario del cual queremos mostrar los procesos)


#--------------------------------------------------------------
#------------------ comando - KILL -----------------------------
#--------------------------------------------------------------

# Algunas de las opciones que tiene el comando kill son:

		# kill -l Muestra una lista de todas las señales.

		# Kill 0  Detiene todos los procesos excepto su shell de inicio de sesión.

		# kill -1 Colgar, se genera cuando nos desconectamos del terminal.

		# kill -2 Interrupción, se genera cuando se pulsa Ctrl+C

		# kill -3 Salir.

		# kill -9 Muerte segura, los hijos puede que queden huérfanos.

		# kill %1 mata el trabajo número 1 (ver jobs).

		# kill -9 $$ sale del shell actual sin guardar el historial de comandos.

		# kill -HUP PID Reinicia el proceso, es más confiable reiniciarlo ejecutando /etc/init.d/proceso restart






#matar processo
kill -9 [PID del proceso] #ejemplo kill -9 1205

kill –KILL [PID del proceso] #ejemplo kill -KILL 1205



– Función de cierre con nombre del proceso en vez de PID

#matar proceso de apache
kill –HUP [PID de Apache]
kill -1 [PID de Apache]
#matar processo por 
# Variante de kill, cierra todos los procesos de un programa

#matar por nombre dd procesoo
pkill -e apache
pkill -9 [Nombre del proceso]

#Por ejemplo, si deseas finalizar el servicio de Apache, el comando es:
killall -v apache2
killall -9 httpd

#-----------------------------------Obtener processo
pidof [nombre_proceso] #pidof apache2
pgrep [nombre_proceso] #pgrep apache2




		