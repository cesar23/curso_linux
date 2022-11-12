# realizar la importacion de  mysql

```shell
DB_HOST="localhost"
DB_PORT="3306"
DB_USER="root"
DB_PASSWORD="cesar203"
DB_NAME="kpopilrp_projectmanager"
FILE_SQL=/D/repos/curso_linux/Hosting/db/kpopilrp_projectmanager.sql

mysql -u $DB_USER -p new_database < $FILE_SQL
#mysql -u username -p new_database < data-dump.sql
```
