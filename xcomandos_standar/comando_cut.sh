fuente:http://www.sromero.org/wiki/linux/aplicaciones/uso_de_awk


#Donde las opciones son:
#
#    -b rango/s
#    Selecciona los bytes indicados en el o los rangos. También puede indicarse con el parámetro --bytes=rango/s.
#    -c rango/s
#    Selecciona los caracteres indicados en el o los rangos. También puede indicarse con el parámetro --characters=rango/s.
#    -f rango/s
#    Selecciona los campos (columnas) indicadas en el o los rangos, que se encuentran delimitadas por el carácter Tabulador. También puede indicarse con el parámetro --fields=rango/s. En caso de que una línea no posea el delimitador, esta se muestra en su totalidad, salvo que se utilice el parámetro -s.
#    -d caracter_delimitador
#    Especifica el carácter delimitador de los campos, en el caso de que se utilice el parámetro -f. Es posible indicarlo usando --delimiter=caracter_delimitador. En caso de que no se use dicho parámetro el tabulador actúa como delimitador por defecto.
#    -s
#    Indica que las líneas que no posean el delimitador (o separador) no sean mostradas.
#    --complement
#    Establece que los rangos indicados en alguna de las opciones -b, -c o -f no son deseados, por lo tanto se muestra el resto que se encuentra excluido.
#    --output-delimiter=cadena_de_texto
#    Indica que los campos, al ser mostrados en pantalla, sean separados por la cadena de texto indicada.


# -------empresas.txt
# Sunat corp.# Cesar auris#http://sunat.com
# AWS corp.#Juan perez#http://sunat.com
# INICTEL corp.#Jesus#http://sunat.com
# SISCO corp.# Mili ddds#http://sunat.com

cut   -d#    -f1   empresas.txt
	 # ║   	  ║
	 # ║   	  ╚════ que fila selecionamos
	 # ║			 
	 # ║			  
	 # ║				
	 # ║   
	 # ╚═ delimitador


	# salida 
		# Sunat corp.
		# AWS corp.
		# INICTEL corp.
		# SISCO corp.



cut   -d#    -f1,3   empresas.txt #nos botala la 1 y 3 columna
		# salida
			# Sunat corp.#http://sunat.com
			# AWS corp.#http://sunat.com
			# INICTEL corp.#http://sunat.com
			# SISCO corp.#http://sunat.com
			
			
#------------------------ metodo de busqueda  pro caracteres

# -------jefes.txt
# Paul      Auris
# jean      Ochoa
# Fernando  Quispe
# Mary      Chata
# Sheyla    huerta

cut   -c   1-8  jefes.txt
	 # ║    ║
	 # ║    ╚════ desde que caracteres cogera
	 # ║			 
	 # ║			  
	 # ║				
	 # ║   
	 # ╚═ que separa por caracter		

	# salida
		# Paul
		# jean
		# Fernando
		# Mary
		# Sheyla


otro ejecmplo
# 1 – Sacar el primer campo en pantalla de un fichero delimitado por un espacio:

cut   -d " "    -f 1   empresas.txt
