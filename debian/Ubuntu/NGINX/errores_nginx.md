# Posibles errores en nginx

### problema 1

<img width="100%" src="https://lh4.googleusercontent.com/AKgLCWxON1iCessDNgorYedsuejmtmVeQ1rfHNEDB8wgkyULcBOmCx60gHwxVt2fmSU" alt="My cool logo"/>

-- -- 


```shell
root@ip-172-31-33-216:~# pkill -9 nginx   &&  nginx -c /etc/nginx/nginx.conf &&  nginx -s reload
nginx: [emerg] bind() to 0.0.0.0:80 failed (98: Address already in use)
nginx: [emerg] bind() to [::]:80 failed (98: Address already in use)
nginx: [warn] 10000 worker_connections exceed open file resource limit: 1024
```

##### soluciones
- https://serverfault.com/questions/640976/nginx-ulimit-worker-connections-exceed-open-file-resource-limit-1024
- 