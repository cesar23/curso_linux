#!/bin/bash

spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"



# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::::::::::::::: con Linux ::::::::::::::::::::::::::::
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

#  aqui  buscar los proceso que tiene  el puerto 80
kill -9 $(lsof -i :80 |grep LISTEN | grep root | awk '{print $2}')
kill -9 $(lsof -i :4200 |grep LISTEN | grep root | awk '{print $2}')

#PORT_SEARCH=4200
#lsof -i :$PORT_SEARCH |grep LISTEN | awk '{print $2}' > pids_open.txt
#for line in $(cat pids_open.txt)
#  do
#    kill -9 $line
#    echo "$line"
#    # CONT=$line
#done

# ::::::::::::::::::::::::::::::::::::::::::::::::::::::
# ::::::::::::::: con CMD ::::::::::::::::::::::::::::::
# ::::::::::::::::::::::::::::::::::::::::::::::::::::::

# FOR /F "tokens=5 delims= " %P IN ('netstat -ano ^| find "LISTENING" ^| find ":10000 "') DO @TASKKILL /PID %P /f
# FOR /F "tokens=5 delims= " %P IN ('netstat -ano ^| find "LISTENING" ^| find ":4200 "') DO @TASKKILL /PID %P /f
#   taskkill /pid processid /t /f
#   taskkill /pid 1840 /t /f
