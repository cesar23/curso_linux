# par  apartir de la version 20
Por lo tanto, a partir de la versión 20.10, deberemos utilizar archivos de configuración con extensión yaml, almacenados en la ruta /etc/netplan.


entramos a mirar los ficheros:
```shell
ls -l /etc/netplan
# output:
    # total 4
    # -rw-r--r-- 1 root root 115 Jul  8 17:08  00-installer-config.yaml

```

miramos la  configuracion

```shell
cat /etc/netplan/00-installer-config.yaml

# output:

    # This is the network config written by 'subiquity'
    # network:
    #   ethernets:
    #      eth0:
    #      dhcp4: true
    #   version: 2

```
### cambiamos la  configuracion

`sudo nano /etc/netplan/00-installer-config.yaml`

```shell
network:
  ethernets:
    enp0s3:
      dhcp4: no
      addresses: [192.168.1.10/24]
      gateway4: 192.168.1.1
      nameservers:
         addresses: [208.67.222.222]
  version: 2
```

#### otro demo 
```shell
network:
  version: 2
  renderer: networkd
  ethernets:
    ens3:
      dhcp4: no
      addresses:
        - 192.168.121.221/24
      gateway4: 192.168.121.1
      nameservers:
          addresses: [8.8.8.8, 1.1.1.1]
```
5luego reinicar el servicio `sudo netplan apply`




## Ahora aplicar los
```shell
sudo netplan restart
```


# en versiones anteriores <=18
### para versiones de ubuntu <=18
editar `/etc/network/interfaces`

```shell
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
auto ens18
iface ens18 inet static
address 192.168.0.21
netmask 255.255.255.0
network 192.168.0.0
broadcast 192.168.0.254
gateway 192.168.0.1
#dns-nameservers 216.187.125.130 216.187.125.131
dns-nameservers 8.8.8.8 8.8.4.4
```

