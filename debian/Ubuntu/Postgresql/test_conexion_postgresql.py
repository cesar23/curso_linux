import psycopg2
# paquetes instalar en Linux
# fuente: https://stackoverflow.com/questions/5420789/how-to-install-psycopg2-with-pip-on-python

#        Opcion 1:  pip install psycopg2-binary
#        Opcion 2:  sudo apt install libpq-dev python3-dev

#        paquetes opcionales:  sudo apt install build-essential
#        paquetes opcionales:  sudo apt install postgresql-server-dev-all

# # pg_isready -d canvas_prod -h database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com -p 5432 -U canvas_prod


DB_HOST = "localhost"
DB_PORT = "5432"
DB_USER = "postgres"
DB_PASSWORD = "1234"
DB_NAME = "canvas_prod"




# --------------------------- para server Eucim
# DB_PORT = "5432"
# DB_USER = "canvas_prod"
# DB_PASSWORD = "Vrn8EDgxBIJJ"
# DB_NAME = "canvas_prod"
print("ddd")


conn = psycopg2.connect(dbname=DB_NAME,
                        user=DB_USER,
                        host=DB_HOST,
                        password=DB_PASSWORD,
                        port=DB_PORT)
cursor = conn.cursor()
cursor.execute('SELECT * FROM information_schema.tables')
rows = cursor.fetchall()
for table in rows:
    print(table)
conn.close()

