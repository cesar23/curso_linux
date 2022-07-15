#fuente : https://www.aradaen.com/sysadmin/tips-y-trucos/comando-source-evitando-la-creacion-de-subprocesos-en-bash/
#video : https://www.youtube.com/watch?v=ZIqRmp-XBRY



#------------------------------------------------------------
#--------------------- 1 paso ---------------------------------------
#------------------------------------------------------------

#::: ejecutar desde la  consola

#       [usr@srv]: ./comando_source.sh
#       www.aradaen.com

#::: ahora si ejecutanmos desde consola

#       [usr@srv]: echo $VAR_EJEMPLO_SOURCE
#       [usr@srv]:


#------------------------------------------------------------
#--------------------- 2 paso ---------------------------------------
#------------------------------------------------------------

#       :: al realizar esto corremos en el mismo pid de proceso actual
#       [usr@srv]: source ./comando_source.sh
#                 O
#       [usr@srv]: . ./comando_source.sh
#       www.aradaen.com


#::: ahora si ejecutanmos desde consola

#       [usr@srv]: echo $VAR_EJEMPLO_SOURCE
#       [usr@srv]: www.aradaen.com
#------------------------------
# -OJO SOLO FUNCIONA EN LINUX
#------------------------------

VAR_EJEMPLO_SOURCE='www.aradaen.com';
echo $VAR_EJEMPLO_SOURCE



#------------------------------------------------------------
#--------------------- Otro ---------------------------------------
#------------------------------------------------------------
# tambien veras que  el pid del proceso es el mismo
# compruebalo desde la  consola corriendo esta  misma  parte del script
# en la consola de linux:
    #>  echo "Mi id de processo es :" $$
    #luego
    # sh comando_source.sh
    # source comando_source.sh
#echo "Mi id de processo es :" $$

#fuente : http://edgardomarti.blogspot.com/2015/04/para-que-sirve-el-comando-source.html
