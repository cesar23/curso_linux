import os,time
from datetime import datetime


#Día actual

def crearFichero(path_fichero,numero=1):
    # path_fichero = "D:\salida.txt"
    now = datetime.now()
    fecha_format = now.strftime('%Y-%m-%d Hora: %H:%M:%S')
    file = open(path_fichero, "w", encoding='utf-8')
    file.write("veces creado:{}".format(numero) + "\n")
    file.write("fecha actual: {}".format(fecha_format))
    file.close()

i=0
while True:
    i=i+1
    print("------creacion:{}".format(i))
    time.sleep(10)
    path_fichero = "/home/cesar/servicio_mipy.txt"
    crearFichero(path_fichero,i)
    time.sleep(10)
    os.system("rm -r {path_fichero}".format(path_fichero=path_fichero))
    # os.system("del  /q \"{path_fichero}\" ".format(path_fichero=path_fichero))
