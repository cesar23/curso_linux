fuente : https://curl.se/docs/manual.html



# Ejemplo 1) manda al salida a un archivo
- 1: ejecuta el comando `ls -l`
- 2: `| tee ` manda la salida del `ls -l` y `tee` mostrara la salida
- 3: `block_devices.txt` donde guardara la salida

```shell
ls -l | tee block_devices.txt
# output:
#   total 57599
#   -rw-r--r-- 1 cesar 197121    10694 Jul 17 19:15 1.manipulacion de ficheros.sh
#   -rw-r--r-- 1 cesar 197121   129985 Jul 17 19:15 9999_lineas.txt
#   -rw-r--r-- 1 cesar 197121        0 Jul 17 19:15 Nuevo documento de texto.txt
#   -rw-r--r-- 1 cesar 197121       15 Jul 17 19:15 README.md
#   -rw-r--r-- 1 cesar 197121      127 Jul 17 19:15 abrir_navegador.sh
#   drwxr-xr-x 1 cesar 197121        0 Aug 10 20:32 amarillo
#   -rw-r--r-- 1 cesar 197121     7981 Jul 17 19:15 apellidos.txt
#     ....


# Ahora si hacemos un cat 
cat block_devices.txt
# output:
#   total 57599
#   -rw-r--r-- 1 cesar 197121    10694 Jul 17 19:15 1.manipulacion de ficheros.sh
#   -rw-r--r-- 1 cesar 197121   129985 Jul 17 19:15 9999_lineas.txt
#   -rw-r--r-- 1 cesar 197121        0 Jul 17 19:15 Nuevo documento de texto.txt
#   -rw-r--r-- 1 cesar 197121       15 Jul 17 19:15 README.md
#   -rw-r--r-- 1 cesar 197121      127 Jul 17 19:15 abrir_navegador.sh
#   drwxr-xr-x 1 cesar 197121        0 Aug 10 20:32 amarillo
#   -rw-r--r-- 1 cesar 197121     7981 Jul 17 19:15 apellidos.txt
#     ....
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
