@echo off
SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION

set CURRENT_NAME=%~n0
set CURRENT_DIR=%~dp0

set NOMBRE_ARCHIVO=%~dp0
:: C:\Users\Cesar\cesar\bacup_cesar2.bat
set PATH_DEL_ARCHIVO=%~dpnx0
@REM -----------------------------------------------------
@REM # exporner multiples puertos (80,3345)
rem ngrok start --config=conf_tcp.yml --all

echo Entramos la ubicacion de
cd %CURRENT_DIR%\tunel

echo Directorio actual: %cd%
ngrok start --config=conf_tcp_intcomex.yml --all

