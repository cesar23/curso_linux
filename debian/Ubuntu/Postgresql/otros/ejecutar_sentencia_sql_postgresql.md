# ejcucion comando postgresql


```shell
# DB_HOST = "localhost"
# DB_PORT = "5432"
# DB_USER = "postgres"
# DB_PASSWORD = "1234"
# DB_NAME = "postgres"
PGPASSWORD=1234  
psql --host localhost --port 5432 --username postgres -d postgres -c "select * from  information_schema.tables"


```