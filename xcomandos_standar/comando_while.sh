#!/bin/bash
contador=0
termina=10
escape=5

while [ $termina -ge $contador ]
do
  echo $contador
  let contador=$contador+1

  if [ "$contador" -eq "$escape" ]; then
    echo "llego a 5"
    break
  fi
done

