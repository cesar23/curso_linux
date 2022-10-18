# Informacion del server Canvas Lms

### version de ubuntu
```shell
root@ip-172-31-30-99:~# lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 20.04.3 LTS
Release:        20.04
Codename:       focal

```

### informacion de ruby
```shell
# ruby
root@ip-172-31-30-99:~# ruby --version
ruby 2.6.6p146 (2020-03-31 revision 67876) [x86_64-linux-gnu]

# ruby rails
root@ip-172-31-30-99:/srv/canvas/current# bundle show

```

### realizar un backup del server
```shell

cd /srv/canvas/current

tar -czvf canvas_back_002.tar.gz  * \
 --exclude=".git/*" \
 --exclude="node_modules/" \
 --exclude="log/"
 
 # descargar el servicio api
 cd /srv/canvas-rce-api
 
 tar -czvf canvas-rce-api.tar.gz  canvas-rce-api \
 --exclude=".git/*" \
 --exclude="node_modules/" \
 --exclude="log/"
```

Descargar backup
```shell
cd /drives/D/cmder/aws
# aqui descargar
scp -i "cauris_sa-east-1.pem" \
 "root@ec2-52-67-182-27.sa-east-1.compute.amazonaws.com:/srv/canvas/current/canvas_back_002.tar.gz" \
  "/drives/o/backup_canvas"
  
scp -i "cauris_sa-east-1.pem" \
 "root@15.229.87.21:/srv/canvas-rce-api.tar.gz" \
  "/drives/o/backup_canvas"
```

subir backup
```shell
cd /drives/D/cmder/aws
# aqui descargar

scp "/drives/o/backup_canvas/canvas_back_002.tar.gz" "cesar@192.168.0.63:/srv/canvas/current/"
scp "/drives/o/backup_canvas/canvas-rce-api.tar.gz" "cesar@192.168.0.63:/srv/canvas-rce-api/"

# ya en el server local
cd /srv/canvas/current/
tar -xzvf canvas_back_002.tar.gz
```
