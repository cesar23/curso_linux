# Exportacion de db
## para versiones <= 15
- version mysql: `mysql  Ver 15.1 Distrib 10.3.36-MariaDB, for Linux (x86_64) using readline 5.1`
- version de linux: 
```shell
mysqldump  -u kpopilrp_cesar -p kpopilrp_tareastore > data.sql && gzip data.sql


cd /home/kpopilrp/backups && \
mysqldump -h localhost -u kpopilrp_cesar \
  -pcesar203 \
  kpopilrp_tareastore \
  --routines --triggers --skip-opt --lock-tables \
  | gzip > "/home/kpopilrp/backups/DATABASE-22.sql.gz"
  #--result-file="{path_file_output}" 



cd /home/kpopilrp/backups && \
mysqldump  -h localhost \
  -P 3306 \
  -u kpopilrp_cesar \
  -pcesar203 \
  --routines \
 kpopilrp_tareastore > data2.sql && gzip data2.sql
```


### para pcbyte
```shell
DIR_OUTPUT='/D/SOFTLINK/BACKUP/'
DB_USER='PCBYTE'
cd $DIR_OUTPUT && \
mysqldump  -h localhost \
  -P 3306 \
  -u kpopilrp_cesar \
  -pcesar203 \
  --routines \
 kpopilrp_tareastore > data2.sql && gzip data2.sql
```
