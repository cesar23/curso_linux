@REM fuente:https://programmerclick.com/article/3559534249/
@REM C:\tools
@REM C:\ProgramData\chocolatey\bin



@REM ---------------------------------------------------------------------
@REM ---------------- EJEMPLOS con YML -----------------------------------
@REM ---------------------------------------------------------------------


@REM -----------------------------------------------------
@REM ejecutar solo web 80
@REM ngrok start --config=conf.yml web


@REM -----------------------------------------------------
@REM # exporner multiples puertos (80,3345)
ngrok start --config=conf_tcp.yml --all

@REM -----------------------------------------------------
@REM # exponer todos
@REM ngrok start --config=conf.yml --all


@REM ngrok http 80 -log=stdout  > ngrok.log &
