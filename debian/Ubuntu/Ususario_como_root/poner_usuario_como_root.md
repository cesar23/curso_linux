# poner usuario como root

fuente: https://alexariza.net/tutorial/otorgar-permisos-de-root-a-un-usuario-nuevo-en-linux/


```shell
# ponemos  como admin al usuario cesar
sudo echo 'cesar ALL=(ALL:ALL) ALL' >> /etc/sudoers
```


## si no funcion  hacerlo de la  siguiente  manera

Otra opcion es hacerlo como root
y luego cuando realizemos el cambio  guardar los cambios con `:x!`

<img src="https://i.imgur.com/xSox82B.png" alt="My cool logo"/>

-- --
