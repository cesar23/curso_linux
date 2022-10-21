echo '' > delete_me.sh
echo 'currentscript="$0"'  >> delete_me.sh
echo '' >>delete_me.sh
echo '# Function that is called when the script exits:' >>delete_me.sh
echo 'function finish {' >>delete_me.sh
echo 'echo $(date +'%Y-%m-%d_%H-%M-%S')' >>delete_me.sh 
echo 'echo $(date +'%Y-%m-%d_%H-%M-%S') > salida.txt' >>delete_me.sh
echo '# shred -u  ::: esto es un comando para  eliminado pero se obiara si no esta instalado' >>delete_me.sh
echo '#echo "Securely shredding ${currentscript}"; shred -u ${currentscript};' >>delete_me.sh
echo 'echo "Securely shredding ${currentscript}";' >>delete_me.sh 
echo 'sleep 3' >>delete_me.sh
echo '}' >>delete_me.sh
echo '' >>delete_me.sh
echo '# When your script is finished, exit with a call to the function, "finish":' >>delete_me.sh
echo 'trap finish EXIT' >>delete_me.sh
echo 'rm --  "$( readlink -f -- "${BASH_SOURCE[0]:-$0}" 2> '/dev/null'; )";' >>delete_me.sh


echo 'server { ' > /etc/nginx/sites-available/cesar.peru.com.conf
echo '        listen 80; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        listen [::]:80; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo ' '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        root /var/www/cesar.peru.com/html; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        index index.html index.htm index.nginx-debian.html; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo ' '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        server_name cesar.peru.com www.cesar.peru.com; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo ' '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        location / { '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '                try_files $uri $uri/ =404; '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '        } '>> /etc/nginx/sites-available/cesar.peru.com.conf
echo '} '>> /etc/nginx/sites-available/cesar.peru.com.conf
