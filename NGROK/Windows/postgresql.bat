@REM fuente:https://programmerclick.com/article/3559534249/
@REM C:\tools
@REM C:\ProgramData\chocolatey\bin


@REM ---------------------------------------------------------------------
@REM -------------  Panel de admin local    ------------------------------
@REM -------------  http://localhost:4040/  ------------------------------
@REM ---------------------------------------------------------------------

@REM ---------------------------------------------------------------------

@REM -------------------ponemos el token (desde tu  cuenta ngrok)---------
ngrok  authtoken 1SUMV0bQWCU8lTXuKvpyF6eIEyO_4g3xTatHJ122Xk4BETrSa

@REM ------------------------ abrimos el puerto paar escritorio remoto---------------------------------------------
@REM ngrok tcp 3389
ngrok tcp -region sa 5432




@REM ngrok http 80 -log=stdout  > ngrok.log &
