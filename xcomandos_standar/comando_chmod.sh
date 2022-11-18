chmod en octal
# La representación octal de chmod es muy sencilla

# Lectura tiene el valor de 4
# Escritura tiene el valor de 2
# Ejecución tiene el valor de 1

# Entonces:

# x-----x-----x-----------------------------------x
# | rwx |  7  | Lectura, escritura y ejecución    |
# | rw- |  6  | Lectura, escritura        |
# | r-x |  5  | Lectura y ejecución       |
# | r-- |  4  | Lectura               |
# | -wx |  3  | Escritura y ejecución             |
# | -w- |  2  | Escritura                         |
# | --x |  1  | Ejecución             |
# | --- |  0  | Sin permisos          |
# x-----x-----x-----------------------------------x
# Por lo tanto:

# x------------------------x-----------x
# |chmod u=rwx,g=rwx,o=rx  | chmod 775 | 
# |chmod u=rwx,g=rx,o=     | chmod 760 |
# |chmod u=rw,g=r,o=r      | chmod 644 |
# |chmod u=rw,g=r,o=       | chmod 640 |
# |chmod u=rw,go=          | chmod 600 |
# |chmod u=rwx,go=         | chmod 700 |
x------------------------x-----------x