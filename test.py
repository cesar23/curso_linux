"""
Funciones.
Es un connjunto de sentencias que pueden ser invocadas varias veces durante la ejecución de un programa.
Las ventajas del uso de las funciones son:
1) Minimización de código.
2) Aumento de legibilidad.
3) Fomenta la reutilización de código.
11111111111
22222222222
33333333333
44444444444
55555555555
"""

imprimir("== Función básica ==")
def test():
	print("Esto es un test")
"""
Pasamos parámetros YA
"""
imprimir("== Función con paso de parámetros ==")
def test2(a, b):
    imprimir(a)
    imprimir(b)

imprimir("== Función con retorno de valores ==")
def saludar(nombre):
    return "Hola %s" % nombre

saludo = saludar("Alex")
imprimir saludo


"""
cesar
cesar
jeny
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
wwwwwwwwwwwwwwwwwwwww
"""