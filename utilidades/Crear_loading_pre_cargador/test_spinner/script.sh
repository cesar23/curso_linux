count=0
total=14
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.5 # this is work
  count=$(( $count + 1 ))
done
