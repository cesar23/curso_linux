**Bash (IV) - Estructuras De Control Y Bucles**  

<div property="schema:text" class="field field--name-body field--type-text-with-summary field--label-hidden field__item">

En nuestra cuarta entrega sobre la introduccion a el interprete de comandos Bash, vamos a ver una pequeña introduccion a las estructuras de control y bucles en Bash. Estas construcciones nos ayudan a controlar la ejecucion de un script y a obtener diversos resultados dependiendo de las condiciones que se cumplan o no cuando ejecutamos el script.

En Bash existen estas construcciones para controlar el flujo de ejecucion de un script:

*   **if/else**: Ejecuta una serie de comandos dependiendo si una cierta condicion se cumple o no.
*   **for**: Ejecuta una serie de comandos un numero determinado de veces.
*   **while**: Ejecuta una seria de comandos mientras que una determinada condicion sea cumpla.
*   **until**: Ejecuta una serie de comandos hasta que una determinada condicion se cumpla.
*   **case**: Ejecuta una o varias listas de comandos dependiendo del valor de una variable.
*   **select**: Permite seleccionar al usuario una opcion de una lista de opciones en un menu.

La mayoria de condiciones utilizadas con estas construcciones son comparaciones de cadenas alfanumericas o numericas, valores de terminacion de comandos y comprobaciones de atributos de ficheros. Antes de seguir viendo como estas construcciones se pueden utilizar, vamos a ver como las condiciones se pueden definir.

#### Comparaciones de cadenas alfanumericas

<pre>Operador		Verdad (TRUE) si:
------------------------------------------
cadena1 = cadena2	cadena1 es igual a cadena2
cadena1 != cadena2	cadena1 no es igual a cadena2
cadena1 < cadena2	cadena1 es menor que cadena2
cadena1 > cadena 2	cadena1 es mayor que cadena 2
-n cadena1		cadena1 no es igual al valor nulo (longitud mayorque 0)
-z cadena1		cadena1 tiene un valor nulo (longitud 0)
</pre>

#### Comparacion de valores numericos

<pre>Operador		Verdad (TRUE) si:
------------------------------------------
x -lt y			x menor que y
x -le y			x menor o igual que y
x -eq y			x igual que y
x -ge y			x mayor o igual que y
x -gt y			x mayor que y
x -ne y			x no igual que y
</pre>

#### Comprobacion de atributos de fichero

<pre>Operador		Verdad (TRUE) si:
------------------------------------------
-d fichero		fichero existe y es un directorio
-e fichero		fichero existe
-f fichero		fichero existe y es un fichero regular (no un
			directorio, u otro tipo de fichero especial)

-r fichero		Tienes permiso de lectura en fichero
-s fichero		fichero existe y no esta vacio
-w fichero		Tienes permiso de escritura en fichero
-x fichero		Tienes permiso de ejecucion en fichero (o de busqueda
			si es un directorio)

-O fichero		Eres el dueño del fichero
-G fichero		El grupo del fichero es igual al tuyo.

fichero1 -nt fichero2	fichero1 es mas reciente que fichero2
fichero1 -ot fichero2	fichero1 es mas antiguo que fichero2
</pre>

Podemos combinar varias condiciones con los simbolos '&&' (AND) y '||' (OR), y negar una condicion con '!'. Unos ejemplos mas adelante aclararan como utilizarlos.

#### if/else

La sintaxis de esta construccion es la siguiente:

<pre>if "condicion"
then
  "comandos"
[elif "condicion"
then
  "comandos"]
[else
  "comandos"]
fi
</pre>

Como ya hemos dicho, podemos comprobar los valores de terminacion de un comando, y comparar cadenas alfanumericas/numericas y atributos de ficheros. Nada mejor que unos ejemplos para aclararnos las ideas.

<pre>#!/bin/bash
#
# Comprobando terminacion de un comando
#

DIRECTORIO="/tmp/test"

COMANDO="/bin/mkdir $DIRECTORIO"

if $COMANDO
    then
    echo "$DIRECTORIO ha sido creado"
else
    echo "$DIRECTORIO no pudo ser creado"
fi
</pre>

<pre>#!/bin/bash
#
# Comparacion de cadenas alfanumericas
#

CADENA1="uno"
CADENA2="dos"
CADENA3=""

if [ $CADENA1 = $CADENA2 ]; then
    echo "\$CADENA1 es igual a \$CADENA2"

elif [ $CADENA1 != $CADENA2 ]; then
    echo "\$CADENA1 no es igual a \$CADENA2"

fi

if [ -z $CADENA3 ]; then
    echo "\$CADENA3 esta vacia"
fi

</pre>

<pre>#!/bin/bash
#
# Comparacion de valores numericos
#

let NUM1=1
let NUM2=2
let NUM3=3

if [ $NUM1 -ne $NUM2 ] && [ $NUM1 -ne $NUM3 ]; then
    echo "\$NUM1 es diferente a \$NUM2 y \$NUM3"
fi

if [ $NUM1 -lt $NUM3 ]; then
    echo "\$NUM1 es menor que \$NUM3"
fi
</pre>

#### for

La sintaxis de esta construccion es la siguiente:

<pre>for nombre [in lista]
do
   comandos que pueden utilizar $nombre
done
</pre>

Un ejemplo nos aclarara las cosas. Vamos a listar informacion en el DNS de una lista de direcciones web:

<pre>#!/bin/bash

for HOST in [www.google.com](http://www.google.com "www.google.com") [www.altavista.com](http://www.altavista.com "www.altavista.com") [www.yahoo.com](http://www.yahoo.com "www.yahoo.com")
do
  echo "-----------------------"
  echo $HOST
  echo "-----------------------"

  /usr/bin/host $HOST
  echo "-----------------------"

done
</pre>

#### while

La sintaxis de esta construccion es la siguiente:

<pre>while condicion
do
  comandos
done
</pre>

Un ejemplo simple con while en donde escribimos el valor de una variable 10 veces, despues de incrementar su valor:

<pre>#!/bin/bash

NUM=0

while [ $NUM -le 10 ]; do
    echo "\$NUM: $NUM"
    let NUM=$NUM+1
done
</pre>

#### until

La sintaxis de esta construccion es la siguiente:

<pre>until condicion; do
   comandos
done
</pre>

Un ejemplo simple con until en donde escribimos el valor de una variable 10 veces, despues de incrementar su valor:

<pre>#!/bin/bash

NUM=0

until [ $NUM -gt 10 ]; do
    echo "\$NUM: $NUM"
    let NUM=$NUM+1
done
</pre>

#### case

La sintaxis de esta construccion es la siguiente:

<pre>case expresion in
     caso_1 )
        comandos;;
     caso_2 ) 
	comandos;;
     ......
esac  
</pre>

Un ejemplo simple con case para aclarar las cosas:

<pre>#!/bin/bash

for NUM in 0 1 2 3
do
  case $NUM in
      0)
	  echo "\$NUM es igual a cero";;
      1)
	  echo "\$NUM es igual a uno";;
      2)
	  echo "\$NUM es igual a dos";;
      3)
	  echo "\$NUM es igual a tres";;
  esac
done
</pre>

#### select

La sintaxis de esta construccion es la siguiente:

<pre>select nombre [in lista]
do
  comandos que pueden utilizar $nombre
done
</pre>

Un ejemplo simple para aclarar las cosas.

<pre>#!/bin/bash

select OPCION in opcion_1 opcion_2 opcion_3
  do
  if [ $OPCION ]; then
      echo "Opcion elegida: $OPCION"
      break
  else
      echo "Opcion no valida"
  fi
done
</pre>

Bueno esto es todo por hoy en nuestra introduccion a Bash. En el proximo articulo de esta serie veremos diferentes aspectos de la entrada y salida de datos en un script Bash.

</div>