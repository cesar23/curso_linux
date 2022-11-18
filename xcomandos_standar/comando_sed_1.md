fuente:

- https://geekland.eu/uso-del-comando-sed-en-linux-y-unix-con-ejemplos/
- https://www.ionos.es/digitalguide/servidores/configuracion/comando-sed-de-linux/

trucos: 
- https://es.ccm.net/faq/3052-sed-trucos-y-tips
- https://linuxhint.com/50_sed_command_examples/


```
#---------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>> PARAMETROS <<<<<<<<<<<<<<<<<<<<<<<<<<<
#---------------------------------------------------------------------<

        # | Parametro | Explicacion                                                                           |
        # |-----------|---------------------------------------------------------------------------------------|
        # | -e        | Hace que utilicen uno o varios scripts SED                                            |
        # | -f        | Hace que el script se extraiga de un archivo                                          |
        # | -n        | Los resultados no se deben emitir                                                     |
        # | -i        | Crea un archivo temporal que posteriormente sustituye  al archivo de origen           |
        # | -u        | No se utiliza ningún buffer de datos                                                  |
        # | -s        | Varios archivos se tratan por separado en lugar de ser  un único largo flujo de datos |
        # | -r        | El comando acepta expresiones regulares ampliadas                                     |

                    # :::::::::::::::::::::::::::::::::
                    #::::: sintaxis con parametros:::::

                    # sed 's/texto_a_buscar/texto_a_reemplazar/' <fichero_a_reemplazar >fichero_nuevo
                    # echo "texto" | sed 's/texto_a_buscar/texto_a_reemplazar/'

```

-- --

```

#---------------------------------------------------------------------
# >>>>>>>>>>>>>>>>>>>>>>>>>>>>> ORDENES <<<<<<<<<<<<<<<<<<<<<<<<<<<<
#---------------------------------------------------------------------

# fuente: https://www.linuxtotal.com.mx/index.php?cont=sed-manipular-texto-basico-1

        # |   Orden  |   Descripción                                                                |
        # |----------|------------------------------------------------------------------------------|
        # |   a      |   append: añade a las líneas seleccionadas una o más líneas más              |
        # |   c      |   change: reemplaza las líneas seleccionadas por un nuevo contenido          |
        # |   d      |   delete: borra las líneas seleccionadas                                     |
        # |   g      |   get: copia el contenido del hold space al pattern space                    |
        # |   G      |   GetNewline: añade el contenido del hold space al pattern space             |
        # |   h      |   hold: copia el contenido del pattern space al hold space                   |
        # |   H      |   HoldNewLine: añade el contenido del pattern space al hold space            |
        # |   i      |   insert: inserta una o más líneas antes de las líneas seleccionadas         |
        # |   l      |   listing: muestra todos los caracteres no imprimibles                       |
        # |   n      |   next: cambia a la siguiente orden de la línea siguiente del comando        |
        # |   p      |   print: muestra las líneas seleccionadas                                    |
        # |   q      |   quit: finaliza el comando SED de Linux                                     |
        # |   r      |   read: lee las líneas seleccionadas de un archivo                           |
        # |   s      |   substitute: reemplaza una determinada cadena de caracteres por otra        |
        # |   x      |   xchange: intercambia el pattern space y el hold space entre sí             |
        # |   y      |   yank: sustituye un determinado carácter por otro                           |
        # |   w      |   write: escribe líneas en el archivo de texto                               |
        # |   !      |   Negation: aplica el comando a las líneas que no coinciden con la entrada.  |

                    # :::::::::::::::::::::::::::::::::
                    #::::: sintaxis con ordenes:::::

                    # (imprime contenido al no pasarme una  orden)
                    # sed '' demo.php  

                    # (imprime la primera linea)
                    # sed -n '1p' demo.php 

                    # (imprime la primera linea del 1 al 5)
                    # sed -n '1,5p' demo.php 

                    # sed 's/texto_a_buscar/texto_a_reemplazar/' <fichero_a_reemplazar >fichero_nuevo
                    # echo "texto" | sed 's/texto_a_buscar/texto_a_reemplazar/'





    # sed : Parte del comando que llama a Sed
    # ' ': Dentro de las comillas verticales es donde introducimos el texto a buscar y el texto a reemplazar.

    # / / /: Las barras inclinadas también se conocen como delimitadores. Dentro del primer delimitador incluimos la cadena de texto a buscar y dentro del segundo la cadena de texto que reemplaza a la que estamos buscando.

    # 's/texto_a_buscar/texto_a_reemplazar/': s indica que queremos buscar y reemplazar. La parte del comando texto_a_buscar tiene que ser reemplazada una palabra, letra, cadena de caracteres o expresión regular que defina las partes de texto que queremos reemplazar. En texto_a_reemplazar tenemos que poner el texto que reemplazará el texto que queremos modificar.

    # <fichero_a_reemplazar: Es nombre del fichero en que se buscan las partes de texto a modificar.
    
    # >fichero_nuevo : Es un nuevo fichero que se generará con el texto reemplazado.


```


### ejemplo simple:

```shell
echo "Welcome to LikeGeeks page" | sed 's/page/website/'
```

### Reemplazo multiple
```shell
echo "Welcome to LikeGeeks aaa 111" | sed -e 's/aaa/bbb/' -e 's/111/222/'
```

# Agrupaciones
-- ----

### ejemplo 1
```shell
echo "foobarbaz" | sed -r 's/^foo(.*)baz$/\1/'
    # poner barras si hay que ponerlas
    # echo "foobarbaz" | sed 's/^foo\(.*\)baz$/\1/'
```


### ejemplo 2
```shell
echo "foobarbaz" | sed -r 's/^foo(.*)b(.)z$/\2 \1 \2/'
```


### este cambia una ruta windows a linux 
ejemplo:  C:\Users\Cesar  => /C/Users/Cesar
```shell
echo "C:\Users\Cesar"  | sed -r -e 's/^([a-zA-Z])+:\\(.*)$/\/\1\/\2/' | sed -e 's/\\/\//g'
# /C/Users/Cesar
```


## 1. ejemplo sustitucion
cambia la primera coincidencia que encuentre
```shell
sed 's/1879/2000/' demo2.txt
```

### cambia la primera coincidencia que encuentre g global cambiara todo
```shell
sed 's/1879/2000/g' demo2.txt
```

## 2. eliminar coincidencia

```shell
#--Quita el coincidencia con el comodin d (delete)
sed '/1879/d' demo2.txt
```





### 3 eliminar coincidencia ya reemplazando el fichero original
```shell
# -i le dice modifica el fichero
sed -i 's/1879/2000/g' demo2.txt
```

### expresion regular tambien se usa
```shell
#aqui le digo qeu elimine todos las lineas en blanco espacios
sed '/^$/d' demo2.txt
```



## IMPORTANTE PARA MANTENER UN BACKUP CREAMOS UNO DIFERENTE
```shell
# reemplazara el texto 1879=>2000
# creara un archivo demo2.txt.back antes de modificar
sed -i.back 's/1879/2000/g' demo2.txt
```


### Reemplazar archivo de ssl
esto sirve para modificar y habilitar el certificado ssl de apache
file `/etc/apache2/sites-available/default-ssl.conf`
```shell

# reemplazamos :
# SSLCertificateFile /etc/ssl/certs/ssl-cert-snakeoil.pem
# a
# SSLCertificateFile /etc/ssl/certs/mycert.crt
sed -i '/SSLCertificateFile.*snakeoil\.pem/c\SSLCertificateFile \/etc\/ssl\/certs\/mycert.crt' /etc/apache2/sites-available/canvas.cesar.com.conf-ssl.conf 

# reemplazamos :
# SSLCertificateFile /etc/ssl/private/ssl-cert-snakeoil.key
# a
# SSLCertificateFile /etc/ssl/private/key.crt
sed -i '/SSLCertificateKeyFile.*snakeoil\.key/cSSLCertificateKeyFile /etc/ssl/private/mycert.key\' /etc/apache2/sites-available/canvas.cesar.com.conf-ssl.conf

```

