
Generador:
https://crontab-generator.org/


Para ejecutar cada día 15 y 30 (cada quincena) de cualquier mes, a las 10:00pm. La coma se usa para usar varios valores juntos.
```shell
0 23 15,30 * comandos...
```
Para ejecutar a las 7:25am de lunes a viernes. El guión se usa los valores entre ambos números, 1,2,3,4,5 (intervalo cerrado).
```shell
25 7 * * 1-5 comandos...
```
Para ejecutar cada dos horas en el minuto 30 (cada hora divisible entre dos)
```shell
0 */2 * * * comandos...[/align]
```
Ejecutará el script test1.sh a las 10:15 a.m. todos los días

```shell
15 10 * * * usuario /home/usuario/scripts/test1.sh
```

Usuario root ejecutará una actualización todos los domingos a las 10:00 a.m

```shell
00 10 * * 0 root apt-get -y update
```

Se ejecutará a las 5:30 de la tarde todos los días de lunes a viernes.
```shell
30 17 * * 1,2,3,4,5 /home/usuario/scripts/test1.sh
```

Ejecutar un script de lunes a viernes a las 2:30 horas:
```shell
30 2 * * 1-5 /home/usertest/scripts/test1.sh
```

Enviará un correo todos los días a las 8:00 a.m. y 8:00 p.m.
```shell
0 8,20 * * * usertest mail -s "sistema funcionando" usertest@dominio.com
```


Podemos usar cualquier otro programa ejecutable, ejemplos:
```shell

*/15 * * * * /usr/bin/curl http://dominio.com/test1.php > /dev/null 2>&1
*/15 * * * * /usr/bin/curl -u usertest:password http://dominio.com/test1.php
*/15 * * * * wget -q -O http://dominio.com/test1.php
*/15 * * * * /usr/bin/php /home/usertest/scripts/test1.php > /dev/null 2>&1
```

## Cadenas especiales
```shell
@reboot Ejecuta una vez, al inicio
@yearly ejecuta sólo una vez al año: 0 0 1 1 *
@annually igual que @yearly
@monthly ejecuta una vez al mes, el día primero: 0 0 1 * *
@weekly Semanal el primer minuto de la primer hora de la semana. 0 0 * * 0.
@daily diario, a las 12:00A.M. 0 0 * * *
@midnight igual que @daily
@hourly al primer minuto de cada hora: 0 * * * *
```

```shell
@hourly usertest /home/usertest/scripts/test1.sh
@monthly usertest /home/usertest/scripts/test1.sh
@daily root apt-get update && apt-get -y upgrade
```