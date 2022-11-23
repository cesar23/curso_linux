fuente: https://www.youtube.com/watch?v=s42Kp1A_yUI

### Cómo compartir carpetas en Linux PASO a PASO

Para poder compartir carpetas en Linux (también aplica a los archivos) como primer medida <br>tenemos que contar con «Samba» ya instalado en el sistema.

Si no lo tenemos instalado abrimos una terminal y en ella escribimos el siguiente comando:

```shell
    sudo apt update
    sudo apt install samba
```

### agregamos al usuario root
```shell
sudo smbpasswd -a cesar
```

### 3. Revisamos que el servicio este corriendo sin problemas:
```shell
sudo systemctl status nmbd
```

Editamos el archivo de configuracion (vim, nano, gedit, etc)
```shell

cp /etc/samba/smb.conf /etc/samba/smb.conf.back
vim /etc/samba/smb.conf
```


```shell
[dir_home]
 comment = directorio home linux
 hosts allow = 127.0.0.1 192.168.0.0/24 
 delete readonly = yes
 read only = yes 
 writeable = yes
 path = /home
 browseable = yes
 force create mode = 0660
 force directory mode = 2770
 valid users = cesar,root
```
