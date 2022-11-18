# instalacion noefetch

## 1. Primero actualizamos los repositorios.

Para Debian y Ubuntu.



```shell
sudo apt-get update
```
También podemos actualizar los repositorios de la siguiente forma.

```shell
sudo apt update
```
En Arch o derivados como EndeavourOS
```shell
sudo pacman -Syu
```

## 2. Instalar el paquete





En Debian y Ubuntu.

<img width="50%" src="https://cdn.worldvectorlogo.com/logos/ubuntu-1.svg" alt="My cool logo"/>

```shell
sudo apt install neofetch
```
Esta variante de comando también puede ser usada.

```shell
sudo apt-get install neofetch
```

<img width="50%" src="https://cdn.worldvectorlogo.com/logos/arch-linux-logo.svg" alt="My cool logo"/>



Para Arch y EndeavourOS

```shell
sudo pacman -S neofetch
```
3. Usamos Neofetch


```shell
neofetch
```


### parametros
```shell
neofetch --memory_display bar --color_blocks off
```
### para  cambiar assci
```shell
./neofeth.sh --help

# ASCII:
#     --ascii_colors x x x x x x  Colors to print the ascii art
#     --ascii_distro distro       Which Distro's ascii art to print
#                                 NOTE: AIX, Alpine, Anarchy, Android, Antergos, antiX, AOSC,
#                                 Apricity, ArcoLinux, ArchBox, ARCHlabs, ArchStrike,
#                                 XFerience, ArchMerge, Arch, Artix, Arya, Bedrock, Bitrig,
#                                 BlackArch, BLAG, BlankOn, BlueLight, bonsai, BSD,
#                                 BunsenLabs, Calculate, Carbs, CentOS, Chakra, ChaletOS,
#                                 Chapeau, Chrom, Cleanjaro, ClearOS, Clear_Linux, Clover,
#                                 Condres, Container_Linux, CRUX, Cucumber, Debian, Deepin,
#                                 DesaOS, Devuan, DracOS, DragonFly, Drauger, Elementary,
#                                 EndeavourOS, Endless, EuroLinux, Exherbo, Fedora, Feren, FreeBSD,

 ./neofeth.sh --ascii_distro Ubuntu
 ./neofeth.sh --ascii_distro Arch
 
```

<img width="90%" src="https://i.imgur.com/z9YsXO8.png" alt="My cool logo"/>
