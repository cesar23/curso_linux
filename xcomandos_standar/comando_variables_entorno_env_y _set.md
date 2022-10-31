# variables de entorno linux

mostrar las  variables de forma ordenada
```shell
printenv | less
# o
set
# o
env 
# la unica manera de buscar en variables de entonrno
printenv | grep 'HOME' 
```


Imprimir variables de entorno
```shell
printenv HOME
echo $HOME

# buscar variable
set | grep TEST_VAR
```


# 1. Crear una variable

```shell
TEST_VAR='Hello World!'
# imprimir variable
echo $TEST_VAR
```

### Creación de variables de entorno
Ahora, vamos a convertir nuestra variable de shell en una variable de entorno. Podemos hacer esto exportando la variable. El comando para hacerlo se denomina correctamente:

```shell
export TEST_VAR
# de forma directa
export TEST_VAR2="Testing export"


# comprobamos si esta en las variables de entornno
printenv | grep TEST_VAR
```
Esta vez, aparecerá nuestra variable. Intentemos nuestro experimento de nuevo con nuestro shell secundario:

````shell
bash
echo $TEST_VAR
````

### Degradación y anulación de variables
Todavía tenemos nuestra variable `TEST_VAR` definida como una variable de entorno. Podemos volver a convertirla en una variable de shell escribiendo:

```shell
export -n TEST_VAR
# ahora solo sera una variable local
```

### Anular  varianble
```shell
unset TEST_VAR
```

# 2. Configuración de variables de entorno al iniciar sesión
Una sesión iniciada como sesión con inicio de sesión 
leerá primero los detalles de la
configuración del archivo `/etc/profile` ,` /etc/.bashrc.bashrc`


Lee el primer archivo que puede encontrar con

`~/.bash_profile`, `~/.bash_login` y `~/.profile`, y no lee ningún otro archivo.


### Editar el fichero

###### para el usuario
editar el fichero `nano ~/.bashrc`
###### para todos
editar el fichero `nano /etc/profile`
```shell
TEST_VAR='Hello World!'
```

### comprobar si existe Variable
```shell
VAR_DEMO='ffff'
if [ -n "$VAR_DEMO" ]; then
  echo "Si existe variable"
else
  echo "No existe"
fi

```


# Poner DEBUG  variables


- http://redsymbol.net/articles/unofficial-bash-strict-mode/


`SET` Muestra/Modifica "todas" las variables de shell, incluyendo las variables definidas por el usuario,
las modificaciones sólo tendrán validez dentro de la sesión.
set Muestra "todas" las variables de ambiente.

```shell
set -a # A partir de este momento, las variables que se declaren se exportan automaticamente a globales sin necesidad de ejecutar "export variable"
set -b # Si disponemos de una aplicacion que se ejecuta en segundo plano, nos reporta el estado una vez haya terminado.
set -x # Imprime una traza de comandos simples, para comandos, comandos de casos Bueno para hacer DEBUG
set -vx # Muestra las lineas que va ejecutando nuestra script. Para desactivar-lo: set +xv
set variable=valor # Se crea una variable local
export variable # Se pasa la variable local a global
echo ${variable} # Muestra la variable
```



# yo uso
```shell
set -x #modo degub y lo quito set +x
```

### Ejemplos
```shell

# root@ubuntu:~# set -x
# root@ubuntu:~# echo `expr 10 + 20 `
# ++ expr 10 + 20
# + echo 30
# 30


# root@ubuntu:~# set -vx
# root@ubuntu:~# echo "peru"
# echo "peru"
# + echo peru
# peru

```	
	
#---------------------REgresar todo como estaba  antes-----------------------------------------
set +xv
