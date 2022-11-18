fuente:
- https://www.youtube.com/watch?v=ByBeJAEEEKs
- https://www.youtube.com/watch?v=M9ZUXDrsOZw

## lo que  tenemos en discos en vmware
![](https://i.imgur.com/5tosdWi.png)

[//]: # (#################################################################)
## 1. ver unidades montadas
```shell
df -h
```
![](https://i.imgur.com/UWxc9FJ.png)



[//]: # (#################################################################)
## 2. Ver discos   (aqui se  vera  que hay  dos sda y sdb)
```shell
fdisk -l
```
![](https://i.imgur.com/TjIGi3X.png)



[//]: # (#################################################################)
### 3. Ver discos  LV (Volumenes Fisicos)
```shell
 pvs # phisical volumen scaner
```
![](https://i.imgur.com/BtXrfbt.png)


[//]: # (#################################################################)
### 4. volumenes logicos (Volumenes Logicos)
```shell
 lvs # phisical volumen scaner
```
![](https://i.imgur.com/8taKuMb.png)

[//]: # (#################################################################)
### 5. volumenes de grupo 
```shell
 root@pve:~# vgs
  VG         #PV #LV #SN Attr   VSize   VFree
  Disco_70GB   1   2   0 wz--n- <70.00g  <6.00g
  pve          2   3   0 wz--n- 159.49g 107.37g
  storage      1   1   0 wz--n- <44.00g      0
  vg_datos     1   1   0 wz--n- <65.00g <33.00g
root@pve:~#
```

[//]: # (#################################################################)
### 5. ver informacion de discos
```shell
 lsblk # informacion de discos
 lsblk -fm  # mas detalles ver  formatos
```
![](https://i.imgur.com/Ck96HdX.png)

##  Me  falto terminar de ver los videos.
pero ya entendi de que se trata. es poder crear o tener uan particion en un formato
y poder poner otro disco y unirlo a una particion que ya tengamos, o tambien extener cualquier ruta
