find . -regex '\./[a-f0-9\-]\{36\}\.jpg'

# busqueda de arhcivos de modo no recursivo solo del primer  nivel
find '/c/Users/cesar/Pictures/Screenpresso' -maxdepth 1 -iregex '.*\.png.*'
find "/c/Users/$(whoami)/Pictures/Screenpresso" -maxdepth 1 -iregex '.*\.png.*'

# busqueda y copiar fichero a otro lado
find '/c/Users/cesar/Pictures/Screenpresso' -maxdepth 1 -iregex '.*\.png.*'  -exec cp {} "/d/images_temp/" \;

# copiar fuentes a windows
find "${HOME}/Downloads/font_nvim/"  -maxdepth 1 -iregex '.*\.ttf.*'  -exec cp {} "/c/Windows/Fonts/" \;
