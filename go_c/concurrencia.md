#concurrrencia TRATAR CON MULTIPLES COSAS A LA VEZ
#PARALELISMO HACER VARIAS COSAS A LA VEZ
#un procesos es una instancia del programa o una programa que esta en memoria mientras que un hilo es un subproceso de esa instancia y este puede tener los subprocess que el proceso padre crea necesariio y estos compartiras datos entre ellos
#podemos configura el numero de nucleos que usaraq la gorutinas con runtime.GOMAXPROCS(n) donde n es el numero de nucleos go recomineda usar las gorutinas en un solo nuvleo ya uqe en alginos caso useed sentira que su programa se comporta de manera lenta 
cuando e algunis caso GOMAXPROCS>1 pero esto a que se debe a que los canales pasan mas tiempo comunicandose go tiene algo M(rutinas):N(procesos) M rutinas que deben programanrse en N subprocesos
LAS GORUTINAS TRABAJAN DE MANERA COOPERATIVA NO SE CREA OTRA GORUTINA HASTA QUE SE BLOQUEE LA GORUTINA ACTUAL
	·los casos de bloqueos puede ser
		·Entrada de re
		·dormido
		··operacion de canal
		·bloqueo de primitivas en el paquete de cooperacion
Si la gorutina no se bloquea puede prvar al hilo que lo multiplexo matando a las otras gorutinas en el proceso hay algunos remedios pero si se hace esto es considerada mala programacion
Todas las gorutinas son anonimas es por eso que no comparten la misma memoria
#anatomia de los canales
tecnicamente un canal es una tuberia de datos donde se pueden pasar o leer por la tanto un gorutina puede enviar datos a un canal mientras
que otras gorutinas pueden leer esa misma informacion desde el mismo canal
como podemos crear un canal?  var x chan int -> recordar que en un canl solo se puede transportar el mismo tipo de dato
creando de la froma anterior esta bien pero no se puede utilizar la manera correcta seria
x:=make(chan type) los canales por defecto son punteros pero tienen una sintaxis diferencte para acccder a los datos
como le llenamos datos a un canal ?-> c <- datos esta seintaxis nos indica que queremos meter datos al canal c
pero como leermos los datos de un canal o como se lo pasamos a una variable <-c esta es la sintaxis de un return?
s tenemos una varible que contienen los datos de un canal? -> 
var data int
data = <- c
#las operaciones de canal estan bloqueadas por defecto asi como el time.sleep cuando se escriben datos en un canal la gorutine se bloquea 
#hasta que otra gorutine las lea ,bueno estas operaciones de canales le dicen al programador que programe otra rutina es poreso que no se queda bloqueado todo el timepo en las misma rutina
#EXAMINANDO FIRST SAMPLE
cuando escribimos o leemos datos en un canal esa gorutina se bloquea y el control pasa a las gorutinas disponibles
como cerramos ,averiguamos si un canal se puede leer o esta abierto
val,ok := <- chanel donde ok sera true si esta abierto o se pueden realizar operaciones de lectura sobre el canal y sera false si esta cerrado o no se pueden realizar mas operaciones de lectura
y se cierra con la funcion close(channel)
#CUANDO SE REALIZA UNA OPERACION DE LECTURA NO SE BLOQUEARA LA?una gorutina puede bloquearse si el que lo esta leyendo el canal esta vacio o cerrado
cuando el canal esta cerrado el valor leido de la rutina es cero del tipo de dato del canal
bueno al recorrerlo en un bucle pordriamos hacer la comprobacion de manera manual pero existe una manera mas sencilla utilizando el range este leera los datos uno por uno hasta que se cierre
si este canal no se cierra go entrara en un deadlock punto muerto
Hasta el momento hemos creados channel con la funcion make sin especificarl la capaidad,make por defecto la capacidad es 0 esto significa
que al momento se añadir una dato al canal el buffer llena y por lo tanto se bloquea o lo que este escrito en este canal esta inmendiatamnte disponible para leer
***cuando el tamaño del buffer es diferente de de y es n la rutina no se bloquea hasta que el buffer este lleno,bueno una vez este este lleno arrojara el ultimo valor osea esto funciona como una cola FIFO***
***pero esto tiene una trampa al momento de leer el buffer tiene sed lo que significa que cuando se inicia la operacion de lectura este continuara hasta que el buffer este vacio***
***bueno hasta el buffer no reciba n+1 operaciones de envio no se bloqueará***
***len function regresa el numero de valores no leidos y cap es la capacidad del buffer***
peudno que pasa si agregamos elemntos a  un buffer y lueego lo cerramos bueno tan solo los extraemos ya que quedan almacenados en el buffer
Canales unidireccionales
solo lectura make(<- chan type)
escritura make(chan <- int)
canal como tipo de datos de un canal-> chan chan type
Select declaration es igual que swith pero este solo se utiliza con canales (por el moneto podriamos decir que se encarga tratar un solo canal de muchos osea el que esta primero)
Que pasa si los todoslos canales estan bloqueados bueno se podria decir que select eligira un canal aleatoriamente
Tambien esta la sentencia select default case hace que la declaracion select siempre sea sin bloqueo 
eso significa que sed o recived desde cualquier canal con o sin buffer siempre sea sin bloqueo
#Waitgroup-> imaginemonos que queremos saber si todas las gorutinas  han terminado su trabajo? esto es algo contrario al select declaration
bueno es facil
el pkg sync nos ayudara en eso Wait group tiene un contados que tien el numero de  gorutinas ejecutandode y tamben tiene metodsos 
	#supongamos que inicio una nueva gorutina
	var wg sync.WaitGroup -> creamos una structura vacia
	wg.Add(int) -> por que debemos añadir manualmente por que wait group no puede adivinar el numero de gorutinas (nota importante tambienpuede recibir nuemero negativos)
	go some(functio)
	y dentro de some function sabiendo que ya ermino nuestra funcion hacemo Done() de la instancia de la structura de ait grup creado esto eliminara el contador de waitgroup
y como podemos asegurarnos que terminaran todas la gorutina bueno con el metodo Wait() este metodo bloqueara la gorutina principal y lo desbloqueara una ves el contador de wait grop este en ceroi:
#una regla de oro es evitar recursos compartidos entre gorutine ya que vimos el ejemplo de medium sobre los recursos compartidos de go y no siempre funciona el algoritmo de go pero nos podemos ayudar de Mutex struct del pkg sync como bloqueamos cualquier operacion que quiera invadir nuestro espacio? m.Lock() y desbloqueamos con un m.UnLock() dende m es una instancia de var m sync.Mutex pasado por referencia
