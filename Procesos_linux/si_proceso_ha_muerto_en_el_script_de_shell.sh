# fuente: https://stackoverflow.com/questions/71578894/how-do-i-watch-for-a-process-to-have-died-in-shell-script
spin[0]="-"
spin[1]="\\"
spin[2]="|"
spin[3]="/"

sleep  10 2>/dev/null &    # run as background process
pid=$!                     # grab process id

echo $pid

echo -n "[sleeping] ${spin[0]}"

#while ps -p $pid >/dev/null 2>&1       # using ps
while kill -0 $pid >/dev/null 2>&1      # using kill
do
  for i in "${spin[@]}"
  do
    echo -ne "\b$i"
    sleep 0.5
  done
done
