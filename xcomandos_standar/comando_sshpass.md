# setear password en la terminal sin confirmacion de pass

fuentes:
- https://www.youtube.com/watch?v=Jer7uJVpuYk
- https://blog.desdelinux.net/envia-el-password-de-ssh-en-la-misma-linea-con-el-paquete-sshpass/


## instalacion
```shell
sudo apt-get install sshpass
```


## uso con ssh directo
```shell
sshpass -p 'cesar203' ssh cesar@192.168.0.60
```

## con variable
```shell
export SSHPASS='cesar203'
echo $SSHPASS
sshpass -e ssh cesar@192.168.0.60 'df -h' 
```

## Con SCP
```shell
# ------- Transfer Files Using SCP ------- 
$ scp -r /var/www/html/example.com --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/var/www/html

------- Backup or Sync Files Using Rsync -------
$ rsync --rsh="sshpass -p 'my_pass_here' ssh -l aaronkilik" 10.42.0.1:/data/backup/ /backup/
```