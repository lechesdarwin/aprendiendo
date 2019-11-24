dicen que vi es de hombres vamos a ver que ta cierto e
dijo el rofe que se quitaria el sobrero si lo aprendo

$ final de linea ; 0 cominezo de lina tambien | 
H la rimera linea de visualizacion
M la mitad del texto de la visualizacion
L la ultima linea del texto
w ir al primer caracter de la siguiente palabra
e ir al ultimo caracter del la palabra actual
b al primer caracter de la palabra actual
( al comienzo de la oracion siguiente
) final del la racion
ctrl f desplazarse aginado como more <esre va a abajo>
ctrl b <este va a atras o retrocede>
G la ultima linea
numberG ir a la linea number
# marcar pocisiones de con el comando mark 
m letra deja una marca en el actual ocicion del cursor
y como vuelvo a esa marca? ' letrAademarca
 **esto debe ser realizado en el modo  comando<esto se puede hacer con todas la letras del abecedario>**
# modo linea de comando 
q salir
q! salir forzado si guardar
W |guardar cambios y seguir editando
wq |salir y guardar
x == wq
w archivo | guardar con otro nombre y seguir editanod
w! forzar sobre escritura

w >> archivo adiciona el contenido actual al archivo indicado

10 ,30w archivo guarda de las lineas 10 a 30 ene l archivo indicdao
10 ,30w>>archivo | adicionar las lineas 10 30 al archivo

r archivi | trae el contenido del archivo indicado lo inserta debajio de la pocision actual
# INSERT modo comando
i inserta en la pocision actual
I inserta desde el inicio de linia
a inserta despues de la pocision actual
A inserta al final de la de la linea de la o¿ocisioon actual
o inserta un renglon abajo
O inserta unrengon abajo
# replace
+ modo comando 
r letra | con este podras remplazar una sola letra
s | con este se puede ingresar al modo insertar solo que este eliminara el caracter que tenga en la pocicion actual
S | este borra toda la linea y comienza desde el inicio de la misma
C | con este boora todo o que este en su delante depues del cursor
cw | se pone en modo insertar y elimina toda la palabra que tenia adelante
R se coloca en modo remplazo
# eliminar
J este elimina el salto de linea al final y sube la siguiete linea al lado de donde estaba el salto de linea
x elimina el caracter actual de la pocision de l cursor
X elimina el caractere de la pociscion del curso pero a la deerecha
D elimina todos los caracteres desdes la ocicion del cursos hasta el final de la linea
dd eliminala linea actual
numero dd elimina el numero de lineas indicadas
dw elimina los caracteeres hasta le final de la palabra actual
# deshacer y repetir 
u deshace el ultimo cambio realizado
ctrl+u rehace los ultimos cambis realizados (ctrl+y)
. realiza el ultimo comando realizado en vi
:e! vuelve a los camios relizados en la ultima edicion
# busqueda de texto
utilise :set ignorecase -> para ignora minisculas i minisculas
:/texto busca el texto especificado
n proxima ocurrencia especificado del texto de la busqueda anterior
N anterior ocurrencia del texto de busueda
% busca las parejas de {}()[]
f letraword | en la linea actual busca la primera ocurrencia del letraword
F letraword | en la linea actuall busca la primeraa ocurrencia de la letra ctual pero hacia la ixquierda
t letra busca la letra en la linea actual a la derecha del cursor si la encentra se pocisional al un caracter anterior a la letra
T lo mismo que t pero al aizquierda
# remplazo por bloques
\#,#s/busca/nuevo/g | los # deben ser nuemos de un rango de lineas ese remplaza sin confirmacion
\#,#s/busca/nuevo/c pide confirmacions
# buffer
yy copia la linea acutual
dd corta la linea actual
#yy copia el n(#) de lineas a partir de la catual
p recupera el conternido principal y lo pega debajo de la linea actual
P recupera el contenido principal y lo pegan encima
*una cosa interesante es que podemos almacenar en bufferes de la a-z como son las marcas*
"letra yy puede trabajar de la misma manera que las anteriores solo con la diferenciade de la pecion de la letra o direcion del buffer
               
