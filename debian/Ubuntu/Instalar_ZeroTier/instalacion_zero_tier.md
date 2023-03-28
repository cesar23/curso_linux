# instlar zero tier

### 1. instalando
```shell
sudo apt install curl -y
curl -s https://install.zerotier.com | sudo bash
```
If you have GPG installed, a more secure option is available:

```shell
curl -s 'https://raw.githubusercontent.com/zerotier/ZeroTierOne/master/doc/contact%40zerotier.com.gpg' | gpg --import && \
if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
```
### 2.Unir el equipo a la VPN

Una vez completada la instalación, estamos listos para unir el equipo a la red ZeroTier One que creamos en el primero de los artículos de esta serie. Para lograrlo, escribiremos una orden como la siguiente:

```shell
# agregar mi red solusystem
sudo zerotier-cli join b6079f73c6b60cc8
```
<img width="100%" src="https://i.imgur.com/oMgXH56.png" alt="My cool logo"/>

-- -- 


Probaremos la conexion con otra pc en la red
```shell
ping 192.168.200.223
```

<img width="100%" src="https://i.imgur.com/y9JmnPz.png" alt="My cool logo"/>

-- -- 
