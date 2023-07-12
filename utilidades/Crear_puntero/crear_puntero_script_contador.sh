count=0
total=14
pstr="[=======================================================================]"
salida=""
while [ $count -lt $total ]; do
  sleep 0.5 # this is work
  count=$(( $count + 1 ))
  echo "contador:${count}"
  salida=$(( $count ))

done
echo "-----------------------------"
echo "Total Contados:${salida}"
