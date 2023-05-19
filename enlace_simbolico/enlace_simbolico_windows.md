# Crear enlaces simbolicos CMD como Administrador


<img src="https://cesar23.github.io/cdn_webs/iconos_png/PowerShell_7x32.png" alt="My cool logo"/>
(Directorio) Para `node_modules`

```shell
# mklink /d  "ubicacion del enlace" ,"desde donde"

mklink /d "C:\xampp\htdocs\curso-electron\ProyectoGeoAlert\dist\win-ia32-unpacked\resources\node_modules" "C:\xampp\htdocs\curso-electron\ProyectoGeoAlert\node_modules"
```

<img src="https://cesar23.github.io/cdn_webs/iconos_png/PowerShell_7x32.png" alt="My cool logo"/>
(fichero) Para Claves ssh  local hacia mobax

```shell
# mklink /d  "ubicacion del enlace" ,"desde donde"

mklink C:\Users\cesar\mobax\home\.ssh\id_rsa C:\Users\cesar\.ssh\id_rsa
mklink C:\Users\cesar\mobax\home\.ssh\id_rsa.pub C:\Users\cesar\.ssh\id_rsa.pub
mklink C:\Users\cesar\mobax\home\.ssh\known_hosts C:\Users\cesar\.ssh\known_hosts
mklink C:\Users\cesar\mobax\home\.ssh\known_hosts.old C:\Users\cesar\.ssh\known_hosts.old
```



-- -- 
<img width="30px" src="https://cesar23.github.io/cdn_webs/iconos_png/mobax_term_logo_x48.png"  alt="My cool logo"/>
Para mobax crear este fichero  `file.bat` y ejecutarlo como administrador

```
REM ejcutar como admin

REM :::::: eliminamos si hay ficheros
del  %USERPROFILE%\mobax\home\.ssh\id_rsa
del  %USERPROFILE%\mobax\home\.ssh\id_rsa.pub
del  %USERPROFILE%\mobax\home\.ssh\known_hosts

REM :::::: reaizamos el enlaze simbolico
REM mklink ruta  desdedonde 
mklink  %USERPROFILE%\mobax\home\.ssh\id_rsa  %USERPROFILE%\.ssh\id_rsa
mklink  %USERPROFILE%\mobax\home\.ssh\id_rsa.pub  %USERPROFILE%\.ssh\id_rsa.pub
mklink  %USERPROFILE%\mobax\home\.ssh\known_hosts  %USERPROFILE%\.ssh\known_hosts
```