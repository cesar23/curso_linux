
fuente: 
https://www.youtube.com/watch?v=_qERlTAah48
https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu#2004-



# ejeuctar  comando para  instalar
wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb


#instalar  el  sdk
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt   dist-upgrade  && \
  sudo apt-get install -y dotnet-sdk-5.0


sudo apt -y install dotnet-sdk-5.0


#-- comprobar instalacion
sudo dotnet --info


HOYMIA 

REF91F6361