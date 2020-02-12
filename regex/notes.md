Type Regex Successful if the enclosed subexpression . . .
Positive Lookbehind (?<=......) successful if can match to the left
Negative Lookbehind (?<!......) successful if can not match to the left
Positive Lookahead (?=......) successful if can match to the right
Negative Lookahead (?!......) successful if can not match to the right
(?:x) encuentra x pero no recuerdes la busqueda es decir que no se guarde en las variables $n
x(?=y) encuentra x si y solo si le sigue y
x(?!y) encuentra x si y solo no le sigue y
\t esto representa un tabulador
\s esto reprenta cualquier espacio en blanco eso incluye espacios en blanco,nuevas lineas,tabulacion incluso el
retorno de carro
\t a tab character
\n a newline character

\r a carriage-r eturn character
\s matches any “whitespace” character (space, tab, newline, formfeed, and such)
\S anything not !\s"
\w ![a-zA-Z0-9R]" (useful as in !\w+, o" stensibly to match a word)
\W anything not !\w, i " .e., ![ˆa-zA-Z0-9R]"
\d ![0-9], i " .e., a digit
\D anything not !\d, i " .e., ![ˆ0-9]"
/x es una expresion que permite limpiar la expresion si los trabajamos de una maner a mas limpia para nosotros
ya que las regex trabana en perl por lomenos como
/regex/caseReplace/modifers or {regex}{caseReplace}modifers !regex!replacement!modifers
/i es un modificador de not casesensetive
Recuerdan el \<(inicio) \>(final)de un palabra bueno normalmente de utiliza ahora el \b
\binicofin\b
s/regex/replacement/
/g de manera global
m/regex/ esto devuelve true si hace match
-. = dentro de las clase de caracteres son consideradas como otro cualquier otro caracter tambien pero no estoy muy
seguro con ? y !
metacaracteres=C
^$ = todas las lineas vacias
^someword$ = todas las lineas que solo y solo comienzen y terminen com someword
^ = todas la lineas que hasta las que son vacias
#Todos los simbolos o caracteres que se utilizan en las expresiones regurares se llama metacaracteress
Las expresiones regulares no entienden del ingles pero si entetiende sobre secuencias de bytes y lines en los archivos

# Start and End of Line
 Existen dos C que no ayudan a decir la secuencia de caracteres con la que inicia una linea y con las secuencias con las
 que termina
^para el inicio y $ para el final
^cat -> encuentrame las lineas que comienzan con cat o mejor dicho encuentramen las linea que contengan c seguidamente de
a y seguidamente de t asi mismo funcionan con el C de $

# las clases de caracteres [···]

Son agrupaciones de posibles coencidencias de muchos caracteres example:
    [some] encuentra concidencia entre s 'o' o 'o' m 'o' e
    rep[eeat]t encuentra repet or repeat or repeer
El orden no itnereza demasiodo en las clase de metacaracteres __Enumerar los caracteres que deseo incluir en la clase__

# El metacaracter de negacion ^
Pero ocurre lo contrario cuando usamos el o la expresion [^···] esto es no enumerar los caracteres que deseo incluir en
la clase (sample: 'q[^u] cualquier combinacion menos qu
El ^ es un meta caracter solo y solo si esta al inicio de las la clase([^]) o esta siedo utilizado para señañar el inicio
de linea si no cumple eso se convierte en un caracter mas del monton

# Cualquier caracter con el dot(.)
esto significa cualquier caracter

# El metacaracter de alternancia |
esto basicamente significa un o esto o esto solo se puede hacer el numero de condiciones que desee

esto puede ser agrupado en
  some1|some2|some3 or (some1|some2|some3) or [some1|some2|some3]

# Diferencias entre [] or ()
Lo que sucede es que [] enumera es como haz match de cada coincidencia de los caracteres dentro de la clase
y los () son una agrupacion los metacaracteres que cumplen con toda la concidencia son un grupo y no va haciendo
match de forma individual
Las clases hacen match exactamente con un solo caracter mientras que los () con un grupo
# Algunos truquillos de egrep

incio de palabra = \<
fin de palabra = \>
# cuantificadores
# Items opcionales ? (cero o uno)
el metacaracter ? se coloca despues del caracter que es opcional su existencia es decir puede o no aparecer 0 o
1

# + (1 o mas)
Se coloca delante del caracter que se desea hacer coencidir . en realidad significa es hacer coencidir la mayor
cantidad de veces el patron y no se conforma con resultados nulos y los caracters o clasesq que hace math se
vuelven un grupo
# * (0 o todos lo que venga)
# Rango de metacaracteress  {min,max}
{2,5} Puede agrupar de 2 en dos o hasta un maximo de 5 elementos en un solo grupo es decir supongamos que tenemo
varias a repetidas esto indicaria que solo tomaria aquellas a que esten de dos en dos o de 3 en 3 4 en 4
# look around
(?=one)dos dos hace matxh si solo y solo especificamente dos hace parte de uno
# Scapando \
El metacaracter \ es especial por que puede comvertir en un personaje mas cualquier otro metacaracter es decir
 puedo hacer que el metacaracter punto sea un punto comun y cualquiera \.
Las fub expresiones pueden ser indentificadas con $1,$2,$3 que es el grupo de math que hacen o cumplen el regex
de los grupos ()
el primer grupo de parentesis es el $1 el interior de $1 es $2 y el $3 el el grupo ([cf])
$input =~ m/^([-+]?[0-9]+(\.[0-9]*)?)([CF])$/\

# working con perl
las variables se declaran como php
el operador =~ dice
$celcios =~ m/[0-9]+$/
dice el contenido de celcios verifica si coencide con la siguiente expresion recular
la palabra clave 'last;' termina de inmediato un bucle while
<> es un operador divertido como la funcion get line es decir lee cuaquier achivo despues de los comandos que
se encuentras despues de los flags de perl


# end working con perl


Constr ucts Covered in This Section
Character Representations
☞ 115 Character Shorthands: \n, \t, \a, \b, \e, \f, \r, \v, ...
☞ 116 Octal Escapes: \num
☞ 117 Hex/Unicode Escapes: \xnum, \x{num}, \unum, \Unum, ...
☞ 117 Contr ol Characters: \cchar
Character Classes and Class-Like Constructs
☞ 118 Nor mal classes: [a-z] and [ˆa-z]
☞ 119 Almost any character: dot
☞ 120 Exactly one byte: \C
☞ 120 Unicode Combining Character Sequence: \X
☞ 120 Class shorthands: \w, \d, \s, \W, \D, \S
☞ 121 Unicode properties, blocks, and categories: \p{Pr op}, \P{Pr op}
☞ 125 Class set operations: [[a-z]&&[ˆaeiou]]
☞ 127 POSIX bracket-expr ession “character class”: [[:alpha:]]
☞ 128 POSIX bracket-expr ession “collating sequences”: [[.span-ll.]]
☞ 128 POSIX bracket-expr ession “character equivalents”: [[=n=]]
☞ 128 Emacs syntax classes
Anchors and Other “Zero-Width Assertions”
☞ 129 Start of line/string: ˆ, \A
☞ 129 End of line/string: $, \Z, \z
☞ 130 Start of match (or end of previous match): \G
☞ 133 Word boundaries: \b, \B, \<, \>, ...
☞ 133 Lookahead (?=˙˙˙), (?!˙˙˙); Lookbehind, (?<=˙˙˙), (?<!˙˙˙)
Comments and Mode Modifiers
☞ 135 Mode modifier: (?modifier), such as (?i) or (?-i)
☞ 135 Mode-modified span: (?modifier:˙˙˙), such as (?i:˙˙˙)
☞ 136 Comments: (?#˙˙˙) and #˙˙˙
☞ 136 Literal-text span: \Q˙˙˙\E
Gr ouping, Capturing, Conditionals, and Control
☞ 137 Capturing/gr ouping par entheses: (˙˙˙), \1, \2, ...
☞ 137 Gr ouping-only par entheses: (?:˙˙˙)
☞ 138 Named capture: (?<Name>˙˙˙)
☞ 139 Atomic grouping: (?>˙˙˙)
☞ 139 Alter nation: ˙˙˙<˙˙˙<˙˙˙
☞ 140 Conditional: (?if then <else)
☞ 141 Gr eedy quantifiers: ,, +, ?, {num,num}
☞ 141 Lazy quantifiers: ,?, +?, ??, {num,num}?
☞ 142 Possessive quantifiers: ,+, ++, ?+, {num,num}+

# Agrupacion de parentesis 

## gruping solamente (?:regex)
Esto se le llama asi por que los mathc que suceden no son recordados en la variables $1, $2, 
etc es decir funciona como una especie de clase

## Name caprture (?<Name>regex) or en python y phpp (?P<Name>)
Esto es para hacer las cosas mas bonitas como hacerlo mas descriptivo envez de haccde atraveez 
de indice podemos acceder atraber de nombre (recuerda que cada leguaje tiene su forma)

Quede 164

Luego de eso da un nuevo enfoque de las caracteristicas de un motor de busqueda y como construir unos motores
En el apratado extendes examples nos muestra ejemplos mas avanzados
