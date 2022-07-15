# 1 editar
nano /etc/network/interfaces


# The loopback network interface
auto lo
iface lo inet loopback

# The primary network interface
# allow-hotplug eth0
# iface eth0 inet dhcp

# Static IP address
auto eth0
iface eth0 inet static
        address 192.168.1.100
        netmask 255.255.255.0
        network 192.168.1.0
        broadcast 192.168.1.255
        gateway 192.168.1.1
También es necesario indicar la dirección del servidor DNS. En esta configuración, el servidor DNS funciona en el router/modem ADSL, por lo que el parámetro para nameserver debe tener el valor 192.168.1.1, en el archivo/etc/resolv.conf:

/etc/resolv.conf
domain localdomain
search localdomain
nameserver 192.168.1.1
Ahora debe reiniciarse la interfaz de red para activar la nueva configuración:

root@server:~# ifdown eth0
root@server:~# ifup eth0
Verificación
El comando ifconfig suministra información detallada sobre la configuración de las interfaces de red. La configuración de la interfaz eth0 debe exhibir, los parámetros previamente definidos:

root@server:~# ifconfig
eth0      Link encap:Ethernet  HWaddr 08:00:27:84:4c:b2
          inet addr:192.168.1.100  Bcast:192.168.1.255  Mask:255.255.255.0
          inet6 addr: fe80::a00:27ff:fe84:4cb2/64 Scope:Link
          UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
          RX packets:32 errors:0 dropped:0 overruns:0 frame:0
          TX packets:68 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:1000
          RX bytes:5657 (5.5 KiB)  TX bytes:9091 (8.8 KiB)

lo        Link encap:Local Loopback
          inet addr:127.0.0.1  Mask:255.0.0.0
          inet6 addr: ::1/128 Scope:Host
          UP LOOPBACK RUNNING  MTU:16436  Metric:1
          RX packets:0 errors:0 dropped:0 overruns:0 frame:0
          TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
          collisions:0 txqueuelen:0
          RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)
También, debe ser posible contactar a servidores en la Internet:

root@server:~# ping -c3 www.debian.org
PING www.debian.org (206.12.19.7) 56(84) bytes of data.
64 bytes from bellini.debian.org (206.12.19.7): icmp_seq=1 ttl=43 time=188 ms
64 bytes from bellini.debian.org (206.12.19.7): icmp_seq=2 ttl=43 time=190 ms
64 bytes from bellini.debian.org (206.12.19.7): icmp_seq=3 ttl=43 time=185 ms

--- www.debian.org ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2005ms
rtt min/avg/max/mdev = 185.808/188.217/190.108/1.793 ms
