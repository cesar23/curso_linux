	# OPCIONES:
	# -c, --bytes Imprime la cantidad de bytes.

	# -m, --chars Imprime la cantidad de caracteres.

	# -l, --lines Imprime la cantidad de lineas.

	# --files0-from=F read input from the files specified by NUL-terminated names in file F; If F is - then read names from standard input.

	# -L, --max-line-length Imprime la longitud de la linea más larga.

	# -w, --words Imprime el número de palabras.

	# --help Muestra esta ayuda y sale.

	# --version Muestra la información de la versión y sale.
	
	
	
	# El comando wc en su más siempre expresión muestra el número de lineas, palabras y caracteres
	 wc peruano.txt
	
	 # 5  6 29 peruano.txt
	 # ║  ║ ║
	 # ║  ║ ╚═ caracteres
	 # ║  ╚═ palabras 
	 # ╚═ lineas
	 
	 wc peruano.txt final.txt
		# 1  1  3 peruano.txt
		# 10 11 58 final.txt
		# 11 12 61 total
		
		
	# Muestra cual es la línea más larga de un archivo
	wc -L peruano.txt
	# 8 peruano.txt
	
	#cuantas lineas tiene un archivo
	wc -l peruano.txt
	  

	# Muestra el numero de bytes tiene el archivo
	wc -c demo.txt
	# 128 peruano.txt
	
	#opcional para  evr el peso:
	du -sh salida-2.log