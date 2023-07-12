#!/bin/bash

spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::::::::::::::: con Linux
#  aqui  buscar los proceso que tiene  el puerto 80
kill -9 $(lsof -i :80 |grep LISTEN | grep root | awk '{print $2}')

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::::::::::::::: con CMD
# FOR /F "tokens=5 delims= " %P IN ('netstat -ano ^| find "LISTENING" ^| find ":10000 "') DO @TASKKILL /PID %P /f
