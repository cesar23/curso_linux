declare -a MIS_WEBS=('bambooregalos.pe' 'vitafitperu.com')
for WEB in ${MIS_WEBS[@]}; do

echo "------- paso 1 --------"
echo "${WEB} : borrar los archivos que ya no se necesitaran"
sleep 5
echo "------- paso 2 --------"
echo "${WEB} : copiar archivos que se actualizaron"
done