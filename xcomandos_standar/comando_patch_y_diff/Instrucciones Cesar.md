https://blog.desdelinux.net/viernes-terminal-patch-diff/

#Ojo solo funciona en Linux

## 1. creamos dos  archivos
`1_original.sh ` 
```
#!/bin/bash

echo "Escribe tu nombre: "
read nombre
echo "Escribe tu edad: "
read edad
if [[ 18 -lt $edad ]]
then
echo "Hola $nombre, tienes $edad ¡Y puedes votar!"
else
echo "Hola $nombre, tienes $edad y no puedes votar..."
fi

echo "Pulsa [Enter Para Terminar]: "
read
```
 
`1_original_nuevo.sh`

```
#!/bin/bash

maxEdad=18

echo "Escribe tu nombre: "; read nombre
echo "Escribe tu edad: "; read edad
if [[ $maxEdad -le $edad ]]; then
    echo "Hola $nombre, tienes $edad años ¡Y puedes votar!"
else
    echo "Hola $nombre, tienes $edad años y no puedes votar..."
fi

echo "Pulsa [Enter Para Terminar XD]: "
read
exit 0
```


Ahora  como sabemos que el archivo  `1_original_nuevo.sh` es el mas  actual sacaremos un parche



## 2. creamos el patch
```
diff -u 1_original.sh 1_original_nuevo.sh > parche.patch
```

## 3. aplicar el patch
antes de parchear realizar un backup ![](https://icons.iconarchive.com/icons/custom-icon-design/flatastic-9/24/Accept-icon.png)

```
cp -pf 1_original.sh 1_original_backup.sh
```
Ahora  si realizar el parche al archivo

```
patch < parche.patch
```

Ahora mira el archivo: `1_original.sh`
ya tiene el parche los cambios