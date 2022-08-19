
#peso de una  carpeta
du -bsh Videos/
# --------------------------------------------------------------
#-------------------VER EL PESO DE LOS  DICRECTORIOS actuales
du -smh *
du -smh /c/Users/Cesar/* # ver peso de carpetas de usuario


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


# --------------------------------------------------------------
#---------- listar solo los  directorios que  pesen en gigas
 du -smh *  | grep 'G'

# --------------------------------------------------------------
# ----  nivel de  profundida solo carpetas  actuales no sub directorios
 du -h --max-depth=1
