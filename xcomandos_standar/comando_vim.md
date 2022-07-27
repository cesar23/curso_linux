## Copiar una Linea
1. modo visual  (Tecla v)

![](https://i.imgur.com/56HYQmW.png) 

2. y ahora  si  queremos  COPIAR   presionamos la  letra `y` para  Copiar

3. Ahora para PEGAR  , nos  posicionamos donde  pegaremos  y presionamos  la letra `p`


## Copiar una palabra

Presionamos teclas `y+w` Y luego pegamos tecla `p`

## Cortar una linea
Presionamos teclas `dd` Y luego pegamos tecla `p`

## Deshacer cambios
`Esc + :u` Y luego enter (hacer esto n veces para ir quitando todos los cambios)

## Moverse por el fichero ( inicio y fin del archivo)
Además de usar los cursores para movernos por el archivo, podemos movernos de una manera más rápida con algunos comandos:

`gg` – Ponerse al inicio del fichero.
`Shift+g` – Ir a la última línea del fichero.


## Buscar palabras
`Esc + :` Y luego `/print` y para encontrar mas coincidencias presionar tecla `n`

![](https://i.imgur.com/zeo6QJN.png) 


## Buscar y reemplazar palabras globalmente
`Esc + :` Y luego `%s/print/imprimir/g`
- `%s`    => forma de buscar globalmente en el documento
- `/g`    => que reemplaze de manera global


![](https://i.imgur.com/9YAMPa0.png) 

ahora

![](https://i.imgur.com/m6bDRUV.png) 



## Buscar y reemplazar palabras globalmente 👌 Confirmando cambios
`Esc + :` Y luego `%s/print/imprimir/gc`
- `%s`    => forma de buscar globalmente en el documento
- `/gc`    => que reemplaze de manera global y cada reemplazo nos pedira confirmar



![](https://i.imgur.com/iHYgy8l.png) 

luego nos aparecera

![](https://i.imgur.com/B9aHgwr.png) 
