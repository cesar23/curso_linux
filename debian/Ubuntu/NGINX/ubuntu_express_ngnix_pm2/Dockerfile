FROM node:14

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 5000

CMD [ "npm", "run", "dev"]




FROM node:10-alpine
# Crearemos el node_modules subdirectorio dentro del directorio /home/node junto con la aplicación para ayudar a simplificar los permisos para el código
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
# Luego establecerá el directorio de trabajo agregando la siguiente línea:
WORKDIR /home/node/app
COPY package*.json ./
# Antes de ejecutar npm install,
# agregue la siguiente línea para cambiar el usuario y node asegurarse de que todos los archivos y el node_modules
# directorio de la aplicación sean propiedad del usuario del nodo no raíz:
USER node
RUN npm install
# Una vez node_modules se haya instalado, agregue la siguiente Linea
# indicará a Docker que copie el código de la aplicación en el directorio de la aplicación
# en el contenedor con los permisos y la propiedad correctos, es decir, el usuario del nodo no raíz:
COPY --chown=node:node . .
# El último paso es exponer el puerto 8090 en el contenedor, como lo habíamos definido en nuestro index.js archivo de entrada:
EXPOSE 5000
CMD [ "npm", "run", "dev"]
