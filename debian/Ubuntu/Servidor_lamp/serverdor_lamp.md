# instalaciond e servidor lamp

## Paso 1: Instalar Apache

```shell
sudo apt update
sudo apt install apache2
```

###3 habilitar firewall

```shell
sudo ufw allow in "Apache"
sudo ufw allow 80
sudo ufw allow 443
# iniciar
sudo ufw status
sudo ufw enable

# por purrerto habilitar por  rango 6000-6007, 
sudo ufw allow 6000:6007/tcp
sudo ufw allow 6000:6007/udp

```
## Paso 2: Instalar MySQL


Instalar
```shell
sudo apt install mysql-server -y
```

configurar
```shell
sudo mysql_secure_installation
```
Elija `Y` para indicar que sí, o cualquier otra cosa para continuar sin la habilitación.


### PASO 3: instalar php
```shell
sudo apt install php libapache2-mod-php php-mysql -y
```
