count=0
total=34
start=`date +%s`

while [ $count -lt $total ]; do
  sleep 0.5 # this is work
  cur=`date +%s`
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  runtime=$(( $cur-$start ))
  estremain=$(( ($runtime * $total / $count)-$runtime ))
  printf "\r%d.%d%% complete ($count of $total) - est %d:%0.2d remaining\e[K" $(( $count*100/$total )) $(( ($count*1000/$total)%10)) $(( $estremain/60 )) $(( $estremain%60 ))
done
printf "\ndone\n"
