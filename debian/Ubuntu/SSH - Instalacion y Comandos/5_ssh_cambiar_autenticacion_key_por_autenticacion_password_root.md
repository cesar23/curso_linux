# cambiar autenticacion key por autenticacion por password

### 1. authenticar 
Login to AWS instances
```shell
 ssh -i "cauris_sa-east-1.pem" root@15.229.87.21
 ssh -i "/drives/D/cmder/aws/cauris_sa-east-1.pem" ubuntu@54.232.70.94
```

### 🟡🟢 Configurar password para el usuario
Configure una contraseña para el usuario usando el comando `passwd` junto con el nombre de usuario .
```shell
sudo passwd ubuntu
sudo passwd root
```

### 2. Editar el archivo de configuraciond e SSH
edite `sudo vim -c "set number" /etc/ssh/sshd_config`

- Busque la línea que contiene el parámetro `PasswordAuthentication` y cambie su valor de 'no' a 'yes'

```shell
# PasswordAuthentication no
PasswordAuthentication yes
```

Si desea configurar el inicio de sesión **`root`** , busque  el parámetro 'PermitRootLogin' y cambie su valor de 'prohibit-password' a 'yes'
```shell
PermitRootLogin yes
```

### 3. Reinicar Servicio
````shell
service ssh restart   ## for ubuntu

service sshd restart  ## for centos
````

### 4. logearse
```shell 
ssh  ubuntu@54.232.70.94
ssh  ubuntu@54.232.70.94
```