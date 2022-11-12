## informacion de servidor o maquina CPU / GPU



### mostrar todo el hardware conectado

```shell
sudo apt-get install usbutils
apt-get install util-linux
lsusb
```

### mostrar lo conectado por pci

```shell
lspci
# >>>>>>> mas informacion
# lspci -v
# y mas detalle del detalle
# lspci -vv
```

### mostrar informacion cpu - procesador

```shell
lscpu
# metodo 2
cat /proc/cpuinfo
# obtener numero de procesadores
grep -c processor /proc/cpuinfo
```
### mostrar informacion memonia

```shell
lsmen
free -h
```

### mostrar USB conectados

```shell
lsusb
```
## Pagina de versiones de Repositorios Linux
link: https://patches.kernelcare.com/

<img width="100%" src="https://i.imgur.com/K013pAp.png" alt="My cool logo"/>

-- -- 


#### mostrar version de ubuntu <img width="80px" src="https://i.imgur.com/K013pAp.png" alt="My cool logo"/>
```shell
lsb_release -a
```


### mostrar version otros linux
mostraremos el kernel con el comando `uname-r`
```shell
#
uname -r
# 5.15.0-43-generic  (Ubuntu 22.04)
```

<img width="100%" src="https://i.imgur.com/JlJecG5.png" alt="My cool logo"/>

-- -- 

en cpanel se usa otra version
<img width="100%" src="https://i.imgur.com/HHnSZJl.png" alt="My cool logo"/>

-- -- 

```shell
[kpopilrp@premium28 ~]$ uname -a
Linux premium28.web-hosting.com 2.6.32-954.3.5.lve1.4.87.el6.x86_64 #1 SMP Fri Jan 28 05:34:34 EST 2022 x86_64 x86_64 x86_64 GNU/Linux
[kpopilrp@premium28 ~]$ uname -r
2.6.32-954.3.5.lve1.4.87.el6.x86_64
```

<img width="100%" src="https://i.imgur.com/Xm1C5U2.png" alt="My cool logo"/>

-- -- 
