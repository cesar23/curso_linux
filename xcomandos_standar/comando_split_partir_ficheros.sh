#!/bin/bash
fuente: https://www.linuxtechi.com/split-command-examples-for-linux-unix/
#--------------------------------------------------------------
#------------------ Primer Plano -----------------------
#--------------------------------------------------------------
split 9999_lineas.txt

#para ver que nos resultara sin ejecutarlo
split 9999_lineas.txt --verbose
#cada mil lineas
split -l 1000 9999_lineas.txt --verbose


#--------------------------------------------------------------
#------------------ dibidir por byte , KB, MB, GB-----------------------
#--------------------------------------------------------------

#--dibidir archivoen kb
split -b 50K 9999_lineas.txt  --verbose
      #creating file 'xaa'
      #creating file 'xab'
      #creating file 'xac'

#--dibidir archivo con prefijo
split -b 50K 9999_lineas.txt  split_file_

#split 9999_lineas.txt  -b 20MB video_ --verbose


#split video.mp4 -b 20MB video_


#-----------archivo sql
split -b 500M 5646.dat  part_

