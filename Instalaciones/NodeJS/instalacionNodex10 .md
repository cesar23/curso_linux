# Intalacion de NodeJS Ubuntu


fuente: [enlace en línea](https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/)

## 1. Repositorios
### Para  la version 10
``` ssh
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -
```
### Para  la version 8
``` ssh
curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
```


## 2. Instalacion
``` ssh
sudo apt-get install nodejs
```

## 3. Verificacion
Verifique que Node.js y npm se instalaron correctamente al imprimir sus versiones:
``` ssh
# node --version
v10.13.0
```

``` ssh
# npm --version
6.4.1
```
## 4. Despues de la instalacion !Importante
Ojo en linux instalar siempre despues

``` ssh
sudo apt-get install -y build-essential python
sudo npm install -g node-gyp
sudo npm install -g nodemon
```


Para evitar problemas de instalacion de paquetes especialmente en mcryp
``` ssh
sudo chown -R cesar:cesar ~/.npm
sudo chown -R cesar:cesar ~/.config
npm install bcrypt
```

