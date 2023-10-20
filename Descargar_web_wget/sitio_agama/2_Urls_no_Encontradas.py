# coding=utf8
# the above tag defines encoding for this document and is for Python 2.x compatibility

import re
# -------------------------------------------
# ------------- 1. leemos el fichero ----------
# -------------------------------------------
fichero = open('./log_chrome.txt','r')
lineas = fichero.readlines()
text=''
for linea in lineas:
	text=text+linea



# -------------------------------------------
# ------------- 2.aqui sacamos las urls de error ----------
# -------------------------------------------
extesiones_buscar="(.woff|.woff2|.tf|.jpg|.png|.webp|.css)"


regex = r"https\:\/\/grupoagama\.com\/.*{extensiones}".format(extensiones=extesiones_buscar)



matches = re.finditer(regex, text, re.MULTILINE)

for matchNum, match in enumerate(matches, start=1):

	# print ("Match {matchNum} was found at {start}-{end}: {match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))
	print ("{match}".format(matchNum = matchNum, start = match.start(), end = match.end(), match = match.group()))

