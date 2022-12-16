# instalar certificado en windows
 fuente : https://www.softzone.es/windows/como-se-hace/ver-borrar-certificados-digitales-windows-10/


1. instalaremos el certificado

<img  src="https://i.imgur.com/JSYNvdn.png" alt="My cool logo"/>

-- --

<img src="https://i.imgur.com/O2pEa3n.png" alt="My cool logo"/>

-- --
<img src="https://i.imgur.com/4nJxeIS.png" alt="My cool logo"/>

-- --
<img src="https://i.imgur.com/zbmBLYL.png" alt="My cool logo"/>

-- --


# Cómo ver los certificados digitales instalados

para ver los certificados instalados ejecutar `certlm.msc`

<img src="https://i.imgur.com/zJSpPcJ.png" alt="My cool logo"/>

-- --

<img src="https://i.imgur.com/GJax4uO.png" alt="My cool logo"/>

-- --

Otras ubicaciones por donde podemos ver los certificados pro regedit

```shell
Equipo\HKEY_CURRENT_USER\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates
Equipo\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\CA\Certificates
```

### Eliminar y Exportar

<img src="https://i.imgur.com/itiqN0Y.png" alt="My cool logo"/>

-- --


## para ver informacion del certificado

```shell
openssl x509 -text -noout -in "/d/repos/curso_linux/debian/Ubuntu/CertificadoSSL/Crear_certificado_Windows/sunat.local/server.crt"

```
