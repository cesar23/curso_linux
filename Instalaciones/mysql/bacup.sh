mysqldump -u [usuario] -p [base de datos] > [archivo de respaldo].sql
mysqldump -u root -p webgsp2019 > bacup_webgsp2019_v2.sql
mysqldump --opt --events --routines --triggers --default-character-set=utf8 -u root -p webgsp2019 | gzip -c > webgsp2019_`date +%Y%m%d_%H%M%S`.sql.gz

mysqldump --opt --events --routines --triggers --default-character-set=utf8 -u root --password=76RRyska webgsp2019 | gzip -c > webgsp2019_`date +%Y%m%d_%H%M%S`.sql.gz