# instalacion de archilinux simple

Para inicailar el winzar de instalacion
```shell
root@archiso~# archinstall 
```

### instalazacion de paquetes y actualizacion
```shell
[cesar@archlinux ~]$ sudo pacman -Syu
[cesar@archlinux ~]$ sudo pacman -S neofetch

# para la instalacion de paquetes para la tienda que biene en archilinux
[cesar@archlinux ~]$ sudo pacman -S packagekit-qt5
#  demo:  https://i.imgur.com/zyY4M7T.png
```

### instalazacion de repo AUR
1. instalamos las keys
```shell
sudo pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key FBA220DFC880C036
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
```

2. editamos el archivo `sudo nano /etc/pacman.conf` y ingresamos al final
```shell
#esto es par a el repo aur
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist

```

3. sincronizamos los paquetes
```shell
sudo pacman -Syu pamac-aur 
```

## instalacion de repos de blackarch

fuente : https://blackarch.org/downloads.html#install-repo

#### 1. descargamos el archivo del repositorio
```shell

mkdir -p "/home/${USER}/Desktop/blackarch" && \
cd "/home/${USER}/Desktop/blackarch" && \
curl -O https://blackarch.org/strap.sh  
# verificar sha
echo 5ea40d49ecd14c2e024deecf90605426db97ea0c strap.sh | sha1sum -c
```
#### 2. modificaremos el servers de mirrors

editaremos el archivo `/etc/pacman.d/blackarch-mirrorlist`
```shell
# sudo nano /etc/pacman.d/blackarch-mirrorlist

# y domentarmos todos los servers y solo dejamos los de eeuu

# USA
Server = http://mirror.math.princeton.edu/pub/blackarch/$repo/os/$arch
Server = http://distro.ibiblio.org/blackarch/$repo/os/$arch
Server = ftp://distro.ibiblio.org/blackarch/$repo/os/$arch
Server = http://mirror.team-cymru.com/blackarch/$repo/os/$arch
Server = ftp://mirror.team-cymru.com/blackarch/$repo/os/$arch
Server = https://mirrors.ocf.berkeley.edu/blackarch/$repo/os/$arch
Server = http://mirrors.ocf.berkeley.edu/blackarch/$repo/os/$arch
```
ahora procedmeos a instalar

```shell
# Run strap.sh

$ sudo ./strap.sh
# Enable multilib following 7https://wiki.archlinux.org/index.php/Official_repositories#Enabling_multilib and run:777
$ sudo pacman -Syu

# -------------------------------------------------------
# --------instala paquetes de blackarch
# -------------------------------------------------------
# ver los paquetes contemplado
> sudo pacman -Sgg | grep blackarch

> sudo pacman -S 
```

#### 4. Desintalar o Desactivar  blackarch
ecgitar el archivo `sudo nano /etc/pacman.conf`
```shell
[blackarch]
Include = /etc/pacman.d/blackarch-mirrorlist
 # comentarlo
 
# [blackarch]
# Include = /etc/pacman.d/blackarch-mirrorlist

```