[//]: # (aumentar espacion en disco lvm)
fuente:
https://www.youtube.com/watch?v=RS2DUwphQts

### 1.Comprobar que el disco está accesible
Para asegurarnos de que el disco está disponible, podemos comenzar por abrir la página de administración de Proxmox VE desde el ordenador cliente que usemos habitualmente para hacerlo.

Una vez autenticados, seleccionamos en el panel izquierdo el nombre del servidor y, en el del centro, la categoría Disks.

![](https://i.imgur.com/rqbcdcB.png)



Una vez abierta la ventana de terminal, también podríamos usar el comando `lsblk` para identificar la estructura de discos del servidor:
```shell
lsblk
```
![](https://i.imgur.com/qdzlPfV.png)




### 2.Crear una partición en el disco
El siguiente paso consistirá en crear una partición para el disco nuevo. Podríamos hacer un particionado más complejo pero, para simplificar las cosas, crearemos una partición única que ocupará todo el espacio disponible.

Para lograrlo, usaremos el comando fdisk con privilegios de administración:

```shell
fdisk /dev/sdg
```
![](https://i.imgur.com/hK7P6fa.png)


Miramos los  cambios que  tenemos hasta  el momento con la opcion : `p`
![](https://i.imgur.com/YFYmLlW.png)


finalmente guardamos los cambios

![](https://i.imgur.com/z7H7JIi.png)


### 3. Añadir el espacio al volumen lógico
Una vez preparado el disco, lo inicializamos para incorporarlo al volumen LVM (bueno, en realidad, es un grupo de volúmenes que en este momento tiene un solo volumen). Este trabajo lo lleva a cabo el comando pvcreate, por lo que escribiremos algo como esto:

```shell
root@pve:~# pvcreate /dev/sdg1
  Physical volume "/dev/sdg1" successfully created.
root@pve:~#
```


### 4. mostrar el grupo de volumennes
```shell
vgdisplay
```
ahi seleccionamos el volumen que  queremos extender
![](https://i.imgur.com/HNkR7WO.png)


### 5. Ahora entender el volumen
- `pve`        => el grupo que  queremos extender
- `/dev/sdg1`  => cual particion usaremos para entender

```shell
root@pve:~# vgextend pve /dev/sdg1
  Volume group "pve" successfully extended
root@pve:~#
```



### 6. mostramos los  grupos de volúmenes  logicos
```shell
lvdisplay
```

![](https://i.imgur.com/RtpR9BX.png)



### 7. ahor a extendemos

```shell
root@pve:~# lvextend -l+100%FREE /dev/pve/root
#  Size of logical volume pve/root changed from 14.75 GiB (3776 extents) to 122.12 GiB (31263 extents).
#  Logical volume pve/root successfully resized.
```
![](https://i.imgur.com/n7GDFmr.png)



### 8. ahora redimensioanmos

```shell
resize2fs  /dev/pve/root
#resize2fs 1.46.2 (28-Feb-2021)
#Filesystem at /dev/pve/root is mounted on /; on-line resizing required
#old_desc_blocks = 2, new_desc_blocks = 16
#The filesystem on /dev/pve/root is now 32013312 (4k) blocks long.
```
Resultado Ahora
![](https://i.imgur.com/gCtJ9aS.png) 









