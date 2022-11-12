# instalacion de ngrok linux

```shell
mkdir -p ~/ngrok &&  cd  ~/ngrok
```
```shell
# es mi repo de github
wget https://cesar23.github.io/repos_util/linux/ngrok/ngrok-stable-linux-amd64.zip

```

```shell
#instaar repo
sudo apt install unzip
unzip ngrok-stable-linux-amd64.zip
chmod +x ngrok
sudo mv ./ngrok /usr/bin/ngrok
```


## configurar configuracion de  token personal
creamos la configuracion , creamos el archivo `~./ngrok.yml` para la configuracion del tunel.
```shell
authtoken: 1SUMV0bQWCU8lTXuKvpyF6eIEyO_4g3xTatHJ122Xk4BETrSa
console_ui: true
region: sa # (us=United States, eu=Europa, sa=America Latina, ap=Asia)
# web de interface para ver los  log de manera local
web_addr: localhost:4046
log_level: info # (crit,warn,error,info,debug)
log_format: logfmt #tipos de log (logfmt,json,term)
log: ngrok.log


#-------------------------------------------------------------------------------------TUNELES ------
tunnels:
  #---------------------- exponer una web
  web:

    proto: http # que protocolo (http, tcp, tls=premium)

    addr: 80 # puerto expuesto para que se conecten

    # >>> si queremos exponer un host local
    #host_header: "cesar.test"

    # >>>
    bind_tls: false # https (true, false, or both)

    #auth: "demo:secret" # para que se logee

    #hostname: ljnexmo.eu.ngrok.io  -- solo pago



  #---------------------- exponer para escritorio remoto
  ssh:
    proto: tcp
    addr: 22
  #---------------------- exponer para escritorio remoto
  ftp:
    proto: tcp
    addr: 21
    #subdomain: f85c1a3f  -- solo pago

```

### ahora corremos ngrok

```shell
ngrok start --config=ngrok.yml --all
```


