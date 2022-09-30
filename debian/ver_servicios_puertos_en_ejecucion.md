# Ver servicios en ejecucion y sus puertos

## ✅ Podemos ver los servicios que dependen de systemd, ejecutando
 ejecutar `systemctl list-units -t service --all`
```shell
root@ubuntu:/var/log/apache2# systemctl list-units -t service --all
  UNIT                                                                                      LOAD      ACTIVE   SUB     DESCRIPTION
  accounts-daemon.service                                                                   loaded    active   running Accounts Service
  acpid.service                                                                             loaded    inactive dead    ACPI event daemon
  apache-htcacheclean.service                                                               loaded    active   running Disk Cache Cleaning Daemon for Apache HTTP Serv
  apache2.service                                                                           loaded    active   running The Apache HTTP Server
● apparmor.service                                                                          loaded    failed   failed  AppArmor initialization
  apport-autoreport.service                                                                 loaded    inactive dead    Process error reports when automatic reporting
  apport.service                                                                            loaded    active   exited  LSB: automatic crash report generation
  apt-daily-upgrade.service                                                                 loaded    inactive dead    Daily apt upgrade and clean activities
  apt-daily.service                                                                         loaded    inactive dead    Daily apt download activities
  atd.service                                                                               loaded    active   running Deferred execution scheduler
● auditd.service                                                                            not-found inactive dead    auditd.service
  blk-availability.service                                                                  loaded    active   exited  Availability of block devices
  canvas_init.service                                                                       loaded    active   exited  LSB: Start/stop Canvas background jobs
  certbot.service                                                                           loaded    inactive dead    Certbot
● cloud-init-local.service                                                                  not-found inactive dead    cloud-init-local.service
● connman.service                                                                           not-found inactive dead    connman.service
● console-screen.service                                                                    not-found inactive dead    console-screen.service
  console-setup.service                                                                     loaded    active   exited  Set console font and keymap
  cron.service                                                                              loaded    active   running Regular background program processing daemon
  dbus.service                                                                              loaded    active   running D-Bus System Message Bus
● display-manager.service                                                                   not-found inactive dead    display-manager.service
  dm-event.service                                                                          loaded    inactive dead    Device-mapper event daemon
  ebtables.service                                                                          loaded    active   exited  ebtables ruleset management
  emergency.service                                                                         loaded    inactive dead    Emergency Shell
● fcoe.service                                                                              not-found inactive dead    fcoe.service
  fstrim.service                                                                            loaded    inactive dead    Discard unused blocks
  getty-static.service                                                                      loaded    inactive dead    getty on tty2-tty6 if dbus and logind are not a
  getty@tty1.service                                                                        loaded    active   running Getty on tty1
  grub-common.service                                                                       loaded    active   exited  LSB: Record successful boot for GRUB
  ifup@ens18.service                                                                        loaded    active   exited  ifup for ens18
  irqbalance.service                                                                        loaded    active   running irqbalance daemon
● iscsi-shutdown.service                                                                    not-found inactive dead    iscsi-shutdown.service
  iscsid.service                                                                            loaded    inactive dead    iSCSI initiator daemon (iscsid)
● kbd.service                                                                               not-found inactive dead    kbd.service
  keyboard-setup.service                                                                    loaded    active   exited  Set the console keyboard layout
  kmod-static-nodes.service                                                                 loaded    active   exited  Create list of required static device nodes for
● lvm2-activation.service                                                                   not-found inactive dead    lvm2-activation.service
  lvm2-lvmetad.service                                                                      loaded    active   running LVM2 metadata daemon
  lvm2-lvmpolld.service                                                                     loaded    inactive dead    LVM2 poll daemon
  lvm2-monitor.service                                                                      loaded    active   exited  Monitoring of LVM2 mirrors, snapshots etc. usin
  lvm2-pvscan@8:4.service                                                                   loaded    active   exited  LVM2 PV scan on device 8:4
  lvm2-pvscan@8:5.service                                                                   loaded    active   exited  LVM2 PV scan on device 8:5
● lxc.service                                                                               not-found inactive dead    lxc.service
  lxcfs.service                                                                             loaded    active   running FUSE filesystem for LXC
  lxd-containers.service                                                                    loaded    active   exited  LXD - container startup/shutdown

```


## ✅ Que puertos estan abiertos en nuestro server
```shell
root@ubuntu:~# ss -plnt
State       Recv-Q       Send-Q               Local Address:Port                Peer Address:Port
LISTEN      0            128                        0.0.0.0:111                      0.0.0.0:*           users:(("rpcbind",pid=813,fd=8))
LISTEN      0            128                  127.0.0.53%lo:53                       0.0.0.0:*           users:(("systemd-resolve",pid=817,fd=13))
LISTEN      0            128                        0.0.0.0:22                       0.0.0.0:*           users:(("sshd",pid=1369,fd=3))
LISTEN      0            224                      127.0.0.1:5432                     0.0.0.0:*           users:(("postgres",pid=1430,fd=8))
LISTEN      0            500                        0.0.0.0:17789                    0.0.0.0:*           users:(("ruby",pid=20344,fd=11))
LISTEN      0            5                        127.0.0.1:5666                     0.0.0.0:*           users:(("nrpe",pid=1195,fd=6))
LISTEN      0            128                           [::]:111                         [::]:*           users:(("rpcbind",pid=813,fd=11))
LISTEN      0            1024                             *:80                             *:*           users:(("apache2",pid=19877,fd=4),("apache2",pid=19876,fd=4),("apache2",pid=19875,fd=4),("apache2",pid=1453,fd=4))
LISTEN      0            128                           [::]:22                          [::]:*           users:(("sshd",pid=1369,fd=4))
LISTEN      0            224                          [::1]:5432                        [::]:*           users:(("postgres",pid=1430,fd=7))
LISTEN      0            1024                             *:443                            *:*           users:(("apache2",pid=19877,fd=6),("apache2",pid=19876,fd=6),("apache2",pid=19875,fd=6),("apache2",pid=1453,fd=6))
root@ubuntu:~#
```

##  ✅ Otro comando es es `lsof`
Otro comando muy útil para estos fines, puede ser lsoft, el cual realiza una función similar a los que citamos, pero a mayores, es capaz de enlazar puertos abiertos a servicios y mostrar una lista de archivos que se encuentran abiertos en el sistema con los procesos correspondientes.
```shell
#Si no esta  instalado
sudo apt-get -y install lsof
```

Ver las conexiones establecidas ` lsof -i`
```shell
cesar@cesar-virtual-machine:~$ sudo lsof -i
COMMAND    PID            USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
systemd-r  750 systemd-resolve   13u  IPv4  37393      0t0  UDP localhost:domain
systemd-r  750 systemd-resolve   14u  IPv4  37394      0t0  TCP localhost:domain (LISTEN)
avahi-dae  846           avahi   12u  IPv4  40324      0t0  UDP *:mdns
avahi-dae  846           avahi   13u  IPv6  40325      0t0  UDP *:mdns
avahi-dae  846           avahi   14u  IPv4  40326      0t0  UDP *:36419
avahi-dae  846           avahi   15u  IPv6  40327      0t0  UDP *:52358
NetworkMa  852            root   29u  IPv6  42450      0t0  UDP cesar-virtual-machine:dhcpv6-client
cupsd      941            root    6u  IPv6  40862      0t0  TCP ip6-localhost:ipp (LISTEN)
cupsd      941            root    7u  IPv4  40863      0t0  TCP localhost:ipp (LISTEN)
apache2    998            root    4u  IPv6  39433      0t0  TCP *:tproxy (LISTEN)
apache2   1003        www-data    4u  IPv6  39433      0t0  TCP *:tproxy (LISTEN)
apache2   1004        www-data    4u  IPv6  39433      0t0  TCP *:tproxy (LISTEN)
cups-brow 1126            root    7u  IPv4  42282      0t0  UDP *:631
sshd      2998            root    3u  IPv4  57084      0t0  TCP *:ssh (LISTEN)
sshd      2998            root    4u  IPv6  57086      0t0  TCP *:ssh (LISTEN)
sshd      3024            root    4u  IPv4  57146      0t0  TCP cesar-virtual-machine:ssh->192.168.0.20:51087 (ESTABLISHED)
sshd      3193           cesar    4u  IPv4  57146      0t0  TCP cesar-virtual-machine:ssh->192.168.0.20:51087 (ESTABLISHED)


```

ver conexion de puerto especifico `lsof -i:22`
```shell
cesar@cesar-virtual-machine:~$ sudo lsof -i:22
COMMAND  PID  USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
sshd    2998  root    3u  IPv4  57084      0t0  TCP *:ssh (LISTEN)
sshd    2998  root    4u  IPv6  57086      0t0  TCP *:ssh (LISTEN)
sshd    3024  root    4u  IPv4  57146      0t0  TCP cesar-virtual-machine:ssh->192.168.0.20:51087 (ESTABLISHED)
sshd    3193 cesar    4u  IPv4  57146      0t0  TCP cesar-virtual-machine:ssh->192.168.0.20:51087 (ESTABLISHED)
```


## ✅  ver puertos abiertos `netstat`

- T: Permite mostrar los puertos TCP.
- U: Permite ver los puertos UDP.
- L: Muestra los puertos abiertos o de escucha (Listen).
- P: --programs           display PID/Program name for sockets
- N: Permite ver los números de los puertos.
```shell
cesar@cesar-virtual-machine:~$ sudo netstat -tulpn
Active Internet connections (only servers)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       PID/Program name
tcp        0      0 127.0.0.1:631           0.0.0.0:*               LISTEN      941/cupsd
tcp        0      0 127.0.0.53:53           0.0.0.0:*               LISTEN      750/systemd-resolve
tcp        0      0 0.0.0.0:22              0.0.0.0:*               LISTEN      2998/sshd: /usr/sbi
tcp6       0      0 :::8081                 :::*                    LISTEN      998/apache2
tcp6       0      0 ::1:631                 :::*                    LISTEN      941/cupsd
tcp6       0      0 :::22                   :::*                    LISTEN      2998/sshd: /usr/sbi
udp        0      0 0.0.0.0:631             0.0.0.0:*                           1126/cups-browsed
udp        0      0 0.0.0.0:5353            0.0.0.0:*                           846/avahi-daemon: r
udp        0      0 0.0.0.0:36419           0.0.0.0:*                           846/avahi-daemon: r
udp        0      0 127.0.0.53:53           0.0.0.0:*                           750/systemd-resolve
udp6       0      0 fe80::7e6c:1e4a:866:546 :::*                                852/NetworkManager
udp6       0      0 :::52358                :::*                                846/avahi-daemon: r
udp6       0      0 :::5353                 :::*                                846/avahi-daemon: r

# en windows
# netstat -ano
```
![](https://i.imgur.com/2nbcYxX.png) 



### ✅  Resumiendo
para  hacer  seguimentos
```shell
# ver que puesrtos tenemos abierto
ss -plnt
# que se esta  ejecutando en ese puerto
lsof -i:22

```