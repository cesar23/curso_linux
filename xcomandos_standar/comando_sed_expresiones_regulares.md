# expresiones regulares


Referencias:
- 
- https://www.youtube.com/watch?v=wfogZfIS03U

```shell
# :::::::::::: Coincidencias Basicas

.       - Cualquier Caracter, excepto nueva linea
\d      - Cualquier Digitos (0-9)
\D      - No es un Digito (0-9)
\w      - Caracter de Palabra (a-z, A-Z, 0-9, _)
\W      - No es un Caracter de Palabra.
\s      - Espacios de cualquier tipo. (espacio, tab, nueva linea)
\S      - No es un Espacio, Tab o nueva linea.

# :::::::::::: Limites

\b      - Limite de Palabra
\B      - No es un Limite de Palabra
^       - Inicio de una cadena de texto
$       - Final de una cadena de texto

# :::::::::::: Cuantificadores:

*       - 0 o Más
+       - 1 o Más
?       - 0 o Uno
#                                              Coincidencias ()
{3}     - Numero Exacto                       # demo: a{3}   => (aaa) a 
{3,4}   - Rango de Numeros (Minimo, Maximo)   # demo: a{3,4} => (aaa) (aaaa) aaa
{3,}    - Rango de Numeros (Minimo, )         # demo: a{3,}  => (aaa) a (aaaaaaaa)

# :::::::::::: Conjuntos de Caracteres

[]      - Caracteres dentro de los brackets
[^ ]    - Caracteres que NO ESTAN dentro de los brackets

# :::::::::::: Grupos

( )     - Grupo
|       - Uno u otro
```
