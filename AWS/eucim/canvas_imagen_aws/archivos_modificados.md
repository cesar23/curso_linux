# archivos de configuracion modificados

### archivos logs revisar
```shell
pkill -9 nginx   &&  nginx -c /etc/nginx/nginx.conf &&  nginx -s reload


tail -f /srv/canvas/current/log/production.log
tail -f /var/log/nginx/campuslocal.eucim.com-error.log
```