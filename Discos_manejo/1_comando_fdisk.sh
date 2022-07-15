# fuente:  https://www.youtube.com/watch?v=r4EEYhfzGUk
# todo lo que tenemos en nuestro linux esta como fichero discos y otros
# ver todo lo  que tenemos en linux
cd /dev

#------------------------------------
#::: 1. Listar las particiones
#------------------------------------
#Para listar las tablas de particiones y las particiones en un dispositivo (por ejemplo /dev/sda), se puede ejecutar lo siguiente:

fdisk -l /dev/sda


#------------------------------------
#::: 2. Listar las particiones
#------------------------------------
cd /dev && ls sd**
