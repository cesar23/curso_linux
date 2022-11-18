#tcpdump -i ens160 -c 5
#comandos : https://searchenterprisedesktop.techtarget.com/tip/WinDump-The-tcpdump-tool-for-Windows
#comandos : https://www.youtube.com/watch?v=uxmd8H9mbLI


# 1. filtrar paquetes por red
tcpdump -i ens33
#-------------------------------------------------------------------------------
#demo salida
#-----------------------------------------------------

#  09:34:32.666891 IP ubuntu.36705 > cj-in-f93.1e100.net.443: UDP, length 43
      # 09:34:32.666891 =>  hora de peticion
      # IP => tipo de peticion
      # ubuntu.36705 => (origen de la peticion)host y puerto de peticion desde donde se hizo
      # > => indica que esta saliendo desde
      # cj-in-f93.1e100.net.443: UDP => hacia donde salio es su destino


# 2. filtro de manera  agil
tcpdump -nn
#Consultar las interfaces de red sobre las que monitorear
tcpdump -D

#Capturar paquetes que van por la red inalámbrica
tcpdump -nS -i wlan0

#Capturar paquetes que van por la red inalámbrica
tcpdump -nS -i wlan0

#Capturar paquetes que van por cualquier interfaz de red
tcpdump -v -i any

#Capturar los paquetes con destino al puerto 8080
tcpdump dest port 8080

#Capturar los paquetes con destino o origen al puerto 8080
tcpdump port 8080

#Capturar los paquetes de la interfaz eth1 por el puerto 8080
tcpdump -ni eth1 port 8080

#Capturar los paquetes con la ID origen sea 192.168.120.1
tcpdump src host 192.168.120.1

#Capturar los paquetes cuya red destino sea la indicada
tcpdump dst net 192.168.1.0

#Capturar los paquetes cuya ip origen o destino sea la indicada
tcpdump host 192.168.1.1

#Capturar los paquetes que vaya a la máquina cuya dirección MAC es 0:45:a5:ab:ac:32
tcpdump ether host 0:45:a5:ab:ac:32

#Capturar los paquetes de la interfaz eth0 y el protocolo TCP
tcpdump -i eth0 tcp

#Capturar  todas las redes los puertos
tcpdump -i any 'udp port 80 or tcp port 443'

#Todos lospaquetes con el puerto 80 en origen o destino:
tcpdump -nn -i eth0 -vv port 80

#Todos los paquetes que no contengan el puerto 80 en el header de transporte:
tcpdump -nn -i eth0 -vv not port 80

#Todos los paquetes cuyo puerto de transporte no esté en el rango 50-150:
tcpdump -nn -i eth0 -vv not portrange 50-150

#Todos los paquetes cuyo host origen en el header de red sea 192.168.2.10:
tcpdump -nn -i eth0 -vv src host 192.168.2.10

#Todos los paquetes cuyo host destino en el header de red sea 192.168.2.10:
tcpdump -nn -i eth0 -vv dst host 192.168.2.10

#Todos los paquetes cuyo host en el header de red sea 192.168.2.10, tanto en origen como en destino:
tcpdump -nn -i eth0 -vv host 192.168.2.10

#Todos los paquetes que no sea destinado ni originado en el host 192.168.2.10:
tcpdump -nn -i eth0 -vv not host 192.168.2.10

#Todos los paquetes con origen o destino al host 192.168.2.10 y el puerto 443 en origen o destino:
tcpdump -nn -i eth0 -vv host 192.168.2.1 and port 443

#Todos los paquetes cuyo tamaño sea mayor a 850 bytes:
tcpdump -nn -i eth0 -vv greater 850

# esta opción equivale a "len >=850"
#Todos los paquetes cuyo tamaño sea menor a 850 bytes:
tcpdump -nn -i eth0 -vv less 850

# esta opción equivale a "len <=850"
#Todos los paquetes cuyo tamaño sea mayor a 850 bytes, y originados en 192.168.2.10:
tcpdump -nn -i eth0 -vv less 850 and src host 192.168.2.10

#Todos los paquetes con un tamaño en el rango de 500B y 1200B:
tcpdump -nn -i eth0 -vv greater 500 and less 1200

#Todos los paquetes de mas de 100B cuyo origen sea o google.com.ar o microsoft.com
# (note el backslash para escapar los paréntesis que obligan a analizar el OR antes que el AND):
  # NOTA: en este caso tcpdump resolverá los nombres de dominio en el momento de lanzar el comando,
  # y solamente nos mostrará los paquetes relacionados con dichas direcciones ip. Esto posibilitaría
  # que sigan pasando paquetes hacia google o microsoft que no veamos en tcpdump puesto que estos
  # dominios resuelven a varias direcciones ip diferentes, y solo consideraremos una en la captura de tcpdump.

tcpdump -nn -i eth0 -vv greater 100 and (src host google.com or src host microsoft.com)


#capturar solo TCP
tcpdump tcp
tcpdump src host google.com


 46.105.204.6

 tcpdump -vv src host 46.105.204.6 -A

 windump tcp and 'src host 46.105.204.6'
