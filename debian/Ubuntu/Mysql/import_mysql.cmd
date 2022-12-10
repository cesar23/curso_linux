@echo off
SET PATH_CONFIG=D:\config_mysql.cnf
SET PATH_BACKUP=D:\\demo.sql

SET DB_HOST=localhost
SET DB_PORT=33066
SET DB_USER=root
SET DB_PASSWORD=cesar203
SET DB_NAME=pcbyte_softlink

echo [client]> %PATH_CONFIG%
echo password="%DB_PASSWORD%" >> %PATH_CONFIG%


echo %DB_HOST% %var1%

rem mysql.exe --defaults-file="D:\config_mysql.cnf" --ssl-mode=DISABLED --protocol=tcp --host=127.0.0.1
rem --user=root --port=33066 --default-character-set=utf8 --comments --database=pcbyte_softlink  < "D:\\demo.sql"

mysql.exe --defaults-file="%PATH_CONFIG%" --ssl-mode=DISABLED --protocol=tcp --host=%DB_HOST% --user=%DB_USER% --port=%DB_PORT% --default-character-set=utf8 --comments --database=%DB_NAME%  < "%PATH_BACKUP%"
