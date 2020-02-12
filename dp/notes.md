# Patrone de diseño

Un patron de diseño resuleve un problema y se puede dividir en Creacional,Estrucutral y 
Conductal.
# Patrones creacionales definen la manera de creacion de objetos
# The factory pattner

Esto se base en que un cliente(el codigo del cliente ) Pide un objeto a una fabrica y este le 
devuelve un objeto que pidio sin necesidad que el cliente se entere del proceso y que solo la 
fabrica "lleve la cuenta de creacion de objetos"
existen dos maneras
    the factory method
    The abstract factory

## the factory method
Este te devuelve el objeto que necesitas 
Es posible tener varios metodos frabicas pero recordar que tiene cada nuevo metodo tiene que 
tener relacion entre objetos comunes ejemplo un metodo de conexxiona bases de datos(Mysql,
SQlite)
### implementacion

# the abstract factory

No es mas como la analoogia que este puede ser configurable de acuerdo a parametros a ingual 
qu un robot en una fabrica de autos

# El patron builder
Este es bueno para crear objetos complejos y que no nos permite retornar el objeto terminado si una de las partes no fue terminado
Este Objeto complejo que contruye builder debe ser lo mas sencillo y configurar lo necesario en su constructor ya que el builder se encargara de los demas pasos.
Existe una implementacion del patron builder modifificado llamado builder fluyente que consta de un metodo llamado build() que 
retorna el objeto final , algo asi
>pizza = Pizza.PizzaBuilder().add_garlic().add_extra_cheese().build()
Este consta de dos partes importante
    The Builder:El componente de crear las diversas partes complejas del objeto, como lo puedo decir es que contienen 
    todos los metodos(acciones) que se encargara de llamar el mismo programador o El director

    The Director:Es el proceso de controlar la creacion de elemntos atravez de una instancia
    del builder llamando sus diferentes metododos de creacion de los objetos

# Otros patrones creacionales

El patron Prototype este es util para crear nuevos objetos atravez de otro mediante la tecnica de la clonacion
El patron Singleton un solo objeto para toda nuestra aplicacion



# The prototype pattern

Este es util cuando se quiere mantener una copia exacta de un objeto o queremos crear el mismo objeto con cambios en alguna partes

>Python tiene un metodo que permite agregar atributos a objetos 
>de forma dinamica 
>setattr(obj,clave<string2w0pq2'>,valor)
clone(indntificador,**attrs)
El Prototype tiene dos metodos adicionales opciones mas
register(indentificador,objeto) y unregister(indentificador) , el metodo register sirve para hacer seguimiento del objeto y el objeto unregister para eliminarlo
Es in Objeto independientez

# Singleton

Este patron restringe la creacion de instancias de un objeto a uno solo para toda la aplicacion y tambiem restringe la clonacion
# Patrones structurales

Estos patrones proponen la compocision de dos objetos para crear una nueva funcionalida

# The adapter pattern

Esten patron hace posible la comunicaion de dos interfaces imcompatibles,un ejemplo es hacer compatible codigo viejo 
con codigo nuevo o viceversa

# Decorator pattner 

El patron decorador dota de nuevas funcionalidades a una funcion


# the bridge pattner

Utilizado para acoplar dos interfaces distintas , como los drives con el OS
O tambien cuando desea compartir una implementacion con multiples objetos en lugar de crear un objeto para cada caso
Ejemplo podria accder a buscar un archi atrave de una pagina web ,desde ftp,file systtem or data base y siempre obtendrar es atchvi

Como queremos accder a un recurso ,web,system,df,ftp. 
Solo necesitamos una interfaz comun entre todo los metodos y que un objeto se encaque de manejarlo

# facade
"Es una manera simple de encender un sistema muy complejo"
El patron facde permite encapsular clases funciones complejas en una sola interfaz simple para el cliente y tambien segura
porque este no accede a lo mas completo que pueda romper el codigo

# Otros patrones creacionales
flyweiht, MVC y proxi
# flyweigth

El patron peso de mosca viene a solucionar problemas en sistemas muy grandes donde crean 
demasiadis objetos el patron de peso de mosca le encseña a como compartir memoria entre 
objetos  similares
 # Model view Controller

Este patron se base en separar las responsabilidades entre los 3 componetes un buen mvc consta de un modelo intelligente, una vista tonta y un controlador elocuente el controlador puede verve como el pegamento entr el model y la vista
Un modelo intelligente significa que este conoce el modelo de negocio un vista se encarga de solo pedir y mandar datos y representarlos

# Proxy

Imagina que quieres realizar otras acciones mas importantes antes de crear el objeto

+ Proxy remote es es un punto que puede tener diferentes direcciones
Ejemplo un proxy server 

+ Proxy virtual "atrasa" la creacion del objeto hasta cuando sea necesariamente necesario
+ Proxy protection controla quien quiere accder al objeto

+ smart proxy : proxy inteligente o de referencia se le llama asi por que realiza ptras acciones antes de crear el objeto
# patrones de comportamiento
# Otro patrones de comportamiento

# Chain responsability pattern

Pongmaos en la analogia de el diseño de una red(una de esas red antiguas donde compartian internet por un solo clave)cuando
se manda un mensaje de difusion un broadcast va passando por todos los nodos cada si no es para el el o no sabe como 
trabajar con los datos se lo pasa al nodo vecino hasta que llegue al final
 
# The command pattern

Estre patron sirve para encapsular una operacion(deshacer,reacer,copiar,pegar) en un objeto.
El invocador no necesariamente conoce la implemetacion
Imaginese que esta en un retaurant y le da la arden al camarero(generalmente en papel)(este vendria a ser el comando
el camaero se lo pasa la chef y este co colocal en la cola de pedidos y cada pedido es un proceso de preparacion
diferente
# patron observer

Pongamos en la analogia de una subasta cada que un participante aumenta el precio el 
subastador(el suject, publicador)
Informa del cambio a todos los participantes(subscriptores) asi todos los participantes 
piensan en una accion(que precio ofreceran) al mon}mento de ser notificados 
El obeserber notifica cada vez que actualiza sus datos

# The state pattern
Esiste dos componentes claves __El state(el actual) y la transicion(que es la accion o el movimiento a realizar)__

Por ejemplo el encendido de una computadora pasa del stado OFF a ON e esa trancicion ocurren 
acciones

# pattern interpreter
DSL    domain especific languaje 
Un ejemplo de la vida real es de un interepreter es un musico que interpeta las notas musicales 
para que atraves de su intrumento sea agradable para nostros, tambien hay algo tam complejo 
como un iterpreteer

# el patron de estrategia 

como su nombre lo indica busca o elige la mejor solucion a un problema en tiempo de ejecucion
Un jemplo es que puede elegir ir en bus,metro o taxi depende de lo apurado que estes cada de 
estos metodo tiene un costo diferente

# Memento(recuerdo)

El pattron de recuerdo es exelente cuando necesiamos tomas una instantanea a un objeto
o guardar el estado actual de un ibjeto para luego seguir cambandolo y si depues decesa volver 
al estado riginal
un buen memento debe tener un metodo save_state y un restore_state estos son autodescriptivos

# patro iterator

Este patrones utilizado para atravesar el contenidop de un contenedor por algoitmops especificos
Python vien integrado con los magic methos
__iter__ debe retornar quien sera el interador __next__ debe retornar el siguiente valor en java ofrece la interfaz 
Iterator

# template pattern

__no siempre se logra construir codigo generico__
Este se utiliza para evitar generar redundadncia de codigo por ejeemplos los templtes de cp y java 
O los empleados de una empresa de mierda que todos tienen la misma rutina pero difrentes obligaciones

# Observer and reactive programing

Tratar con un monton de eventos ,un flujo de eventos y mantener nuestro codigo limpio

# Retry

Vea el patron retry como lago que reintenta si un servicio externo falla ,no debe verlo como las Exeptions,por
ejemplo cuando la carga del servidor llega a maximo e intenta reponerse

# circuit break

veamos este patron como un rele que cambia el estado, por ejemplp supongamos que tenemos dos servidores y un 
"balanceador" que este se encarga de devolver la peticion a uno si este falla envia al otro servidor

# cache-aside
Es como redis
# throttling(estrangulamineto)

Este patron se base en estrangular las conexiones, como la velocidad, limites de conexxionespor dia por hora ,
cenexxiones concurrentes
En flask podemos aplicar esto con flask-delimeter package
