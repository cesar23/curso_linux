#deshabilita dhcp
sudo update-rc.d -f isc-dhcp-server remove 
#hablita dhcp
sudo update-rc.d isc-dhcp-server defaults

#instalar utilidaes
>apt install net-tools


>ifconfig -a
#generar el yaml
>sudo netplan generate
#
>nano /etc/netplan/01-network-manager-all.yaml
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




#---- ahora  aplicacmos la configuracion

>netplan apply


#------opcion antigua
fuente:https://elrespondon.com/como-configurar-direccion-ip-fija-linux-ubuntu/

>sudo nano /etc/network/interfaces

auto eth0
iface eth0 inet static
address 192.168.1.50
netmask 255.255.255.0
network 192.168.1.0
broadcast 192.168.1.255
gateway 192.168.1.1

#address es la dirección IP que quieres ponerle a tu máquina.
#netmask es la máscara de subred de esa dirección IP.
#network es la red a la que pertenece esa dirección IP.
#broadcast es la direción IP de difusión de esa red.
#gateway es la dirección IP de la puerta de enlace predeterminada. Generalmente es la dirección IP del equipo de la red o router por el que podemos salir al exterior o conectarnos a Internet. Si no conoces cual es la dirección de la puerta de enlace de tu red, tendrás que preguntarle a quien pueda 
#   saberlo o probar a poner la IP 192.168.1.1 y probar si funciona ya que en la mayoría de ocasiones suele ser esa.

#----------------- reiniciar servicio

sudo /etc/init.d/networking restart


#-agregar dns
>sudo nano /etc/resolv.conf