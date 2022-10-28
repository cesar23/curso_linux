
#peso de una  carpeta
du -bsh Videos/
# --------------------------------------------------------------
#-------------------VER EL PESO DE LOS  DICRECTORIOS actuales
du -smh *
du -smh /c/Users/Cesar/* # ver peso de carpetas de usuario


# ---------------------------------------------------------------------------------------------
#-------------------VER EL PESO DE LOS  DICRECTORIOS por Ruta Salida del peso en en:  KiloBytes
# ---------------------------------------------------------------------------------------------
#ver peso  original (Cesar)
# -a    => Despliega todas las carpetas y archivos.
# sort  => Se encarga de ordenar las líneas.
# -n    => Compara los valores numéricos de las cadenas.
du -a  /home | sort -n -r | head -n 7

# con formateado Humano
du -a  /home | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }'
du -a  "/home/kpopilrp/mail/.Archive/" | sort -n -r | head -n 7 | awk '{printf $2 " - " ; system("  numfmt --to=iec-i --suffix=B --format=\"%.2f\"  $((" $1 " * 1000)) " ) }'

# --------------------------------------------------------------
#//-------------------------ver peso de archivos
      #ver peso de la carpeta
      du -smh  /home/kpopilrp/inversionesluper.com/public_html/
      #ver peso de los archivos dentro
      du -smh * /home/kpopilrp/inversionesluper.com/public_html/*


# --------------------------------------------------------------
#--------------------ver el peso de los 5 directorios mas  pesados
#--sort -nr (ordernar por numero y desc)
#--head -5 los  5  ultimos
du -smh * | sort -nr | head -5

du -a | sort -n -r | head -n 7 | kiloBytes_To_HumanReadable $(awk '{print $1}')
du -a | sort -n -r | head -n 7 | xargs -i echo wc -l {}
du -a | sort -n -r | head -n 7 | awk '{print $1}'
du -a | sort -n -r | head -n 7 | awk '{print $1}' |kiloBytes_To_HumanReadable
du -a | sort -n -r | head -n 7 | awk '{print $1}' |  xargs -i kiloBytes_To_HumanReadable
du -a | sort -n -r | head -n 7 | awk '{print $1}' |  xargs -i numfmt --to=iec-i --suffix=B --format="%.3f" {}

du -a | sort -n -r | head -n 7 | awk '
                                 function myfunc()
                                 {
                                 valor=$(($1 * 1000))

                                 printf "The user %s \n",  $valor

                                 }

                                 {

                                 myfunc()

                                 }'

# --------------------------------------------------------------
#---------- listar solo los  directorios que  pesen en gigas
 du -smh *  | grep 'G'

# --------------------------------------------------------------
# ----  nivel de  profundida solo carpetas  actuales no sub directorios
 du -h --max-depth=1
