
#--------------------------------------------------------------------------
#------------------------------ LESS      :busqueda de un fichero ---------
#--------------------------------------------------------------------------

#        Opciones
#        -c     Limpia la pantalla antes de mostrar
#        +n   Inicia el archivo desde el número dado
#        :p     Examina el archivo previo en la lista de línea de comandos
#        :d     Elimina el archivo actual de la lista de archivos
#        e     Adelante una línea (o N líneas).
#        -S     Deshabilitar auto-ajuste de líneas (las líneas largas serán visibles por navegación lateral).
#        -g      Solo se resalta la coincidencia actual de cualquier texto buscado.
#        -M    Mostrar datos de navegación
#        ng     Saltar a línea número n.
#        =     (signo igual) Información del archivo en curso.
#        h      Ayuda (help)
#        q      Salir

# Ejemplo:


# IMPORTANTE 
-M    #Mostrar datos de navegación

less /var/log/syslog #muestra el archivo syslog paginado.

less +N #visualiza números de línea.

less -p hola #busca y resalta apariciones de hola dentro de un archivo.

ccze -A < /var/log/syslog | less -R ídem. a less /var/log/syslog pero lo muestra coloriado.

less /var/log/syslog #y después pulsar Shift+f   muestra las últimas líneas del log /var/log/syslog en tiempo real (realiza una función similar a tail -f /var/log/syslog)

#--------buscar texto ya cuando esta mostrando el archivo
se puede buscar una cadena escribiendo /hola y buscará y resalta apariciones de hola, para buscar la siguiente aparición pulsar la tecla n.


#----------------------Buscar la primera  aparicion de busqueda con 
n #busca la siguiente aparicion
N #busca  al  anterior aparicion

#----------------------Buscar por linea
g+12 # resultado= :12
