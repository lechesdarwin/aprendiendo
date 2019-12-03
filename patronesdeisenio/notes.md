# UML lenguaje Unificado de modelado
Es un lenguaje grafico para visualizar ,especificar ,contruir y documentar un sofware

_Nombrede la clase_             _Atributos_
    __Atributos__                 + Public
    +nombew:Type              - Private          
                              \# Protected
-----------------

    __Metofos__
    +someFunction():Type
simbolo de herencia ➡

Simbolo de asociacion es una flecha mas delgada
Asociacion se coontruye a partir de otras la clase de la izquierda toma dentro de sus atributos a la de la izquierda

Simbolo de dependencia ,es una forma de relacion de clases en la que la de laizquierda depende de la derecha y su simbolo es una linea discontinua y 
Simbolo de agregacion, es un tipo de relacion dinamica en donde el tiempo de vida del objeto incluido es dependiente del que lo incluye el simbolo es un rombo y una linea larga
La clase que crea la vida del objeto deéndiente esta al lado del rombo
~~~
Simbolo de agragacion <- es como la de agreagacion solo que este si se borra la clase de la derecha tambbien la de la izquierda
~~~
# Los patrones creacionales
## Son utilizados en vez de la instaciacion directa atravez del construcor.Es decir nos ofrecen una flexibilidad mayor 
Factory Method 
    Define una interfaz de creacion de objeos y las subclases del mismo decidir que tipo de instancia necesitan
Abstract factory
    Es una fabrica de fabrica del patron factory method
Builder
    cuando nuestro objeto es demasiado complejo y el agoritmo de creacion de objetos este es independiente a los demas objetos este debe tener un methodo build,
    este ayuda el desaclopamiento(la no dependencia de dependencias)

Prototype
    Objetivo de crear objetos atraves de un modelo atravez de una instaia prototipica ,si el coste de crear un objeto es demasiado grande lo mejor ser es clonarlo para eso esta este patron 
    esto le permite que un objeto cree una copia de si mismo sin conocer sus clase , clonar un objeto es demasiado mas rapido que crear un nuevo bjeto
Singleton
    Permite que una aplicacion tenga una y solo una instacia de una clase en toda nuestra aplicacion,lo bueno es que nos permite mantener un solo estado
# End creacionales
# Patrones estrucuturales
## Tratan la composicion de las clases y objetos , separan la interfaz de implementacion con el objetivo de crear estrcuturas mas complejas y garantizan que cuando las partes cambian no es necesario cambiar toda la aplicacion
Adapter
    Es un adaptador de clases que no son necesariamente compatibles para que puedean trabajar de manera ordenada
Bridge
    Este patron como su nombre lo indica es un puente entre dos clase que no necesariamente se conocen
Composite
    permite contruir algoritmoso o objetos parecido entre ellos permite crear objetos completos y manejarlos con facilitad, resulata mas complicao manejarlo
Decorator
    Se ultiliza para agregar comportamientos opcionales a un objeto pero no afecta todos los objetos ,solo afecta al objeto implicadoaa
Facade
    Simplificar el sistema para el cliente buscando unificar toda el sistema, objetivo final es ocultar todo la complejidad interna para qu eparesca cosa de niños
FlyWight
    Es un objeto independiente que puede ser utilizado en muchos otros objetos y si no hay crea el objeto necesario y si existe lo retorna
Proxy
    Se utiliza como intermediario para controlar el acceso ,acua como sustituto del objeto original
# End estrcuturales
# Patrones de comportamiento
## Se encargan de definir las formas en las que interacturan y reparten responsabilidades de distintas clases y objetos
Chain of Responsabolitity
    Este permite que varias clases pueden atender un solicitud,este se basa en una jerarquia.Una vez se ha manejado  la solicitud entonces se dice que se ha manejado la cadena,si un objeto no sabe como responder
    dicha solicitud se la pasa al siguiente
Command
Interpreter
Iteractor
Mediator
Memento
Observer
State
Strategy
Template method
Visitor
# End Comportamiento
