# NOTES
  + fallthrough -> este estamento lo que hace es tomar el siguiente caso<contex sobre swich declaracion> aunque no sea verdadero
  + los swich->case pueden tener multiples casos y basta que solo uno sea verdadero para que el caso sea verdadero case 2==2,3==4,5==2 
# NOTESEND
# estas cosas como %yalgunaletra se llaman verbos
iota se reinicia cada vez que aparece dentro de la keyword const este incia con el valor 0  es usado como un enumerador o ENUM o constantes enumeradas 
o un _ implicito para iota+1
gobyexample.com para ver ejemplos de go

#interfaces y polimorfismo<poli=varias morfismo=formas formas de realizar algo> 
las interfaces son una firma de metodos o comportamiento si una estructura utiliza un metodo de un interfz se dice que es de tipo de la interfaz o que la implementa

  # asercions o aserciones de tipo
  esto es como que yo se que algo es de un tipo es decir si tengo una interfaz como parametro y yo se que hay unna structura que 
implemntea esa interfaz y quiero utilizarlos interfasvar.(typequeestoyseguroques) esto retorna ok y el valor del tipo asertions  value,ok=s.(typede)
***Si una interfaz algunos de su metods recibe un receptor de tipo puntero entonces se 
dice que es un interfaz de tipo puntero dinamica*** y para hacer el asertion tendria que ser recobiendo un puntero 
#concurrencia
como hemos visto en python el lock.aquire() aquiere el hiloa ctual y no lo suelta hasta hacer un lock.relase() en go eso se cosigue en el pkg sync 
var mutex sync.Mutex()
mutex.Lock() bloquea el acceso a una seccion de codigo y variables
mutex.Unlock() desbloquea el acceso a las variables o seccion de codigo
 ***ATOMIC UN PAQUETE INTERESANTE LEERLO***
untime.Goshed() // Yield sede la ejecucion a la siguiente gorutina

# compilacion cruzada no es mas que que compilar para un arquitectura ajena a la que se realiza el acto
como se hace?
facil ->  darwin@dpej:~$GOOS=sistemaoperativo GOARCH=arquitectura go build package
# canales los canales se bloquean cuando leen 
un canal es una tuberia si el otro etremo no tiene quien reciva entoces se bloquea el codigo 
*los canales se almacenan en FIFO*
canales direccionales 
solo send o que solo recibe valotre can := make(chan<- int)
solo lectura can := make(<-chan int)
los canales se cierran con close(canal)
range administra los canales de forma intersante
patron Fan In consiste en trabajar con un solo canal y este se llena de acuerdo a su dato
Fann out -> toma un problema y dividelo

