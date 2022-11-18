# configuracion de session manager aws

## 1. creacion de rol en IAM

<img width="90%" src="https://i.imgur.com/5mIUYNj.png" alt="My cool logo"/>

-- --

<img width="90%" src="https://i.imgur.com/kjrxkHf.png" alt="My cool logo"/>

-- --
aqui agregamos **Permissions policies** `AmazonSSMManagedInstanceCore`

<img width="90%" src="https://i.imgur.com/wQVhBf5.png" alt="My cool logo"/>

-- --

Le ponemos el nombre  al rol:`EC2RoleSSM`

<img width="90%" src="https://i.imgur.com/s6Cagc0.png" alt="My cool logo"/>

-- --

## Ya creado lo agregaremos una Nueva instacia EC2
- Sin AccesKey
- Sin security Groups
- en **IAM instance profile** agregaremos el rol :`EC2RoleSSM`



<img width="90%" src="https://i.imgur.com/tG2n2oL.png" alt="My cool logo"/>

-- --

### una vez ya  creado Entramos  al servicio de Session manager

<img width="90%" src="https://i.imgur.com/g1O4miS.png" alt="My cool logo"/>

-- --

<img width="90%" src="https://i.imgur.com/AINfvIv.png" alt="My cool logo"/>

-- --

ya  aqui encontraremos las intancias asociadas qeu tienen session manager

<img width="90%" src="https://i.imgur.com/yufAKXW.png" alt="My cool logo"/>

-- --

# Agregar instanca existena al Rol Session Mamanger
Editar la instancia  `Actions/Security/Modify IAM role`

<img width="90%" src="https://i.imgur.com/8uidJlP.png" alt="My cool logo"/>

-- --

<img width="90%" src="https://i.imgur.com/ANThuBO.png" alt="My cool logo"/>

-- --


## Ojo Lo mas usual es entrar Directamente

<img width="90%" src="https://i.imgur.com/WYTMxSQ.png" alt="My cool logo"/>

-- --




