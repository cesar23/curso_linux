
## abrimos el archivo de configuracion

```shell
sudo cp /etc/network/interfaces /etc/network/interfaces.back
sudo vi /etc/network/interfaces
```

editamso el archivo 

<img src="https://i.imgur.com/s46IqzZ.png" alt="My cool logo"/>

-- --

```shell
auto lo
iface lo inet loopback

allow-hotplug eth0
iface eth0 inet static
address 192.168.0.102/24
gateway 192.168.0.1
```

reinicamos el servicio
```shell
sudo service networking restart
```


actualizamos  los  dns
```shell
sudo vi /etc/resolv.conf
 
 # output:
 
 #    nameserver 8.8.8.8
```
