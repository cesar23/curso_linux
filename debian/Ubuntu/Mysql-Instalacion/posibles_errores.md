# error mysql de password
posibles errores mysql


este  error es sale y no te  deja  poner el password
```shell
New password: 

Re-enter new password: 

Estimated strength of the password: 100 
Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
 ... Failed! Error: SET PASSWORD has no significance for user 'root'@'localhost' as the authentication method used doesn't store authentication data in the MySQL server. Please consider using ALTER USER instead if you want to change authentication parameters.

New password:
```

### solucion 
entrar al mysql y ejecutar lo siguiente `ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'cesar203';`

```shell
root@cesar-ubuntu:/# mysql -u root
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 18
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by 'cesar203';
Query OK, 0 rows affected (0,01 sec)

mysql> exit

```

ahor aya  podemos estrar con al contrasena

```shell
root@cesar-ubuntu:/# mysql -u root -p
Enter password: 
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 20
Server version: 8.0.29-0ubuntu0.20.04.3 (Ubuntu)

Copyright (c) 2000, 2021, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> 

```



## Opcion 2
```shell
killall mysqld
```




crear archivo `echo `
```shell
# crera el archivo init
 ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password by '$Cesar.$cesar203'; >> /tmp/mysql-init
# arrancar
mysqld --init-file=/tmp/mysql-init
```
