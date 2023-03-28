sleep 30
pkill -9 nginx   &&  nginx -c /etc/nginx/nginx.conf &&  nginx -s reload
