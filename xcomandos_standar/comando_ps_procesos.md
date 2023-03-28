# procesos de Linux ps

#### Opciones:

		# -e visualiza información sobre "todos" los procesos del sistema.

		# -A idem a la opción -e

		# -j visualiza información sobre el PGID y SID.

		 # l visualiza "mucha" información sobre los procesos(difiere a poner el signo menos delante).

		# -f visualiza los parámetros con los que se levanto el proceso.

		# -a muestra también los procesos de otros usuarios.

		# -N niega el efecto de cualquier opción que se haya especificado.

		# -x muestra procesos que no están controlados por ninguna terminal.

		# -u pepe visualiza información de los procesos del usuario pepe.


## Ejemplos de uso:

#### Visualiza los procesos del usuario actual
```shell
ps -u 
#output:
#	USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#	cesar       2031  0.0  0.1   8276  5232 pts/0    Ss   02:50   0:00 -bash
#	cesar       5919  0.0  0.1   8276  5140 pts/2    Ss+  04:03   0:00 -bash
#	cesar       6156  0.0  0.1   8276  5120 pts/1    Ss   04:04   0:00 -bash
#	cesar       6732  0.0  0.0   8888  3324 pts/1    R+   04:25   0:00 ps -u

```

#### Visualiza los procesos de todos los usuarios
```shell
ps -au 
#output:

#	USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#	root         874  0.0  0.0   5828  1932 tty1     Ss+  02:49   0:00 /sbin/agetty -o -p -- \u --noclear tty1 linux
#	cesar       2031  0.0  0.1   8276  5232 pts/0    Ss   02:50   0:00 -bash
#	root        2057  0.0  0.1   9444  4648 pts/0    S    02:50   0:00 sudo -i
#	root        2061  0.0  0.1   8260  5108 pts/0    S+   02:50   0:00 -bash
#	cesar       5919  0.0  0.1   8276  5140 pts/2    Ss+  04:03   0:00 -bash
#	cesar       6156  0.0  0.1   8276  5120 pts/1    Ss   04:04   0:00 -bash
#	cesar       6759  0.0  0.0   8888  3300 pts/1    R+   04:26   0:00 ps -au
```


#### Visualiza los procesos de todos los usuarios
```shell
ps aux
#output:

#	USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#	root           1  0.0  0.2 167532 11496 ?        Ss   02:49   0:03 /sbin/init maybe-ubiquity
#	root           2  0.0  0.0      0     0 ?        S    02:49   0:00 [kthreadd]
#	root           3  0.0  0.0      0     0 ?        I<   02:49   0:00 [rcu_gp]
#	root           4  0.0  0.0      0     0 ?        I<   02:49   0:00 [rcu_par_gp]
#	root           6  0.0  0.0      0     0 ?        I<   02:49   0:00 [kworker/0:0H-events_highpri]
#	root           8  0.0  0.0      0     0 ?        I<   02:49   0:00 [kworker/0:1H-events_highpri]
#	esar       5966  0.0  0.1  14060  6028 ?        S    04:03   0:00 sshd: cesar@notty
#	cesar       5967  0.0  0.1   5884  4316 ?        Ss   04:03   0:00 /usr/lib/openssh/sftp-server
#	root        6005  0.1  0.0      0     0 ?        I    04:04   0:01 [kworker/0:0-events]
#	root        6025  0.1  0.0      0     0 ?        I    04:04   0:03 [kworker/1:0-events]
#	root        6030  0.0  0.2  13928  9012 ?        Ss   04:04   0:00 sshd: cesar [priv]
#	root        6032  0.0  0.2  13928  8988 ?        Ss   04:04   0:00 sshd: cesar [priv]
#	cesar       6140  0.0  0.1  14060  6172 ?        R    04:04   0:00 sshd: cesar@pts/1
#	cesar       6156  0.0  0.1   8276  5120 pts/1    Ss   04:04   0:00 -bash
#	cesar       6203  0.0  0.1  14064  6068 ?        S    04:04   0:00 sshd: cesar@notty
#	cesar       6204  0.0  0.1   5884  4164 ?        Ss   04:04   0:00 /usr/lib/openssh/sftp-server
#	root        6517  0.0  0.0      0     0 ?        I    04:16   0:00 [kworker/u256:1-events_power_efficient]
#	root        6645  0.0  0.0      0     0 ?        I    04:21   0:00 [kworker/u256:0-events_power_efficient]
#	root        6813  0.0  0.0      0     0 ?        I    04:28   0:00 [kworker/u256:2-events_unbound]
#	cesar       6892  0.0  0.0   8888  3308 pts/1    R+   04:32   0:00 ps aux

```
Dónde:

- **USER**:  el usuario ejecuta el proceso
- **PID**:  la identificación del proceso
- **%CPU %MEM** : el porcentaje de CPU / RAM que están ocupados por los procesos
- **VSZ**: el tamaño de la memoria virtual que ocupan los procesos
- **RSS**: el tamaño de la memoria física que ocupan los procesos
- **STAT** – el estado del proceso en el que: S (durmiendo), R (corriendo), I (sueño interrumpible).
- **START** – hora de inicio
- **TIME**: muestra cuánto tiempo de CPU dio el kernel para ese proceso en ejecución.
- **COMMAND**: el comando que se ejecuta como un proceso actual

#### Visualiza Procesos detallados en forma jerarquico
```shell
ps axjf # (que mostrará un árbol jerárquico con la ruta del programa al que pertenece el proceso)

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
```

Columan: `F` PROCESS FLAGS

   - 1 bifurcado pero no ejecutado.
   - 4 tiene privilegios de root.

Columan: `UID` ID de usuario.

Columan: `PID` ID del proceso 

Columan: `PPID` ID del proceso padre.

Columan: `PGID` ID de grupo de un proceso.

Columan: `PRI` Prioridad del proceso.

Columan: `NI` valor de bondad, más elevado menor prioridad.

Columan: `VSZ` Tamaño de la memoria virtual del proceso en Kb.

Columan: `RSS` Tamaño de la memoria física usada en Kb.

Columan: `WCHAN` para los procesos que esperan o dormidos, enumera el evento que espera.

Columan: `STAT` Estado del proceso:

   - `R` Ejecutable.
   - `D` Interrumpió.
   - `S` Suspendido.

   s Es el proceso líder de la sesión.

   - `T` Detenido.
   - `Z` Zombie.
   - `N` Tiene una prioridad menor que lo normal.
   - `<` Tiene una prioridad mayor que lo normal.


## comando `top`

```shell
> top
#	getopts top - 04:53:47 up  2:04,  3 users,  load average: 0.02, 0.08, 0.07
#	Tasks: 238 total,   1 running, 237 sleeping,   0 stopped,   0 zombie
#	%Cpu(s):  0.2 us,  0.2 sy,  0.0 ni, 99.5 id,  0.0 wa,  0.0 hi,  0.2 si,  0.0 st
#	MiB Mem :   3901.1 total,   2312.1 free,    778.2 used,    810.8 buff/cache
#	MiB Swap:   3907.0 total,   3907.0 free,      0.0 used.   2882.4 avail Mem
#	
#	    PID USER      PR  NI    VIRT    RES    SHR S  %CPU  %MEM     TIME+ COMMAND
#	   1442 systemd+  20   0 1779992 391564  34240 S   1.7   9.8   1:29.49 mysqld
#	    490 root      19  -1   67840  18900  17756 S   0.3   0.5   0:02.41 systemd-journal
#	   6025 root      20   0       0      0      0 I   0.3   0.0   0:05.92 kworker/1:0-events
#	      1 root      20   0  167532  11496   8428 S   0.0   0.3   0:03.99 systemd
#	      2 root      20   0       0      0      0 S   0.0   0.0   0:00.01 kthreadd
#	      3 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_gp
#	      4 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 rcu_par_gp
#	      6 root       0 -20       0      0      0 I   0.0   0.0   0:00.00 kworker/0:0H-events_highpri
# .....
```
<img width="90%" src="https://i.imgur.com/t4w7XSM.png" alt="My cool logo"/>

### comandos utilies top
```shell
# Aquí, como vemos en su manual, podemos controlar más aspectos, como los de los siguientes ejemplos entre otros:

top -d 5 # (Donde 5 es el número de segundos a transcurrir entre cada muestreo)

# ordenar por CPU
top -o %CPU 

# ordenar por MEMORIA
top -o %MEM 

# Mostrar procesos por usuario
top -u root 

# solo los procesos de root ordenados por memoria
top -u root -o %MEM

```

## Comando: `htop`

```shell
htop
```

<img width="90%" src="https://i.imgur.com/vrgWtO6.png" alt="My cool logo"/>

-- --

```shell
# ordenar por tiempo de uso
TECLA : p
# mostrar en vista treeview
TECLA : f5

# Ordenar columnas
TECLA : f6
```

## para filtrar por usuario
```shell
TECLA : u
```
<img width="90%" src="https://i.imgur.com/04FJNQD.png" alt="My cool logo"/>

-- --

## Comando `kill`

matar processo
```shell
kill -9 [PID del proceso]
```

matar processo y reinicarlo perfecto para  servicios
```shell
kill -HUP [PID de Apache]
# kill -HUP 1431
```


matar proceso por Nombre de app
```shell
pkill -9 htop
pkill -9 firefox

pkill -9 nginx
```
