
# configuracion de ip de ubuntu <=18

```shell
sudo nano /etc/network/interfaces
```
<img width="70%" src="https://i.imgur.com/NFSfumH.png" alt="My cool logo"/>

-- --


## esto sirve mas que nada  para  servidores en la nube
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
