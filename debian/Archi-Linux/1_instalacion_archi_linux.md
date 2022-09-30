# configuracion y instalacion de archi linux
fuente de instalacion

- https://wiki.archlinux.org/title/Installation_guide_(Espa%C3%B1ol)

### 1. configurra el teclado a ingles o espa;ol
```shell
# paa ponerlo al espanol
loadkeys es
loadkeys en
```
### 2. Particionar Disco
Verificar la modalidad de arranque
Para comprobar el modo de arranque, liste el directorio efivars:

```shell
# Si no da ERROR es modo: MODO UEFI
ls /sys/firmware/efi/efivars
```
<img width="100%" src="https://i.imgur.com/8uA7fsp.png" alt="My cool logo"/>


```shell
# si da Error es modo: BIOS o DOS
ls /sys/firmware/efi/efivars
```
<img width="100%" src="https://i.imgur.com/N9KkbEZ.png" alt="My cool logo"/>

### Como usamos Virtualbox o Vmware es DOS o BIOS

### 3. particionaremos el disco

`fdisk -l`miramos el tama;o del disco

<img width="100%" src="https://i.imgur.com/4Ty2mC5.png" alt="My cool logo"/>

ahora formatearemos el disco `/dev/sda`

```shell
cfdisk /dev/sda
```
con el comando `cfdisk` y elegimos `dos`

<img width="80%" src="https://i.imgur.com/MTXcjsq.png" alt="My cool logo"/>

ventana de creacion de particiones

<img width="80%" src="https://i.imgur.com/ar2ybRV.png" alt="My cool logo"/>


Creareos 4 particiones 2 primarias y una el swap

- boot       => [512M]
- swap       => [5G] 
- raiz (/)   => [] todo el resto

### 4.1 creando particion `BOOT`
le asignaremos solo `512M`

<img width="80%" src="https://i.imgur.com/IfIPiTP.png" alt="My cool logo"/>

-- --

<img width="80%" src="https://i.imgur.com/JdHLC9Y.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/LIwLcEd.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/7Xe2QAq.png" alt="My cool logo"/>

### 4.2 creando particion `SWAP`

<img width="80%" src="https://i.imgur.com/YcC0zlm.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/lfZFWak.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/CTmMK8n.png" alt="My cool logo"/>

-- - 

<img width="80%" src="https://i.imgur.com/SrjNTvl.png" alt="My cool logo"/>

<img width="80%" src="https://i.imgur.com/t5Lya96.png" alt="My cool logo"/>

### 4.3 creando particion raiz `/`

<img width="80%" src="https://i.imgur.com/phKZgKg.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/ns8CVAO.png" alt="My cool logo"/>

-- -

<img width="80%" src="https://i.imgur.com/9YXvoJ4.png" alt="My cool logo"/>

### 5.1 Formateando discos

miramos las particiones

<img width="80%" src="https://i.imgur.com/O3r7ux1.png" alt="My cool logo"/>

```shell
# ejecutar estos comandos
 mkfs.vfat -F 32  /dev/sda1 # particion boot
 mkswap           /dev/sda2 # particion swap
 mkfs.ext4        /dev/sda3 # particion raiz
 
 # activamos el swpap
 swapon
```

<img width="80%" src="https://i.imgur.com/o1OPoL1.png" alt="My cool logo"/>


### 5.2 Montando discos

```shell
# montamos la particion raiz
mount /dev/sda3 /mnt

# ahora creamos el directorio en boot
mkdir /mnt/boot
# ahora montamos
mount /dev/sda1 /mnt/boot

# ya montados instalamos
pacstrap /mnt base linux linux-firmware grub networkmanager dhcpcd nano
```
<img width="50%" src="https://i.imgur.com/FveU3LS.png" alt="My cool logo"/>

### 5.3 guararemos la  particiones
```shell
genfstab -U /mnt > /mnt/etc/fstab

# listar y mostrar repositorios
cat /mnt/etc/fstab
```
<img width="50%" src="https://i.imgur.com/omka6u5.png" alt="My cool logo"/>


### 5.4 Entramos y configuramos 
```shell
arch-chroot /mnt
  # Ojo si hay error ejecutar e instalar denuevo
    # pacstrap /mnt base


# ahora ponemos el nombre a nuestro equipo
echo "pc-cesar" >/etc/hostname

# definimeros el timezone
ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime

# configuramos el idioma del sistema
nano /etc/locale.gen
    # desomentamos
    #es_ES.UTF-8 UTF-8
    
locales-gen

hwclock --systohc

# configuramos el teclado

echo KEYMAP=es > /etc/vconsole.conf
echo LANG=es_ES.UTF8 >/etc/locale.conf

# instalamos el grub
grub-install /dev/sda
# creamos el archivo de configuracion
grub-mkconfig -o /boot/grub/grub.cfg
```
<img width="80%" src="https://i.imgur.com/66UkmBU.png" alt="My cool logo"/>




ccdc

### 6. crear usuario y mas

```shell
# password para el root
root@cesar# passwd
  # cesar203
  

# agregar suario
root@cesar# useradd -m cesar
root@cesar# passwd cesar

# ----------------------------------------------------
# ------------- START Asignaciond e usuario ( wheel = sudo )
# ----------------------------------------------------

# info de SUDO : https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file-es

# 1. entramos como su
root@cesar$ su

# agregamos al usuario cesar al grupo (sudo = wheel)
root@cesar# usermod -aG wheel cesar 

# verificamos que  grupo estamos
root@cesar# groups cesar
  # wheel cesar
  
# Instalaremso el paquete sudo
root@cesar# pacman -S sudo

# ----------------------------------------- 
# editamos  el archivo de conf de Usuarios = SUDODERS
# ----------------------------------------- 
          
          # le decimos que editor se usuara para el comando visudo
root@cesar# EDITOR=nano visudo
root@cesar# visudo
    # descomentar
    # %wheel ALL=(ALL:ALL) ALL
        # ejemplo : https://i.imgur.com/vH1Qp8p.png
root@cesar# reboot


# OTRA opcion

# root@cesar# nano /etc/sudoers
  # desomentra
  # :::: https://i.imgur.com/vH1Qp8p.png



#
# ----------------------------------------------------
# ------------- END Asignaciond e usuario ( wheel = sudo )
# ----------------------------------------------------

# salimos
exit

umount  -R /mnt
reboot
```
<img width="50%" src="https://i.imgur.com/n9CZDja.png" alt="My cool logo"/>

### Procesos finales para activar el internet
```shell
# iniciamos el servicio de interner
systemctl start NetworkManager.service
# habilitamos al inicio el servicio
systemctl enable NetworkManager.service

# verificar targeta de vga
# i que  controlador necesitamos
lspci | grep VGA

```

### 6. Instalar entorno grafico
```shell
pacman -S xorg xf86-video-qxl spice-vdagent  gdm gnome  gnome-extra firefox

# activar el modulo qxl
#  ::::::::: si estas usando nvide o otro de video aqui ponerlo
nano /etc/mkinitcpio.conf
# editar la linea:
    # MODULES=(qxl)

#Ahora lo compilaremos
mkinitcpio -P


# habiltamos manejador de sessiones
systemctl enable gdm.service

y luego reiniciamos
```

