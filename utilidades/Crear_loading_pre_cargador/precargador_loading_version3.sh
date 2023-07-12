(
count=0
total=34
pstr="[=======================================================================]"

while [ $count -lt $total ]; do
  sleep 0.5 # this is work
  count=$(( $count + 1 ))
done


) & PID=$! #simulate a long process

echo "THIS MAY TAKE A WHILE, PLEASE BE PATIENT WHILE ______ IS RUNNING..."
printf "["
# While process is running...
while kill -0 $PID 2> /dev/null; do
    printf  "▓"
    sleep 0.5
done
printf "] done!"
