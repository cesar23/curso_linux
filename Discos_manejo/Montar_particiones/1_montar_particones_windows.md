# Montar particiones de windows a linux
fuente: https://www.youtube.com/watch?v=UNAJInots60

## Tabla de contenido
<a href="#" id="indice">Indice 👌</a>
- <a href="#1-listar-disco">1. Listar discos 📀</a>
- <a href="#2-montar-unidad">2. Montar unidad Temporal 📦</a>
- <a href="#3-montar-unidad">3.  Montar unidad Permanente 📦</a>




## paquetes necesarios par montar:

pueda que  necesite si la  distro no tiene incluida esta paquete para ntfs

```shell
sudo apt-get install ntfs-3g
```


[//]: # (#############################################################################)
[//]: # (############# 1. Listar discos )

<h1  id="1-listar-disco">1. Listar discos 📀</h1>
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>

-listar particiones

 ```shell
   fdisk -l
  ```
![](https://i.imgur.com/TH5BDfm.png) 


- Obtenemos la informacion UID de la particion

```shell
#  ejemplo: /dev/sdb3
sudo blkid /dev/sdb3

# /dev/sdb3: UUID="A8A40859A4082C7E" TYPE="ntfs" PARTLABEL="Basic data partition" PARTUUID="a2574bd8-e47c-4858-880a-ae4e18274b28"

  # ojo tambine puede usar:  sudo blkid para  ver  de todos las particones
```
-  🧧 IMPORANTE crear Carpeta

```shell
sudo mkdir /media/disco_windows
```


![](https://i.imgur.com/LkznptR.png) 

[//]: # (#############################################################################)
[//]: # (############# 2. Montar Unidad Temporal)
<h1  id="2-montar-unidad">2. Montar Unidad Temporal /Desmontar</h1>
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>

montar unidad simple 
```shell
# --- para ntfs
# ----: permitir escritura
sudo ntfsfix /dev/sdb3
sudo mount -t ntfs /dev/sdb3   /media/disco_windows
# --- paar linux
sudo mount /dev/sdb3 /mnt/disco_win
```

Desmontar unidad simple
```shell
# --- defecto
umount DIRECTORY
# ::desmonta cuando ya no este ocupado (recomendado)
umount -l DIRECTORY
# :: forzado
umount -f DIRECTORY
```



[//]: # (#############################################################################)
[//]: # (############# 3. Montar Unidad Permanente)
<h1  id="3-montar-unidad">3. Montar Unidad Permanente</h1>
<a href="#indice" class="btn btn-sm btn-default"> 👆👆 ( Indice )</a>




- 3.2. EDITAR EL ARCHIVO FSTAB

```shell
# ----: permitir escritura (opcional)
#  sudo ntfsfix /dev/sdb3

sudo nano /etc/fstab
```

ahora  ingresarmos al final


```shell

UUID=A8A40859A4082C7E /media/disco_windows    ntfs-3g default_permissions,uid=1000 0 0            0       0
```


## 😸 Para  otras  unidades

#### 💾 para NTFS 
```shell
UUID=XXXXXXXXXXXXX /media/carpeta de montaje ntfs-3g default_permissions,uid=1000 0 0
# :: para usarlo con samba
UUID=XXXXXXXXXXXXX /media/common/multimedia1 ntfs-3g defaults,nls=utf8,_netdev,umask=000,user,owner 0 0
```


#### 💾 para FAT
```shell
UUID=XXXXXXXXXXXX  /media/carpeta de montaje   vfat rw,uid=1000,gid=1000 0 0
```


#### 💾 para ext4
```shell
UUID=XXXXXXXXXXXX  /media/carpeta de montaje ext4 errors=remount-ro 0 1
```

#### 💾 para ext3
```shell
UUID=XXXXXXXXXXXX  /media/carpeta de montaje ext3    defaults        0       2
```
