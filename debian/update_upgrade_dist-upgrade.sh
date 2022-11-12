
✅  #----- (obligatorio) actualiza la lista de paquetes disponibles y sus versiones, pero no instala o actualiza ningún paquete. Esta lista la coge de los servidores con repositorios que tenemos definidos en el sources.list.
sudo apt-get update
        #----------------------------------------------------------
        # -----Interpretacion de salida
        #----------------------------------------------------------
             😎 # --- Hit => Explica que no hay  cambios en los  paquetes
             Hit:1 http://pe.archive.ubuntu.com/ubuntu focal InRelease

             😎 # --- GET => Explica que hay nuevos paquetes
             Get:2 http://pe.archive.ubuntu.com/ubuntu focal-updates InRelease [114 kB]
             
             😮 # --- IGN => Explica hayq  paquetes  ignorado
             Ign:18 http://pe.archive.ubuntu.com/ubuntu focal-updates/universe amd64 DEP-11 Metadata

             🤬 # --- Err => paquetes que no  se  encotraron
             Err:22 http://pe.archive.ubuntu.com/ubuntu focal-updates/multiverse amd64 DEP-11 Metadata

                            #verificar (/etc/apt/sources.list and /etc/apt/sources.list.d/*.list)




        #Casi  siempre  se  luege  utilizar 
        sudo apt-get update -y && sudo apt-get upgrade -y

✅🙄 #------ (habitual) una vez el comando anterior ha descargado la lista de software disponible y la versión en la que se encuentra, podemos actualizar dichos paquetes usando este comando: apt-get upgrade. Instalará las nuevas versiones respetando la configuración del software cuando sea posible (esta es la maravilla de este tipo de sistemas).
sudo apt-get upgrade


✅✅ #------ (recomendado ya que  limpiar  inecesarios) Eliminarran paquetes inecesario despues de  ejecutar (apt-get upgrade)
sudo apt autoremove
         #Casi  siempre  se  luege  utilizar 
        sudo apt update && sudo apt upgrade && sudo  apt autoremove -y



#------------------------------------------------------------------------------------------------
#--------- Proceso de actualización de Ubuntu 18.04 LTS y Ubuntu 19.10 a Ubuntu 20.04 LTS
#------------------------------------------------------------------------------------------------

😨👀 #--------  Mira  tu  version actual de linux
lsb_release -a

✅ #------ (recomendado despues de instalar el ubuntu) despues de hacer un update, si ejecutas el comando (dist-upgrade) instalarás o eliminarás los paquetes de forma inteligente, según sea necesario, para completar la actualización. Apt dist-upgrade tiene un sistema inteligente de resolución de conflictos, por lo que intentará actualizar los paquetes más importantes, a expensas de aquellos considerados menos importantes
sudo apt-get dist-upgrade




🍺 #------- (poco habitual) El comando do-release-upgrade, por otro lado, es responsable de actualizar de una versión a otra. Así que si quieres actualizar de Ubuntu 18.10 a 19.04, utiliza la opción do-release-upgrade.
sudo apt-get do-release-upgrade



🧧 #---------- (cuidado) Como hemos avanzado (No recomendado), se trata de otra manera de llamar a la anterior o viceversa. Ambas opciones eliminarán paquetes que se han instalado automáticamente si necesitan solucionar conflictos en las actualizaciones de dependencias de los paquetes.
sudo apt-get full-upgrade