##-------------------------------------------------------------------
##--------------------------   DF    -------------------------------
##-------------------------------------------------------------------

df -h

        #   Filesystem      Size  Used Avail Use% Mounted on
        #   udev            2.0G     0  2.0G   0% /dev
        #   tmpfs           395M   36M  360M  10% /run
        #   /dev/xvda1       40G   18G   20G  47% /
        #   tmpfs           2.0G  4.0K  2.0G   1% /dev/shm
        #   tmpfs           5.0M     0  5.0M   0% /run/lock
        #   tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
        #   cgmfs           100K     0  100K   0% /run/cgmanager/fs
        #   tmpfs           395M     0  395M   0% /run/user/0


##--------------------------------------------------------------------------
##--------------------------  VER DISCOS (lsblk)    -------------------------------
##-------------------------------------------------------------------------

#mirar las  particiones
lsblk -fm

    # NAME    FSTYPE LABEL           UUID                                 MOUNTPOINT NAME    SIZE OWNER GROUP MODE
    # xvda                                                                           xvda     40G root  disk  brw-rw----
    # └─xvda1 ext4   cloudimg-rootfs 8ea401db-b84b-4cd6-a628-d72f30bbf1e5 /          └─xvda1  40G root  disk  brw-rw----





##---------------------------------------------------------------------------------------------
##--------------------------   PARTICIONES (FDISK [crea  particiones y las  elimina]])    -----
##--------------------------------------------------------------------------------------------
#fuente:https://openwebinars.net/blog/9-comandos-basicos-fdisk-para-gestionar-el-disco-duro/
#Para listar todas las particiones existentes en nuestro sistema pasaremos el argumento “-l”,
#que hará que se listen ordenadas por el nombre del dispositivo.

fdisk -l
     # Filesystem      Size  Used Avail Use% Mounted on
     # udev            2.0G     0  2.0G   0% /dev
     # tmpfs           395M   36M  360M  10% /run
     # /dev/xvda1       40G   18G   20G  47% /
     # tmpfs           2.0G  4.0K  2.0G   1% /dev/shm
     # tmpfs           5.0M     0  5.0M   0% /run/lock
     # tmpfs           2.0G     0  2.0G   0% /sys/fs/cgroup
     # cgmfs           100K     0  100K   0% /run/cgmanager/fs
     # tmpfs           395M     0  395M   0% /run/user/0



fdisk -l /dev/xvda1 #(ver una particion especifica)

    # Disk /dev/xvda1: 40 GiB, 42935961600 bytes, 83859300 sectors
    # Units: sectors of 1 * 512 = 512 bytes
    # Sector size (logical/physical): 512 bytes / 512 bytes
    # I/O size (minimum/optimal): 512 bytes / 512 bytes







##-------------------------------------------------------------------
##--------------------------   DU    -------------------------------
##-------------------------------------------------------------------
#peso de una  carpeta
du -bsh Videos/

#-------------------VER EL PESO DE LOS  DICRECTORIOS actuales
du -smh *

#//-------------------------ver peso de archivos
      #ver peso de la carpeta
      du -smh  /home/kpopilrp/inversionesluper.com/public_html/
      #ver peso de los archivos dentro
      du -smh * /home/kpopilrp/inversionesluper.com/public_html/*

#--------------------ver el peso de los 5 directorios mas  pesados
#--sort -nr (ordernar por numero y desc)
#--head -5 los  5  ultimos
du -smh * | sort -nr | head -5


#---------- listar solo los  directorios que  pesen en gigas
 du -smh *  | grep 'G'