# par  apartir de la version 17.10
# Por lo tanto, a partir de la versión 17.10, deberemos utilizar archivos de configuración con extensión yaml, almacenados en la ruta /etc/netplan.


#-----------------------------------------------------
ls -l /etc/netplan
#-----------------------------------------------------
    # total 4
    # -rw-r--r-- 1 root root 115 Jul  8 17:08  00-installer-config.yaml


#-----------------------------------------------------
#--------miramos la  configuracion
#-----------------------------------------------------
cat /etc/netplan/00-installer-config.yaml
    # This is the network config written by 'subiquity'
    # network:
    #   ethernets:
    #      eth0:
    #      dhcp4: true
    #   version: 2

#-----------------------------------------------------
#--------cambiamos la  configuracion
#-----------------------------------------------------
sudo nano /etc/netplan/00-installer-config.yaml

# network:
#   ethernets:
#     enp0s3:
#       dhcp4: no
#       addresses: [192.168.1.10/24]
#       gateway4: 192.168.1.1
#       nameservers:
#          addresses: [208.67.222.222]
#   version: 2

#---------------------otro demo 
# network:
#   version: 2
#   renderer: networkd
#   ethernets:
#     ens3:
#       dhcp4: no
#       addresses:
#         - 192.168.121.221/24
#       gateway4: 192.168.121.1
#       nameservers:
#           addresses: [8.8.8.8, 1.1.1.1]

#-----------------------------------------------------
# reinicar el servicio
#-----------------------------------------------------


# --------------------------------------------
# ------------ en ubuntu 22   ---------------
# --------------------------------------------

network:
  version: 2
  ethernets:
    ens33:
      dhcp4: false
      addresses: [192.168.0.60/24]
      gateway4: 192.168.0.1
      nameservers:
        addresses: [8.8.8.8,8.8.4.4,192.168.0.1]




# ---------- ahora aplicar los
sudo netplan apply