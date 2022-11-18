fuentes: 
- https://linuxsysymas.wordpress.com/2015/03/04/cerrar-sesiones-linux/
- https://www.youtube.com/watch?v=WM6uq8rdFxo



## Comando `who` 
muestra cuantos usuarios estan (logeados o conectados) a nuestro linux
```shell
who
# output: 
#  cesar    pts/0        2022-10-22 21:15 (192.168.0.3)
#  cesar    pts/1        2022-10-22 21:17 (192.168.0.3)

who -u
# output:
# cesar    pts/0        2022-10-22 21:15   .          1773 (192.168.0.3)
# cesar    pts/1        2022-10-22 21:17 00:02        2117 (192.168.0.3)
```
<img width="100%" src="https://i.imgur.com/uJl91JM.png" alt="My cool logo"/>


-- --

## Comando `tty`
Sirve para ver en que terminal estas trabajando

```shell
tty
# output:
# cesar@serv-docker:~$ tty
# /dev/pts/1


```
<img width="90%" src="https://i.imgur.com/IF1VkHS.png" alt="My cool logo"/>


-- --


## Ver Processos de los usuarios
```shell
ps -u  #visualiza los procesos de los usuarios
#output:
#   USER         PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
#   cesar       2031  0.0  0.1   8276  5232 pts/0    Ss   02:50   0:00 -bash
#   cesar       5919  0.0  0.1   8276  5140 pts/2    Ss+  04:03   0:00 -bash
#   cesar       6156  0.0  0.1   8276  5120 pts/1    Ss   04:04   0:00 -bash
#   cesar       6405  0.0  0.0   8888  3256 pts/1    R+   04:11   0:00 ps -u
```



-- --

lo vemos qu se  guarda como archivo

<img width="90%" src="https://i.imgur.com/OGnkVBI.png" alt="My cool logo"/>

-- --



Buscar usuarios conectados
```shell
 who -u|sort -rnk 5,5 |grep -v root|grep -v usuario1|grep -v usuario3
```
