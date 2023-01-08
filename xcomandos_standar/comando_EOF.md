# ejemplos con <<EOF y <<-EOF 

## usando `<<EOF`
 aqui respetara los espacios
```shell
cat <<EOF
    Line 1
    Line 2
EOF

# outputs:  
#    Line 1
#    Line 2
```

## usando `<<-EOF`
aqui quitara los tabs

```shell
cat <<-EOF
    Line 1
    Line 2
EOF

# outputs:  
#Line 1
#Line 2
```

## ejemplo en scrip de postgresql

```shell
#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER billingapp WITH PASSWORD 'qwerty';
    CREATE DATABASE billingapp_db;
    GRANT ALL PRIVILEGES ON DATABASE billingapp_db TO billingapp;
EOSQL
```