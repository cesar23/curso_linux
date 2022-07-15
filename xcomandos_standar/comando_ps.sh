#--------------------------------------------------------------
#------------------ comando - PS -----------------------
#--------------------------------------------------------------
# Muestra una instantánea de los procesos actuales.

# Algunas de sus opciones son:

		# -e visualiza información sobre "todos" los procesos del sistema.

		# -A idem a la opción -e

		# -j visualiza información sobre el PGID y SID.

		 # l visualiza "mucha" información sobre los procesos(difiere a poner el signo menos delante).

		# -f visualiza los parámetros con los que se levanto el proceso.

		# -a muestra también los procesos de otros usuarios.

		# -N niega el efecto de cualquier opción que se haya especificado.

		# -x muestra procesos que no están controlados por ninguna terminal.

		# -u pepe visualiza información de los procesos del usuario pepe.


# Ejemplos de uso:

ps -u root -N #visualiza todos los procesos que no sean del usuario root.

ps -aux #visualiza información detallada de todos los procesos.
 
ps axjf # (que mostrará un árbol jerárquico con la ruta del programa al que pertenece el proceso)


ps l
# F   UID   PID  PPID PRI  NI    VSZ   RSS WCHAN  STAT TTY        TIME COMMAND
# 4     0  2519  2517  20   0  60388 14836 -      Ss+  tty7       0:03 /usr/bin/Xorg :0 -br -verbose -novtswitch -a
# 4     0  2611     1  20   0   2284   832 -      Ss+  tty1       0:00 /sbin/getty 38400 tty1
# 4     0  2612     1  20   0   2284   836 -      Ss+  tty2       0:00 /sbin/getty 38400 tty2
# 4     0  2613     1  20   0   2284   836 -      Ss+  tty3       0:00 /sbin/getty 38400 tty3
# 4     0  2614     1  20   0   2284   848 -      Ss+  tty4       0:00 /sbin/getty 38400 tty4
# 4     0  2615     1  20   0   2284   832 -      Ss+  tty5       0:00 /sbin/getty 38400 tty5
# 4     0  2616     1  20   0   2284   836 -      Ss+  tty6       0:00 /sbin/getty 38400 tty6
# 4     0  3023  3018  20   0   7320  4448 -      Ss+  pts/0      0:00 -bash
# 4     0  3502  3497  20   0   7320  4448 -      Ss   pts/1      0:00 -bash
# 0     0  5171  3502  20   0   4068   856 -      R+   pts/1      0:00 ps l

# Los campos de la salida del comando ps l, se detallan a continuación:

F PROCESS FLAGS
   1 bifurcado pero no ejecutado.

   4 tiene privilegios de root.

UID ID de usuario.

PID ID del proceso padre

PPID ID del proceso padre.

PGID ID de grupo de un proceso.

PRI Prioridad del proceso.

NI valor de bondad, más elevado menor prioridad.

VSZ Tamaño de la memoria virtual del proceso en Kb.

RSS Tamaño de la memoria física usada en Kb.

WCHAN para los procesos que esperan o dormidos, enumera el evento que espera.

STAT Estado del proceso:

   R Ejecutable.

   D Interrumpió.

   S Suspendido.

   s Es el proceso líder de la sesión.

   T Detenido.

   Z Zombie.

   N Tiene una prioridad menor que lo normal.

   < Tiene una prioridad mayor que lo normal.

TTY nombre de la terminal a la que esta asociado al proceso.

TIME tiempo que lleva en ejecución.
#--------------------------------------------------------------------------------------------

# ejemplo de filtrado sobre ps para obtener únicamente los procesos pertenecientes a bash.
ps aux | grep bash





# ejemplo de filtrado sobre ps para obtener únicamente los procesos pertenecientes a bash.
ps aux 
		# PROCESS STATE CODES
			   # Aquí están los diferentes valores que los especificadores de salida s, stat y state (header "STAT" or "S") se mostrará para describir el estado de un proceso:
			   # D    uninterruptible sleep (usually IO)
			   # R    running or runnable (on run queue)
			   # S    interruptible sleep (waiting for an event to complete)
			   # T    stopped, either by a job control signal or because it is being traced.
			   # W    paging (not valid since the 2.6.xx kernel)
			   # X    dead (should never be seen)
			   # Z    defunct ("zombie") process, terminated but not reaped by its parent.

			   # For BSD formats and when the stat keyword is used, additional characters may be displayed:
			   # <    high-priority (not nice to other users)
			   # N    low-priority (nice to other users)
			   # L    has pages locked into memory (for real-time and custom IO)
			   # s    is a session leader
			   # l    is multi-threaded (using CLONE_THREAD, like NPTL pthreads do)
			   # +    is in the foreground process group.