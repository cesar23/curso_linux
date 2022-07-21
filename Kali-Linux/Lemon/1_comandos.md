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
```

2 - Descargar L3MON
3 - Posicionarse en el directorio de L3MON
4 - npm install
5 - comandos para iniciar L3MON pm2: (pm2 start index.js, pm2 startup)
6 - detener L3MON para configurar el usuario y contraseña: (pm2 stop index)
7 - configurar usuario y contraseña:(nano maindb.json)
8 - iniciar demonio de L3MON(pm2 restart all)
9 - entrar en la ip local de la maquina:( http://<SERVER IP>:22533)
