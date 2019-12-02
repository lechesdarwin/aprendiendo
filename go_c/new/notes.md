En go existe un packete que contiene implicitamente algunos tipos interfaces sin necesidad de importaarlo ese es el paquete **builtin**
# NOTES
  + fallthrough -> este estamento lo que hace es tomar el siguiente caso<contex sobre swich declaracion> aunque no sea verdadero
  + los swich->case pueden tener multiples casos y basta que solo uno sea verdadero para que el caso sea verdadero case 2==2,3==4,5==2 
# NOTESEND
# estas cosas como %yalgunaletra se llaman verbos
iota se reinicia cada vez que aparece dentro de la keyword const este incia con el valor 0  es usado como un enumerador o ENUM o constantes enumeradas 
o un _ implicito para iota+1
gobyexample.com para ver ejemplos de go

## interfaces y polimorfismo<poli=varias morfismo=formas formas de realizar algo> 
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
# Recover ,defer,panic
Defer function is call despues del return o algo parecido te volara la cabeza un poco el siguiente ejemplo

```golang
    def foo() i int{
        defer func(){i++}()
        return 1
    }
```
    //call foo 
    foo() // return 2 💥

panic ->function recibe cualquie valor
al ser llamada mata la gorutina actual donde esta especialmente casi inmediato la func donde es llada por que aun le queda un poco de tiempo para resolver los defer(alugunos no todos) el valor que se pasa puede ser recueperado por recover
panic("pi")}
if rec:=recover();rev!=nil
    println("el valor de panic es ",r)// el valor de panic es pi

# dato curioso de log  se puede establecer un fichero de donde guardar los logs en log.SetOutpu()
# Documentacion 
Antes de escribir documentacion debemos leer documentacion
golang.org/doc/ -> documentacion de la libreia standar
godoc.org -Z 
# godoc -> capaz de levantar un server de documentacion
godoc -src pack firm -> muestra la implementacion en codigo del llamdo
godoc -http :port crea un server local de toda la documentacion de la libreria standar hasta nuestro paquetes

# go doc -> imprime al doc de const variables funcion
    go doc paquete -> e ir deglosando
    go doc -> sin argumentos toma la doc del paquete que esta actualmente llamndo

@ Agragar Docuemntacion breve al package
> // Package namepackage somedescription
> package namepackage 

@agreagando documentacion a funciones interfaces structuras
> // Name descripction
> // Opcional description
> // bla bla bla
> func Name(){}
> struct Name {}
> type Name {}

godoc -> genera docuemntacion del paquete 

# Testing pruebas unitarias berkmanch vvasad

Los test deben .

    + Estar en un archivo que termina con "_test.go"
    + Estar en el mismo paquete el cual esta siendo ejecuando
    + Estar en una funcion con la firma **func TestXxx(*testing.T)**
    + correr el test go test

    ¿Como tratar con el test que ha fallado?
        + usa t.Error(messge) para señalizar una falla
    Idioma recomendado
        + Expected(esperaba)
        + Got (obtuve)
# Tabla de test == agarrar una prueba y repetirla distinta veces con diferentes valores
# Example Test
Hay una convecion y manera facil de crear ejemplos y test de manera facil
Claro sin olvidar el **godoc -http=:port**
Existen comveciones [documentacion de examples](https://blog.golang.org/examples) hay una imagen de las conveciones
# formatos en golang
recursividad de busqueda en go ./...
golint file.go -> ayuda a buscar errores de estilos en go
gofmt file.go -> reformatea el codigo
go vet file.go -> busca errores en el codigo

# Benchmark -> medir la velocidad de nuestro codigo
Esta se repite en un ciclo un numero de veces que lo define el param b *testing.B
Convesion
func BenchmarkXxx(b *testing.B){
for i:=0;i < b.N;i++{
// call la funcion a ser sometida
Xxx()
}
}

> go test -bench .
#End Benchmark
Todas estas cosas de generate Example Bechmark test van dentro de unFilego_test.go
# Coverage -> que tanto porcentaje de nuestro codigo es cubierto por pruebas

go test -cover file.go -> analisa codigo
go test -coverprofile salidadelcoverenunArchivo.out filego.go
go tool cover -html=salidadelcover.out -> mostrando en el navegador
# End Coverage
