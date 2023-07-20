FILE="example.tar.gz"
FILE="/D/repos/curso_linux/xcomandos_standar/idiomas.min.js"
# con esto obtenemos la extencion de fichero
echo "${FILE%%.*}"
echo "${FILE%.*}"
echo "${FILE#*.}"
echo "${FILE##*.}"
