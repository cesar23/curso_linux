# correr comando de manera remota
```shell
ssh cesar@192.168.0.40 'mkdir peru'
```


# correr comando de manera remota como sudo
```shell
ssh -t cesar@192.168.0.40 'cd /home/cesar/docker/www && sudo chmod 777 -R *'
```