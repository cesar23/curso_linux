import psycopg2
# # pg_isready -d canvas_prod -h database-1.cp4rylpf5r1x.sa-east-1.rds.amazonaws.com -p 5432 -U canvas_prod
def postgres_test():
    USER

    try:
        conn = psycopg2.connect("dbname='mydb' user='myuser' host='my_ip' password='mypassword' connect_timeout=1 ")
        conn.close()
        return True
    except:
        return False