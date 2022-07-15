#fuente: https://ubunlog.com/instala-las-herramientas-de-kali-linux-en-ubuntu-18-10-con-katoolin/
!sudo apt-get -y update
#Ahora instalamos el paquete que nos instala paquetes esenciales:
!sudo apt-get install -y build-essential
!sudo apt-get -y install libmms0 libc-ares2 libc6 libcrypto++6 libgcc1 libmediainfo0v5 libpcre3 libpcrecpp0v5 libssl1.1 libstdc++6 libzen0v5 zlib1g apt-transport-https
!sudo apt-get -y install tree
#instalar utilidades
!sudo apt-get -y install util-linux
!sudo apt-get -y install tree
!sudo apt-get -y install vim

#descargara y ejecutar curl
!sudo apt-get -y install curl
#nos da comandos basicos d como ifconfig
!sudo apt-get -y install net-tools
#una mejor herramienta de top de linux paar ver procesoss
!sudo apt-get -y install htop
#iftop, vigila el consumo de ancho de banda de tu red en tiempo real
!sudo apt-get -y install iftop
!sudo apt-get -y install nmap
!sudo apt-get -y install mlocate
!sudo apt-get -y install iotop
!sudo apt-get -y install git python
#realizar  busquedas  rapidas
!sudo apt-get -y install mlocate


#para  comprimir y desconprimir
!sudo apt-get install -y p7zip-full p7zip-rar zip unzip rar unrar



#- Actualiza las aplicaciones y paquetes instalados a su última versión.
!sudo apt-get -y upgrade

##------------------------------------------------------
##--------------------- herramientas kali linux--------------------
##------------------------------------------------------

