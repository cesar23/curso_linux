# Preparation
fuente: https://www.kali.org/docs/virtualization/install-vmware-host/

instalar paquetes de vmware drivers en linux para debian kali linux


# Opcion 1

```shell
apt update
apt dist-upgrade
apt install open-vm-tools-desktop

#luego reiniciar
# y probar 
systemctl status open-vm-tools.service
```

# Opcion 2

### despues de instalar los paquetes

```shell
kali@kali:~$ sudo apt update -y
kali@kali:~$ sudo apt full-upgrade -y
kali@kali:~$
kali@kali:~$ [ -f /var/run/reboot-required ] && sudo reboot -f
kali@kali:~$
```

### descargar drivers de vwmare

```shell
kali@kali:~$ sudo apt install -y curl
# descaramaos 
kali@kali:~$ curl -A 'Mozilla/3.0 (Win95; I)' -L -o "${HOME}/Downloads/vmware.bin"  "https://www.vmware.com/go/getworkstation-linux"
kali@kali:~$
# verificamos el archivo que sea  un binario
kali@kali:~$ file Downloads/vmware.bin
Downloads/vmware.bin: a /usr/bin/env bash script executable (binary data)
kali@kali:~$
# verificamos el peso del fichero
kali@kali:~$ ls -lah Downloads/vmware.bin
-rwxr-xr-x 1 kali kali 511M Feb 14 20:46 Downloads/vmware.bin
kali@kali:~$
```

despues solo ejecutar

```shell
kali@kali:~$ chmod +x ~/Downloads/vmware.bin
kali@kali:~$
kali@kali:~$ sudo ~/Downloads/vmware.bin
Extracting VMware Installer...done.
Installing VMware Workstation 15.5.1
    Configuring...
[######################################################################] 100%
Installation was successful.
kali@kali:~$
```

### despues de todo ejecutar
```shell
kali@kali:~$ vmware
kali@kali:~$
```