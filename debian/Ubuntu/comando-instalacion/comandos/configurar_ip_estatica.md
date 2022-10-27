# configurar ip statica en linux



### deshabilita dhcp
```shell
sudo update-rc.d -f isc-dhcp-server remove 
```


### hablita dhcp
```shell
sudo update-rc.d isc-dhcp-server defaults
```

### instalar utilidaes
```shell
apt install net-tools

ifconfig -a
```


# Para veriones de ubuntu verion >= 20.0
```shell
#generar el yaml
sudo netplan generate
```

## configurar el archivo
 editaremos el archivo `nano /etc/netplan/01-network-manager-all.yaml`

### Ejemplo 1
```shell
# Ejemplo de una Maquina Virtual
network:
  version: 2
  ethernets:
    ens33:
      dhcp4: false
      addresses: [192.168.0.60/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4,192.168.0.1]

```


### Ejemplo 2
```shell
#ahi escribimos esto
network:
 version: 2
 renderer: networkd
 ethernets:
   #nombre de red 0
   #enp0s3:
   #nombre de red 1
   wlp7s0:
    dhcp4: no
    dhcp6: no
    addresses: [192.168.1.18/24]
    gateway4: 192.168.1.1
    nameservers:
     addresses: [8.8.8.8,8.8.4.4]
```

```shell
#---- ahora  aplicacmos la configuracion
netplan apply
```





# Para veriones de ubuntu verion <= 19.0

fuente:https://elrespondon.com/como-configurar-direccion-ip-fija-linux-ubuntu/

editar el fichero : `sudo nano /etc/network/interfaces`

```shell
auto eth0
iface eth0 inet static
address 192.168.1.50
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
gateway 192.168.1.1



# address es la dirección IP que quieres ponerle a tu máquina.
# netmask es la máscara de subred de esa dirección IP.
# network es la red a la que pertenece esa dirección IP.
# broadcast es la direción IP de difusión de esa red.
# gateway es la dirección IP de la puerta de enlace predeterminada. Generalmente es la dirección IP del equipo de la red o router por el que podemos salir al exterior o conectarnos a Internet. Si no conoces cual es la dirección de la puerta de enlace de tu red, tendrás que preguntarle a quien pueda

```

```shell
#----------------- reiniciar servicio
sudo /etc/init.d/networking restart
```


```shell
#-agregar dns
>sudo nano /etc/resolv.conf
```