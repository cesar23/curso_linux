# instalacion nginx con certbot
fuente: https://certbot.eff.org/instructions?ws=nginx&os=ubuntufocal

video :https://www.youtube.com/watch?v=9nq7TZFHnm4&t=577s

# 1 Ensure that your version of snapd is up to date
asegurar la instalacion este  actualizada
```shell
sudo snap install core; sudo snap refresh core
```

# 2 .Remove certbot-auto and any Certbot OS packages
remover algunos repositorios instalados
```shell
sudo apt-get remove certbot
sudo dnf remove certbot
sudo yum remove certbot
```
# 3. Install Certbot
Run this command on the command line on the machine to install Certbot.

```shell
sudo snap install --classic certbot
```

# 4. Prepare the Certbot command
Execute the following instruction on the command line on the machine to ensure that the certbot command can be run.

_Ejecutar la siguiente instruccion en la machina y asegurar que el comando certbot pueda correr_

```shell
sudo ln -s /snap/bin/certbot /usr/bin/certbot
```

# 5. Choose how you'd like to run Certbot _(Elija cómo le gustaría ejecutar Certbot)_
certificado y haga que Certbot edite su configuración de nginx automáticamente para servirlo, activando el acceso HTTPS en un solo paso.

```shell
# aqui se generara unas preguntas para generar el certificado
sudo certbot --nginx
```

<img width="90%" src="https://i.imgur.com/YBbwuy2.png" alt="My cool logo"/>


# 6. Test automatic renewal _(Probar la renovación automática)_
The Certbot packages on your system come with a cron job or systemd timer 
that will renew your certificates automatically before they expire. 
You will not need to run Certbot again, unless you change your configuration. You can test automatic renewal for your certificates by running this command:

```shell
sudo certbot renew --dry-run
```

🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸🔸

The command to renew certbot is installed in one of the following locations:

_(El comando para renovar certbot se instala en una de las siguientes ubicaciones:)_

```shell
/etc/crontab/
/etc/cron.*/*
systemctl list-timers
```
