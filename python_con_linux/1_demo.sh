#correr python desde shell linux

CURRENT_DIR=$(dirname $0)

python -c "
import os,sys,time

cwd = os.getcwd()

#Directorio actual python
print(\"Directorio actual en PYTHON es:\", cwd)

valor1 = os.system(\"whoami\")
print(\"whoami es::\", valor1)

print(\"Directorio actual en SH es::\", '${CURRENT_DIR}')
#print('${CURRENT_DIR}')
print('------------------------')
"
dd="ee"
