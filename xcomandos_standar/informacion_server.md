## informacion de servidor o maquina CPU / GPU



### mostrar todo el hardware conectado

```shell
sudo apt-get install usbutils
apt-get install util-linux
lsusb
```


### mostrar La ip local

```shell
hostname -I | awk '{print $1}'
# SERVER_IP_LOCAL=$(hostname -I | awk '{print $1}')
```

### mostrar el nombre del host del server

```shell
hostname
# SERVER_HOSTNAME=$(hostname)
```

### Mostrar informacion del servidor
como nombre, distribucion

```shell
cat /proc/version
# SERVER_HOSTNAME=$(cat /proc/version)

# output
#   Linux version 5.10.147-133.644.amzn2.x86_64 (mockbuild@ip-10-0-33-205) (gcc10-gcc (GCC) 10.3.1 20210422 (Red Hat 10.3.1-1), GNU ld version 2.35-21.amzn2.0.1) #1 SMP Fri Oct 14 01:16:24 UTC 2022


cat /etc/*-release
# output
#     NAME="Amazon Linux"
#     VERSION="2"
#     ID="amzn"
#     ID_LIKE="centos rhel fedora"
#     VERSION_ID="2"
#     PRETTY_NAME="Amazon Linux 2"
#     ANSI_COLOR="0;33"
#     CPE_NAME="cpe:2.3:o:amazon:amazon_linux:2"
#     HOME_URL="https://amazonlinux.com/"
#     Amazon Linux release 2 (Karoo)
```

### mostrar informacion del CPU USADO
```shell
#top
top -bn2 | grep '%Cpu' | tail -1 | grep -P '(....|...) id,'|awk '{print "CPU Usage: " 100-$8 "%"}'
# output:
#  CPU Usage: 50.8%
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

# Detalle de memoria
free -h | grep Mem | awk '{print "Memoria Total: " $2 " , Memoria usada: "$3 " , Memoria Libre: "$4}'
# output:
# Memoria Total: 1.8G , Memoria usada: 835M , Memoria Libre: 243M


# Esto informará el porcentaje de memoria en uso
free | grep Mem | awk '{print "Procentaje usado: %" $3/$2 * 100.0}'
# output:
# %19.734




#Esto informará el porcentaje de memoria que está libre
free | grep Mem | awk '{print "Procentaje libre: %" $4/$2 * 100.0}'
# output:
# %58.734
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
