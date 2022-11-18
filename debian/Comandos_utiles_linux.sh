sudo apt-get -y update 
sudo apt -y  dist-upgrade
#Ahora instalamos el paquete que nos instala paquetes esenciales:
sudo apt-get install -y build-essential


#instalar utilidades
sudo apt-get -y install util-linux 
sudo apt-get -y install tree
sudo apt-get -y install vim

#descargara y ejecutar curl
sudo apt-get -y install curl 
#nos da comandos basicos d como ifconfig
sudo apt-get -y install net-tools 
#una mejor herramienta de top de linux paar ver procesoss
sudo apt-get -y install htop
#iftop, vigila el consumo de ancho de banda de tu red en tiempo real
sudo apt-get -y install iftop
sudo apt-get -y install nmap
sudo apt-get -y install mlocate
sudo apt-get -y install iotop
#realizar busquedas rapidas
sudo apt-get -y install mlocate


#para comprimir y desconprimir
sudo apt-get install -y p7zip-full p7zip-rar zip unzip rar unrar



#- Actualiza las aplicaciones y paquetes instalados a su última versión.
sudo apt-get -y upgrade 


#ver puertos abiertos:
```
netstat -lntu
```


#COMPRIMIENDO 7z
  #-------------normal
  #para archivos solos
    7z a paquete-comprimido archivo-a-comprimir
  #para carpetas
    7z a -r factu.7z /var/www/factugsp/
  #para carpetas en modo ultra (opcional da casi lo mismo)
    7z a -r -t7z -m0=lzma2 -mx=9 -mfb=64 -md=1024m -ms=on factu_ultra.7z /var/www/factugsp/
 
 
  #por volumen de 250m (opciones)
    7z a -r -v250M hirend.7z Hiren.BootCD.15.2.iso
 #-------------Extraer
    7z e paquete-comprimido.7z


# COMPRIMIENDO ZIP
    #comprimir
```
     zip -r directorio-comprimido.zip /home/usuario
     #descomprimir
     unzip  directorio-comprimido.zip

```



#COMPRIMIENDO TAR.GZ
  Para comprimir ficheros en formato tar.gz, se utiliza el siguiente comando:

  tar -czvf empaquetado.tar.gz /var/www/factugsp/

  tar -czfv archivo.tar.gz ficheros

   -c : indica a tar que cree un archivo.
    -z : indica que use el compresor gzip
    -f : indica a tar que el siguiente argumento es el nombre del fichero.tar
    -v : indica a tar que muestre lo que va empaquetando

 Para descomprimir ficheros con extensión tar.gz, se usa el siguiente comando:

  tar -xzvf archivo.tar.gz

   -x : le dice a tar que extraiga el contenido del fichero tar.gz
    -z : le indica a tar que esta comprimido con gzip
     -v : va mostrando el contenido del fichero
    -f : le dice a tar que el siguiente argumento es el fichero a descomprimir.
