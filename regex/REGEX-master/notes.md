#el (.)
el caracter (.) en cuentrame todo lo que sea un caracter denota cualquier caracter este selecciona todos los caracteres osea uno a uno
#\d encuentra todo lo que sea digito
#\w encuentra todo lo que pueda ser parte de una palabra o todos los caracteres posible de una palabra
#\s busca todos los espacion
Las clases en expresiones reguñares son un conjunto de expresiones regulares por ejemplo [0-9] ==\d
Cuando hay una coalicionde la clases por ejemplo el de los caracter
. escapamos el caracter \.
Al crear clases no interesa el orden
0-9 === 0123456789
[0-9a-f]===[0123456789abcdef]
#<clase>* -> 0 o muchos vete por todo
#<clase>+ -> 1 o mas caracteres , almenos debe haber un digito
#<clase>? -> 0 o 1 caracter:::::::este elemneto coje la clase a su izquierda y trababaja sobre ella
#{n,m} contadores <clase>{cotai,cotas} esto en vez de hueveverar
  por ejemplo si queremos 150 digitos no vamos a escrbir \d\d\d\d\d\d....\d=={1,150}
  de 4 a mas dgitos osea start hasta donde tengas {4,}
# ^  este es un caracter de negacion al principio de una clase cogeme todo lo que no sea un numero [^0-9]
# empieza con esta clase ^<clase>$ $ termina con ese caracter
##los caracteres dentro de la expresion regular son clases example
  https? haiga o no la s
#los cara () son agrupaciones de mach hasta 9 grupos posibles |||||||||| o agrupar los matches
  (regex)(regex)==> esto es $1 $2 el simbolo de $con un numero es un grupo del match
  por cada match que haga en cada linea lo asocia a sus varibes
cad
