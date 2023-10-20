
```shell
#     --recursive \
#     --level 5 \
#     --no-clobber \
#     --page-requisites \
#     --adjust-extension \
#     --span-hosts \
#     --convert-links \
#     --restrict-file-names=windows \
#     --domains yoursite.com \
#     --no-parent \
#         yoursite.com
#


#   Explicación

#          --no-check-certificate  : para  https
#
#          --recursive : Este especifica el número de subdirectorios de los activos que desea recuperar(ya que los activos como las imágenes son a menudo mantenidos en los subdirectorios del sitio) El valor máximo de la profundidad a la búsqueda de activos es de 5 subdirectorios. Usted puede modificar esto con la level flag justo debajo.
#
#          --user-agent=  : el navegado a  usar
#
#          --level 5 : De búsqueda a través de 5 subdirectorios para los activos. Me gustaría recomendar el aumento o disminución de este si el sitio de destino es mayor o menor, respectivamente.
#
#          --no-clobber : No sobrescribir los archivos existentes.
#
#          --page-requisites : hace wget a descargar todos los archivos que son necesarios para mostrar correctamente una determinada página HTML que incluye imágenes, css, js, etc.
#
#          --adjust-extension : Conserva adecuada extensiones de archivo .html, .css, y otros activos.
#
#          --span-hosts : Incluyen activos necesarios desde fuera así.
#
#          --convert-links: Actualización de vínculos a sitios de trabajo como archivos en subdirectorios en su máquina local(para la visualización de forma local).
#
#          --restrict-file-names=windows : Modificar los nombres de archivo para trabajar en Windows y, en caso de que usted está usando este comando en un sistema Windows.
#
#          --domains yoursite.com :No sigue los enlaces fuera de este dominio.
#
#          --no-parent : No siga los enlaces fuera el directorio se pasen.
#
#
```
## 1.buscamos y descargamos al pagina web
```shell
wget  -e robots=off \
  --no-check-certificate \
  --recursive \
  --level 5 \
  --user-agent= "Mozilla/5.0 (Linux; Android 6.0.1; Moto G (4)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.102 Mobile Safari/537.36" \
  --no-clobber \
  --page-requisites \
  --adjust-extension \
  --span-hosts \
  --convert-links \
  --restrict-file-names=windows \
  --no-parent  \
  https://grupoagama.com/
  
   # --domains dmx.enventer.com --no-parent \ (lo deshabilito por que no lo necesito)

```

## 2. sacamos  las urls que no pudieron ser encontrradas desde el navegador

y lo ponemos en un archivo `log_chrome.txt`

<img src="https://i.imgur.com/nzehj1H.png" >

-- --------------------------

## 3. con el archivo ejcutar el archivo `2_Urls_no_Encontradas.py`
ese archivo sacara las url del  dominio no enmcontrado y las tieneq  copiar


