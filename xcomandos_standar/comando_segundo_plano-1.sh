#!/bin/bash

#--------------------------------------------------------------
#------------------ Primer Plano -----------------------
#--------------------------------------------------------------
sleep 5
ping 127.0.0.1


#--------------------------------------------------------------
#------------------ Segundo Plano -----------------------
#--------------------------------------------------------------

				# ║   .Utilizando >  comando&
				# ║    se ejecutara en paralelo
				# ║   .Ejemplo > spleep 60&
				# ║   
				
#root@ubuntu:~# sleep 60&
#[1] 5863  <=Identificador
#root@ubuntu:~# sleep 90&
#[2] 5920  <=Identificador

#--------------------------------------------------------------
#------------------ Tabla de trabajos -----------------------
#--------------------------------------------------------------
# se aloja  la  lista  de procesos ejcutandose en segundo plano