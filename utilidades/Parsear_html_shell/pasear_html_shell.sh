#!/bin/sh
# fuente: https://stackoverflow.com/questions/36157116/parse-html-with-curl-in-shell-script



# ::::😥 Solo para  html cortos ya  que  en  largos  cuasa  errro
cat - > file.html << EOF
<div style="color:#fff" class="tracklistInfo">
<p class="artist">Diplo - Justin Bieber - Skrillex</p>
<p>Where Are U Now</p>
</div><div class="tracklistInfo">
<p class="artist">toto</p>
<p>tata</p>
</div>
<p>Saludo</p>
EOF


#cat file.html | tr -d '\n'  | sed -e "s/<\/div>/<\/div>\n/g" | sed -n 's/^.*class="artist">\([^<]*\)<\/p> *<p>\([^<]*\)<.*$/artist : \1\ntitle : \2\n/p'
# ::: quita todos los saltos de linea
cat file.html | tr -d '\n'
echo "" && echo "" && echo "::::::::" && echo ""

# ::: formatea el html
cat file.html | tr -d '\n'  | sed -e "s/<\/div>/<\/div>\n/g"
echo "" && echo "" && echo "::::::::" && echo ""

# ::: Aqui hace  el regex del html
cat file.html | tr -d '\n'  | sed -e "s/<\/div>/<\/div>\n/g" | sed -n 's/^.*class="artist">\([^<]*\)<\/p> *<p>\([^<]*\)<.*$/artist : \1\ntitle : \2\n/p'
