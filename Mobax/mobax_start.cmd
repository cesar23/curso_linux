@echo off
rem ::::::::::::::::::::::::::::::::::::::::::::::::::
rem echo         Current file: %~nx0
rem echo   Carpeta del script: %~dp0
rem echo      Path del script: %~dpnx0
rem echo --------------------------------------------------------
rem echo     primer paramtero: %1
rem echo todos los parametros: %*

set argumentos_all=%*

echo %argumentos_all%
pause


rem D:\cmder\MobaXterm_Portable\MobaXterm_Personal_22.1.exe D:\repos\curso_linux\xcomandos_standar\current_dir.sh -exitwhendone
D:\cmder\MobaXterm_Portable\MobaXterm_Personal_22.1.exe "%argumentos_all%" -exitwhendone
pause





