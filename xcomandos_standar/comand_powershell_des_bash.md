Ejecuatr comando powershell desde bash

```shell
powershell.exe -Command "& { Get-Service }"
powershell.exe -Command "& {docker exec -it -w /var/www/ wp-server pwd}"
```
