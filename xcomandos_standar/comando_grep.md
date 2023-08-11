# Comando grep

## :parametros

```shell
	-c En lugar de imprimir las líneas que coinciden, muestra el número de líneas que coinciden.
	-e PATRON nos permite especificar varios patrones de búsqueda o proteger aquellos patrones de búsqueda que comienzan con el signo -.
	-r busca recursivamente dentro de todos los subdirectorios del directorio actual.
	-v nos muestra las líneas que no coinciden con el patrón buscado.
	-i ignora la distinción entre mayúsculas y minúsculas.
	-n Numera las líneas en la salida.
	-E nos permite usar expresiones regulares. Equivalente a usar egrep.
	-o le indica a grep que nos muestre sólo la parte de la línea que coincide con el patrón.
	-f ARCHIVO extrae los patrones del archivo que especifiquemos. Los patrones del archivo deben ir uno por línea.
	-H nos imprime el nombre del archivo con cada coincidencia.
```

### Comandos mas usados
```shell
grep : office.txt #buscamos todos las lineas que contengan :
grep An office.txt #buscamos todos las lineas que inicien con An :
grep -i An office.txt #buscamos todos las lineas que en cualquier lugar  An (Cesar  yo lo   use):

```



### buscar si existe palabra y retorna 1 o 0

aqui buscamos en el archivo `demo_1.php` si existe la palabra `WP_DEBUG` si existe
debolvera `1` si no `0`
```shell
grep -c "WP_DEBUG" demo_1.php
# output:
#   1
   
grep -c "WP_UG" demo_1.php
# output:
#   0  

# ---------------- validar con if
if [ $(grep -c "WP_DEBUG" demo_1.php) -eq 1 ]
then
    echo "Si existe WP_DEBUG"
fi

```




### busquedas por patron 
```shell
grep -i -e An -e : office.txt #busca las coincidencias ( An y : )
```

### busqueda  inversa
```shell
grep -v : office.txt
```


### busqueda varios ficheros

```shell
grep cesar *  #buscamos en el directorio actual la palabra cesar en todos los ficheros
grep -r cesar * #buscamos en el directorio actual y en los  sub directorios la palabra cesar
```

### busqueda recursivamenete
```shell
grep -r "class foo" .
```
<img src="https://i.imgur.com/QZx8ngr.png" >
-- --------------------------

También puede usar la sintaxis global para buscar dentro de archivos específicos como:

```shell
grep "class foo" **/*.c
```
Si tiene el error de que su argumento es demasiado largo, considere 
restringir su búsqueda o use la sintaxis de búsqueda en su lugar, como:

```shell
find . -name "*.php" -execdir grep -nH --color=auto foo {} ';'
```


## para Windows: <img width="30" src="https://cdn.worldvectorlogo.com/logos/microsoft-windows-22.svg" alt="My cool logo"/>

## equivalencia de grep en  windows

```shell
#--buscar texto en archivo
findstr /C:"Cesar" empresas.txt

#-- buscar tezto en listado
tasklist |findstr /C:"chrome"
```
### Equibalencia powershell

```shell
netstat -ano | Select-String ":80"
```
