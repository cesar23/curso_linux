# Ojo aun no funciona en Digital ocean

# autenticacion por clave privada open ssh

como lo tenemos actualmente. esta conexion por clave de usuario

<img width="100%" src="https://i.imgur.com/HJmnHhl.png" alt="My cool logo"/>

# 1. entrar al server y generar las llaves con 
```shell
ssh-keygen
```
<img width="90%" src="https://i.imgur.com/Ub7GAf9.png" alt="My cool logo"/>

ahora copiaremos la clave publica del mismo servidor a los `authorized_keys`
```shell
# primero miramos el contenido
cat ~/.ssh/authorized_key

#:::: si no existe lo crearemos
    #   sudo touch ~/.ssh/authorized_key
    
# ahora copiamos la clave privada a los authorizados del mismo servidor
sudo cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_key
```
<img width="90%" src="https://i.imgur.com/gaq1eXO.png" alt="My cool logo"/>

# 2. descargamos la clave privada del servidor

```shell

scp "root@159.223.136.52:~/.ssh/id_rsa" "/d/keys"
```
<img width="90%" src="https://i.imgur.com/O3uiNDq.png" alt="My cool logo"/>

# 3. ahora  configuraremos el servidor ssh para que ya no acepte autenticaciones por contrase;a

```shell
sudo cp /etc/ssh/sshd_config /etc/sshd_config.bak
sudo nano /etc/ssh/sshd_config
```
modificar las isguentes lineas
```shell
PasswordAuthentication no
```
ahora reiniciamos el server
```shell
sudo systemctl reload sshd.service
```

<img width="90%" src="https://i.imgur.com/HzanVbD.png" alt="My cool logo"/>

-- -

<img width="90%" src="https://i.imgur.com/BCU543e.png" alt="My cool logo"/>



# 4. Probar ahora
si entramos  ahora  nos  saldra  este  mensaje

<img width="90%" src="https://i.imgur.com/iQyJIap.png" alt="My cool logo"/>

```shell
ssh -i /d/id_rsa root@159.223.136.52
```
