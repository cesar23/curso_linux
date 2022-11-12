# instalacion de docker en ubuntu
Primero, actualice su lista de paquetes existente:

```shell
sudo apt update
```
A continuación, instale algunos paquetes de requisitos previos que permitan a apt usar paquetes a través de HTTPS:

```shell
sudo apt -y install apt-transport-https ca-certificates curl software-properties-common
```
Luego, añada la clave de GPG para el repositorio oficial de Docker en su sistema:

```shell
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```
Agregue el repositorio de Docker a las fuentes de APT:
```shell
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

```
A continuación, actualice el paquete de base de datos con los paquetes de Docker del repositorio recién agregado:

```shell
sudo apt update -y
```
Asegúrese de estar a punto de realizar la instalación desde el repositorio de Docker en lugar del repositorio predeterminado de Ubuntu:

```shell
apt-cache policy docker-ce
```

### Por último, instale Docker:

```shell
sudo apt -y install docker-ce
sudo apt -y install docker-compose 
```
Con esto, Docker quedará instalado, el demonio se iniciará y el proceso se habilitará para ejecutarse en el inicio. Compruebe que funcione:

```shell
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

```

# Adición de una cuenta de usuario a un grupo con acceso de usuario no raíz

1. Crear el grupo docker si no existe
```shell
sudo groupadd docker
```
2. Agregue su usuario al grupo docker.
```shell
sudo usermod -aG docker $USER
```
3. Inicie sesión en el nuevo grupo docker (para evitar tener que cerrar sesión/iniciar sesión nuevamente; pero si no es suficiente, intente reiniciar):
```shell
sudo newgrp docker
```
4. Check if docker can be run without root
```shell
$ docker run hello-world
```
