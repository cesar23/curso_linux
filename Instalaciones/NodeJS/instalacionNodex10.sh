
Instalar node js en Ubuntu
fuente: https://linuxize.com/post/how-to-install-node-js-on-ubuntu-18.04/

mio: 
Instale Node.js desde el repositorio NodeSource (Oficial)
curl -sL https://deb.nodesource.com/setup_10.x | sudo bash -

sudo apt-get install nodejs

Verifique que Node.js y npm se instalaron correctamente al imprimir sus versiones:

node --version

v10.13.0

npm --version

6.4.1

Ojo en linux instalar siempre despues
>sudo apt-get install -y build-essential python

>sudo npm install -g node-gyp

>sudo apt-get install -y build-essential python
>sudo npm install -g nodemon

Para evitar problemas de instalacion de paquetes especialmente en mcryp
> sudo chown -R cesar:cesar ~/.npm
>sudo chown -R cesar:cesar ~/.config
>npm install bcrypt
