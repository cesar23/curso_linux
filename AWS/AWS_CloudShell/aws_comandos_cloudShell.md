## preguntar quien soy
```shell
aws sts  get-caller-identity
# output:
#     [cloudshell-user@ip-10-0-9-177 ~]$ aws sts  get-caller-identity
#     {
#         "UserId": "AIDATVYF7BF4UJG2D4BOO",
#         "Account": "252878719353",
#         "Arn": "arn:aws:iam::252878719353:user/cauris"
#     }  

```

## ver paquetes instalados
```shell
# -------------------------------------------
# Version de python
# -------------------------------------------
[cloudshell-user@ip-10-0-9-177 ~]$  python --version
# Python 2.7.18
[cloudshell-user@ip-10-0-9-177 ~]$ python3 --version
# Python 3.7.10

# -------------------------------------------
# Version de NodeJs
# -------------------------------------------
[cloudshell-user@ip-10-0-9-177 ~]$ node --version
# v16.17.0
[cloudshell-user@ip-10-0-9-177 ~]$ npm --version
# 8.15.0
```

# Ingresar a una  instancia Ec2
previamente configuradoi la instancia el ejemplo mio en : 💻  `aws_comandos_cloudShell.md`

Mi EC2 a conectar:  `i-05e1ca8d4353d50a5`

<img width="90%" src="https://i.imgur.com/zYL9sUI.png" alt="My cool logo"/>

-- --

### instalaremso un Plugin de session amanger para ala consola 
- https://docs.aws.amazon.com/es_es/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html

```shell
# :::1 descargar
curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/linux_64bit/session-manager-plugin.rpm" -o "session-manager-plugin.rpm"
# :::2 instalar
sudo yum install -y session-manager-plugin.rpm
```

ahora  ingresamos el comnado desde la misma zona de disponibilidad

```shell
aws ssm start-session --target  i-05e1ca8d4353d50a5

# ya dentro ingresamos  como root
sudo -i

```
<img width="90%" src="https://i.imgur.com/p2MtWYQ.png" alt="My cool logo"/>

-- --
<img width="90%" src="https://i.imgur.com/T5CJMoN.png" alt="My cool logo"/>

-- --

#
