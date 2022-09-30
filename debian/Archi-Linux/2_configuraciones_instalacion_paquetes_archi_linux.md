# instalacion de paquetes en archi linux

### Manejo de repo paquetes
```shell
# para actualizar lista de paqutes
sudo pacman -Sy

# actualizar paquetes
#sudo pacman -Syu
 
sudo pacman -Syyu
```

### Instalar y eleminar  paquetes
```shell
pacman -S git 
pacman -S cmatrix 

# desintalar
sudo pacman -R cmatrix
```

### Instalar VMWareTools
```shell
root@cesar$ sudo su
root@cesar# pacman -S open-vm-tools xf86-video-vmware  xf86-input-vmmouse
root@cesar# systemctl enable vmtoolsd
```


### Instalar Repositorio AUR (no funciona usar el linux simple)
fuente: 
- https://aur.archlinux.org/
- https://www.youtube.com/watch?v=XhpTnIxoGOM


```shell
mkdir -p "/home/${USERNAME}/Desktop/repos"
cd "/home/${USERNAME}/Desktop/repos"
git clone https://aur.archlinux.org/paru-bin.git
cd paru-bin
# ahora instalamosuna seri d cosillas
makepkg -si
```

### instalar openssh
```shell
sudo pacman -S openssh
sudo systemctl status sshd
sudo systemctl start sshd
# para habilitarlo al inicio
sudo systemctl enable sshd
```