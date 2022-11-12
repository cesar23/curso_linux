fuente :
- https://atareao.es/tutorial/scripts-en-bash/log-en-bash/

# comando logger linux
```shell
Opciones: 
-i, –id
Registrar o PID do processo do logger.

-s
Ecoar dados também para o erro padrão, além de gravá-los no arquivo de log

-d, –udp
Usar datagrama (UDP) em vez de conexão de stream (TCP) ao socket de logger

-f arquivo
Registrar o conteúdo do arquivo nos logs

-n, –server servidor
Gravar no servidor remoto syslog especificado usando UDP em vez de usar as rotinas do syslog local.

-P, –port
Usar a porta UDP especificada. A porta padrão é 514.

-p prioridade
Configurar uma prioridade com a mensagem. A prioridade pode ser especificada numericamente ou ocmo um par facility.level. O padrão é user.notice.

-t, –tag tag
Marcar cada linha no log com a tag especificada.

-u
Gravar log diretamente em um socket de rede
```



```shell
# :::::::::::: sintaxis
logger "<mensaje>"
logger -p <recurso>.<severidad> "<mensaje>"
logger -p local0.info "Mensaje de información"
```

### Poner en escucha los mensajes que generados
```shell
# -------
tail -f /var/log/syslog
tail -f /var/log/messages
```

<img width="90%" src="https://i.imgur.com/8p19tyk.png" alt="My cool logo"/>

-- --


## Ejecucion de pruebas
```shell
# generar log
logger  `date`

```
#### ejecucion de script conn mensajes
```shell
logger -p local0.info -t mi_script "Mensaje de información"
```
