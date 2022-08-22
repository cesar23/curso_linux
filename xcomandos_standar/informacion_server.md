## informacion de servidor o maquina CPU / GPU



### mostrar todo el hardware conectado

```shell
sudo apt-get install usbutils
apt-get install util-linux
lsusb
```

### mostrar lo conectado por pci

```shell
lspci
# >>>>>>> mas informacion
# lspci -v
# y mas detalle del detalle
# lspci -vv
```

### mostrar informacion cpu - procesador

```shell
lscpu
```
### mostrar informacion memonia

```shell
lsmen
free -h
```

### mostrar USB conectados

```shell
lsusb
```

### mostrar version de ubuntu
```shell
lsb_release -a
```


