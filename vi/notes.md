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
ctrl+R rehace los ultimos cambis realizados (ctrl+y)
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
 remplazo por bloques
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
# mas dinamismo al copiar pegar ? SI
podemos utilzar el poder marcas
copiar desde una marca hastas donde este la pocision actual
	y' marca
cortar d'marca
#copiar pegar desde el modo lina o :
n,my copia desde la linea n a la m y lo pegamos desde :put esto pegara el buffer principal debajo donde se encuentre el cursor
5,10 co 20 copia desde la linea 5 al 10 y lo pega debajo de la linea 20
5,10 co $ los mismo que arriba solo que lo pega al final del documento
5,10 co 0 los mismo que arriba solo que los pega al inicia del documento
# volver en el tiempo 
:earlier Xs|Xm|Xh -> esto nos permite volver en el tiempo segundos horas minutis
# ir a la linea ngg vamos a la linea n
#pegado externo acticacion y deactivacion :set paste | set nopaste
# cargar un archivo :e filename y si queremmos abrir un ecplore :e .
# wa guardar en todas las pestañas wa! forzar salida
# abrir/abrir cerrar pestaña :tabe/:tabec
#navegando en las pestañas 
gt/gT ->siguiente/anterior ó :tabfirst/tablast
# creando divisiones horizontal/vertical :split/:vsplit o :sp/:vsp y navegamos con ctrl+W+W o ctrl+W msa teclas direccionalesi#session(todo nuestro actual entorno de trabsjo divisiones yblalalal) 
#guardar/cargar sesionactual :mksession nombre/source nombre ó mks/so o desde terminal vim -S nombre
# si queremos abrir mucho archivos en forma de pestaña vi -p archivos
pero si la cagamos y abrimos en forma de buffer vi achivos 
:set sba lo arregla

# las pestñas de vi comienzan con pocision 0 y nos movemos desde modo linea de comando con 
:tabm posicion 
si queremos ejecutar un comando en varias pestalñas es tabdo comando
# el comando :make hace o llama al linter del lenguaje de programacion y nos avisa de los errores
#gd  salta al nombre de la declaracion ya dea una funcion o varible clase osea me paro sobre digamos clase y va a buscar los mismo que donde me pare
#/ ayuda a busca sentencias 
#sumar/restar al numero que este abajo del cursor ctrl+a/ctrl+xfor a=42
#grep "texto" busca la palabra en todos los fivhceros y si  le ponemos -r lo hace recursivamente
moverse al siguiente que no sea tab o espacio INTRO y viceversa - o mas y menos 
* busca las palabrAS que se parescan donde esta el cursor
modo visual o sirve para jugar con las selccion
y copia 
c corta 
p pega
mayus/minus gU/gu
**las configuraciones se encuentra en $HOME/.vimrc**
INVESTIGAR SOBRE OMMI DE VIM 
#para ver las lineas que aparece una palabra que esta debajo del cursor osea donde esta el cursos esa es -> modo comando ]I
