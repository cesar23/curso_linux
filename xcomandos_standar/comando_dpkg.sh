https://linuxhint.com/ubuntu_dpkg_installation/
https://www.youtube.com/watch?v=7g9cD69XRf8

https://linuxhint.com/ubuntu_dpkg_installation/
#------------------------------------------------
# 1 . Ver si hay  problemas de dependencias
#-----------------------------------------------
apt check

# si hay problemas de bloqueo de instalacion como el siguiente  mensaje
        # : Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
        # E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?


# #------>>>> eliminar  todos  los  bloqueos
# sudo rm /var/lib/apt/lists/lock
# sudo rm /var/cache/apt/archives/lock
# sudo rm /var/lib/dpkg/lock
# #-------->>> Después de eso, reconfigure los paquetes:
# sudo dpkg --configure -a


#-----------------------------------------------
# 2-  descargar y  instalar  SKYPE paquete  deb
#-----------------------------------------------

wget https://repo.skype.com/deb/pool/main/s/skypeforlinux/skypeforlinux_8.71.76.31_amd64.deb
sudo chmod +x skypeforlinux_8.71.76.31_amd64.deb

sudo dpkg --install skypeforlinux_8.71.76.31_amd64.deb

    #### Posible Error ######
    # El comando dpkg instala el paquete especificado solo sin dependencias. En caso de que esté instalando 
    # un paquete que requiera algunas dependencias, recibirá un error como este:
    dpkg: error processing package

    # Además, dpkg no instalará el paquete y lo dejará en un estado no configurable y roto.

    # 2.1 Para resolver este error, ejecute el siguiente comando en la Terminal:
        # esto hara que las dependencias que se requieren para  est e paquete 
        # se descarguen e  instalen
        sudo apt -f instalar
#-----------------------------------------------
# 3. ves  estado de instalacion de paquete
#-----------------------------------------------

    # buscar si no sabes el nombre
        # dpkg --status | grep skype
dpkg --status skypeforlinux


#-----------------------------------------------
# 4. REMOVER  PAQUETES
#-----------------------------------------------

    # buscar  paquete
    dpkg -l | grep skype

    # quitar o  desinstalar paquete
    sudo dpkg --remove skypeforlinux
    #purgar y eliminar configuracion de paquete
    sudo dpkg --purge skypeforlinux

    # ver  estado si ya  se  elimino
    dpkg --status skypeforlinux




#-----instalando teamweaver

wget https://download.teamviewer.com/download/linux/teamviewer_amd64.deb

sudo dpkg -i teamviewer*.deb

#Hecha la instalación muy posiblemente nos pida configurar algunas dependencias para la correcta ejecución de TeamViewer en nuestro equipo para ello solamente ejecutamos sobre la terminal:


sudo apt-get install -f