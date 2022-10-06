fuente : https://curl.se/docs/manual.html



# Ejemplo 1)manda al salida a un archivo
```shell
ls -l | tee block_devices.txt
```
# Ejemplo 2)guarda al salida  en  varios  archivo
```shell
hostname | tee tee_ouput_1.txt tee_ouput_2.txt
```
# Ejemplo 3) Suprimir la salida del comando tee
suprimer al  salida  pero lo manda a `tee_ouput_3.txt`
```shell
df -h | tee tee_ouput_3.txt > /dev/null
```

# Ejemplo 4) Agregar salida a un archivo con el comando tee (como un apend al fichero)
```shell
date | tee -a tee_ouput_4.txt
date | tee -a tee_ouput_4.txt
# ahora veras dos lineas en : tee_ouput_4.txt
```
# Ejemplo 5) Usar tee junto con el comando sudo
```shell
echo "127.0.0.1 dominiobueno.com" | sudo tee -a /etc/hosts/
# ::::::: para  windows
    # echo "127.0.0.1 dominiobueno.com" | tee -a /c/Windows/System32/drivers/etc/hosts/
```
# Ejemplo 6) Redirigir la salida de un comando a otro usando el comando tee
```shell
grep 'root' /etc/passwd | tee /tmp/passwd.tmp | wc -l
# salida: 
# 1

# cat /tmp/passwd.tmp
#       root:x:0:0:root:/root:/bin/bash

```
