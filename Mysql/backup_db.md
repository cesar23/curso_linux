# Realizar  backup de base de datos


#### 1.- realizar un backup normal

```
mysqldump --user=root --password=123456 pcbyte > copia_seguridad_pcbyte.sql

mysqldump -u root --password=123456 pcbyte --no-data --no-create-db --no-create-info --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF > pcbyte_bk2.sql

```


### 2.1 backup completo con procedimeintos y fucntiones y triger

```
mysqldump -u root --password=123456 pcbyte  --routines --triggers --skip-opt --lock-tables --set-gtid-purged=OFF > pcbyte_bk3.sql
```

#### 2.- realizar un backup  pidiendo el password

```
$ mysqldump --user=root -p acme > copia_seguridad.sql
Enter password: *********
```
### 3.- la mejor maner  de  sacar un backup ![](https://icons.iconarchive.com/icons/custom-icon-design/flatastic-9/24/Accept-icon.png) 
  
###### Si la copia de seguridad la haces en una versión de MySQL moderna y la recuperación de la información se realiza en una versión un poco antigua, es mejor que añadas la opción --skip-opt al realizar la copia de seguridad, para desactivar algunas opciones modernas e incompatibles:

```
mysqldump --user=root -p --skip-opt pcbyte > pcbyte_back1.sql
```

### **4.- Restaurar base de datos**

```
mysql --user=root --password=root < copia_seguridad.sql
```