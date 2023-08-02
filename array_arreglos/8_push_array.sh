ARRAY=()
ARRAY+=('foo')
ARRAY+=('bar')


for i in $(seq 1 7); do
  ARRAY+=($i)
done

for t in ${ARRAY[@]}
do
  echo $t
done
