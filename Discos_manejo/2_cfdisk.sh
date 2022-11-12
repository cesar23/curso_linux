#fuente: https://www.youtube.com/watch?v=A71YKqktdmo&list=PLKsrq85W8fy-UR6whBEhLGJGsQpwxJ5kK&index=5

# ver  discos y sus  particionse
fdisk -l

#------------------------------------
#::: . Listar las particiones
#------------------------------------
cd /dev && ls sd**


# usaremos el comando para crear las particiones

#-----------------------------------------
#::::::: 1.  preparamos el disco
#-----------------------------------------
# en este  caso vamos escoger el disco 2
# --- y  ahi dentro creamos la  particion
cfdisk /dev/sdb


#-----------------------------------------
#::::::: 2.  creamos la particion
#-----------------------------------------
#luego de crear la  particion crearemos el grupo de disco
pvcreate /dev/sdb1
   # demo: https://drive.google.com/file/d/1OOGgrrR2X3bW_LkStx-z4ezhpIyM3Adl/view?usp=drivesdk

#-----------------------------------------
#::::::: 3.  asignamos el grupo de volumen
#-----------------------------------------
vgcreate Disco_70GB /dev/sdb1
