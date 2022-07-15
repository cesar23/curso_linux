# Cambiar  contraseña root de mysql

## 1 entrar al bin de la consola windows o linux
mysql.exe

si el usuario root no tiene contraseña
`mysql -u root `

si el usuario root tiene contraseña
`mysql -u root -p`


creando nuevo usuario
```
CREATE USER 'pcbyte' IDENTIFIED BY '123456';
```
dandole todos los permisos y ingresar desde  afuera
```
GRANT USAGE ON *.* TO 'pcbyte'@'%' IDENTIFIED BY '123456';
```
```

#GRANT ALL PRIVILEGES ON *.* TO 'pc01'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'pcbyte'@'%';

-- modiicando al usuario root para que se pueda acceder por fuera de la red
GRANT USAGE ON *.* TO 'root'@'%' IDENTIFIED BY 'xx123456';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';

FLUSH PRIVILEGES;
```

----------------------------------------------------- start SERVER ------------------------