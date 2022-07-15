
#-----------------------------------------------------------
#---------------- tras instalar ubuntu - crera un archivo
#-------------------------------------------------------------

crear un archivo y ingresa  todo eso ejemplo 
touch comandos.sh &&sudo chmod +x comandos.sh



 
sudo apt-get -y update 
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
#realizar  busquedas  rapidas
sudo apt-get -y install mlocate


#para  comprimir y desconprimir
sudo apt-get install -y p7zip-full  zip unzip rar unrar

#- Actualiza las aplicaciones y paquetes instalados a su última versión.
sudo apt-get -y upgrade 


#ver puertos abiertos:
netstat -lntu


#COMPRIMIENDO 
    #normal 
     7z a paquete-comprimido archivo-a-comprimir
    #por volumen de 250m
     7z  a -r -v250M hirend.7z Hiren.BootCD.15.2.iso
    #Extraer
     7z e paquete-comprimido.7z