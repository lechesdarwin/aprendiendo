
Memoria statica:es el espacio que se crea al declarar variables
Memoria dinamica:es la memoria que se reserva en tiempo de ejecucion y pude ser modificada en tiempo de ejecucion
Malloc():sirve para solicitar un bloque de memoria del tamaño suministrado,si este falla regresa NULL
    devuelve un puntero a la sona concedida
    int *pun;pun=malloc(sizeof(int));
free():Es utilizado para liberar la memoria dinamicva ya que la memoria estatica se libera al momento de terminar el ejecutable
    resive como argumento una direccion de memioria
realloc():reagsina el tamaño de memoria de un elemeto 
    resive como primer parametro el puntero a redimensionar y el gu8ndo elemnto cuanto bytes quieres que creesca
    si todo salio bien devuelveun puntero a la memoria recien creada
    int vec[2];
    vec[0]=12
    vec[1]=1212
    vec[2]=312312 //error
    realloc(vec,4*sizeof(int))
    vec[2]=12312
    vec[3]=12312 //ahora si
    es opcional cioocar una varible qu reciba la nuema direccion de memoria 
calloc():first param number of elemnts,second param size each element
@se podria decir que es mas flexible que malloc()
@en c existe la aritmetica de puntero se acepta operadore como + - ++ -- 
Así *pt es equivalente a v[0] *(pt+1) es equivalente a v[1] 
			      *(pt+2) es equivalente a v[2]…
pt=&v[0];equivale a pt= v;
 v[i]  equivale a *(v+i) 
&v[i] equivale a v+i
#feactures para mo olvidar de golang
@la palabra clave defer seguida de una funcion se ejecute si o si al final de la funcion si hay mucos defer se ejecurtararn en un orden LIFO
@range es una "funcion" que retorn el indice y el valor i,v
@Si se quiere omitir algo como pueden ser algunos valores de retorno se pude usar un underscore en lugar de declara una varible o acatart el valor
@la capacidad de un slice es el numero de elemntos que puede contener.
@operador 'unpack o pack'(...) operador pack ->...Type lo que hace esto es que los elemntos que recibe los coloca en un slice y como sabemos un eloce es una referncia a un vector ,unpack Myvar... es operador hace que se desempaqute el vetor ose var a =[]int{2,32,32} a... esto ee igual a 2,32,32 
@que podemos tener la catidad de init function que querramos estas se iran ejecuantado antes que el main pero en el orden que son colocadas y en el orden alfabetico de los package file
@y si colocamos cualquier funcion o varible con mayuscula estas sera exportable 
#slice in golang
los slice son rebanadas son como matrices pwero a diferencia de estas esta pueden espàndirse mas de el tamnio original
un slice no es mas que una referencia a una matriz como lo se ahorita te lo 
%make(type,len,cap)
un ejemplo es que supongamos que tomamos los valores de inicio y final que tomara la rebana de la matriz si se cambia algun valor en la rebana o en la matriz este se vera afectado simultaneamente en los dos
#mapa es un tipo de dato compuesto que esta constituido por clave:valor su sintaxis es var myMap map[typeKey]valueType
un map vacio no se puede asignar valores de forma directa porque si creamos un mapa del typo 
var myMap=map[string]int este tendra un valor nil y si intenta asignarle esto creara un panic error para inicializar una mapa de forma indirecta podemos utilizar la funcion make que pasa si intentamos accder a un valor que no se encuentra alli en el caso delos slice generarra un error pero en los mapas nada en su lugar regresara 0 value y como hacemos para ver si estamos en lo correcto? 
//donde ok es un boolean
valor,ok=myMap[key]
que pasa si queremos eliminar bueno delete(mapa,key)
#funciones varidics o funciones de argumentos infinitos
como sabemos una funcion recibe argumetos pero como podemos apreciar en la funcion append recibia una cantidad de numeros variable la sitaxis es func f(fragment ...Type) TypeReturn a recibir los numeros de forma variable lo empaquetara en un slice en este caso en fragment y podras trabajar en un for no, lo se decide tu
#punteros son variables que se almasenan en una direccion de memoria y podemos modificarlar y tambien pueden modificar unas variables
!notar que go no admite la aritmetica de apuntadores :c 
go tambien puede aceptar sitaxis resumida
example (*) operador de desreferencia que nos permite accder al valor de la direccion de memoria a nuestro antojo y el operador underscore este nos devuelve la direccion de memoria de la variable 
los apuntadores tambien puden referencia a matrizes o mejor aun slice 
func ad(a *int){
//code
} ad(&varriable)

ar *[2]int forma verbosa (*ar)[0]=newValor
forma abreviada ar[0]=newValor //esto directamente afecta a la matriz de referencia 
*p[0]!= (*p)[0]
(*p)[0]==p[0]
new function go//firma-> func new(Type) *Type este asigna directamente el valor 0 por defaul del typo asignado y reserva la memoria y regresa la direcion de la memoria
#interfaces -> Son firmas de acciones que los objetos pueden realizar,son objetivo principal es proporcionar solamente firmas de metodos
Si un typo implementa la algunos de los metodos de una interfaz entonces de dice que ese tipo implementa una interfaz es decir como<si nada como pato caga como pato corre como pato es un pato>
Así se declara
type FormaActions interface{
//como se dijo anteriormente es una firma de metodos
Area(int) float
Perimetro(int) float
}
Una interfaz puede terner dos typos Static type el typo de la interfaz misma y dynamyc type el typo del typo de dato que la implementa 
para que te quede mas claro el valor dinamico mira
package main

import (
	"fmt"
	"math"
)

type Shape interface {
	Area() float64
	Perimeter() float64
}

type Rect struct {
	width  float64
	height float64
}

type Circle struct {
	radius float64
}

func (r Rect) Area() float64 {
	return r.width * r.height
}

func (r Rect) Perimeter() float64 {
	return 2 * (r.width + r.height)
}

func (c Circle) Area() float64 {
	return math.Pi * c.radius * c.radius
}

func (c Circle) Perimeter() float64 {
	return 2 * math.Pi * c.radius
}

func main() {
	var s Shape = Rect{10, 3}
	
	fmt.Printf("type of s is %T\n", s)
	fmt.Printf("value of s is %v\n", s)
	fmt.Printf("value of s is %0.2f\n\n", s.Area())

	s = Circle{10}
	fmt.Printf("type of s is %T\n", s)
	fmt.Printf("value of s is %v\n", s)
	fmt.Printf("value of s is %0.2f\n", s.Area())
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Interfaz vacia -> son quellasq que no tiene metodos definido esto es refresentado por interface{}
como esta esta vacia todos los tipos implementan esta interfaz
Obteniendo un valor subyacente o como un cast
i.(type)-> donde i = a una interfaz ya declara y type los valores que lo implementa
En la sintaxis de i.(Type) si TYpe no implenta la interfaz de tipo i go lanzara un error y si Type implenta a i pero i no tiene un valor en concreto go entrara en panico
afurtunadamente existe la sintaxis -> valor,ok=i.(type)
Bueno si intenta accder a cualquier tipo que no sea representada como una interfaz sera un error en tiempo de ejecuacion a asi que uselo con cuidado
%%%%%%%%%%%%%%%%%%%%%%%
asercion de tipos o algo asi como un casting 
supongamos que tenemos una funcion func explain(i interface{}) ahora haciendo swith en go como descubro el tip? i.(type)
como el hago un cast i.(int) este es una asercion de tipos
| Una nil interfaz tiene un niltipo.
bueno con el caso que la interfaz tenga un puntero de typo dinamico en lugar de un valor de typo dinamico
package main

import "fmt"

type Shape interface {
	Area() float64
	Perimeter() float64
}

type Rect struct {
	width  float64
	height float64
}

func (r *Rect) Area() float64 {
	return r.width * r.height
}

func (r Rect) Perimeter() float64 {
	return 2 * (r.width + r.height)
}

func main() {
	r := Rect{5.0, 4.0}
	var s Shape = &r // assigned pointer
	area := s.Area()
	perimeter := s.Perimeter()
	fmt.Println("area of rectangle is", area)
	fmt.Println("perimeter of rectangle is", perimeter)
}
 
#metodos -> estos nos ayudan tratando de resolver el problema de que go no tiene clases a diferencias de las funciones
como un metodo pertenece a un campo podemos llamarlos directamente Type.metod(--) los metodos pueden tener el mismo nombre simpre y cuando no choque los tipo o paquetes
estos metodos reciben una parametro adicional que es el receptor(r) que nos ayudara a saber a que typo pertence el metodo
el receptor es accesible desde el cuerpo del metodo con esto nos ayudara accder a los campos de la structura "instanciada" 
func (r Type) functionName (... Type) Type { 
    ... 
}
ahora miremos como el receptor como si fuera una variable ahora y intentamos cambiar algun valor de la structura no se realizara los cambios ya que se lo esta pasando como valor osea una copia
para solucionar ese problema deberemos de usar un recepto tipo puntero func (r *type)(...type) Type{
//acedemos
(*r).campo =newValor
}
el problema de esto es que el recepto esta esperando una direccion de memoria o variable tipo puntero
entoces creamos una variable tipo puntero que apunte a nuestra strucutura emp:=&e emp.metodo() o tambien podriamos usar la sitaxis abreviada (&e).metodo()
pero go nos facilita esto al igual que las referencia de matriz
e.metodo esto bastara
Como vimos en la structs lección que si el campo anidado es una estructura anónima, sus campos serán accesibles desde la estructura principal. Por lo tanto, cualquier método que acepte el receptor de estructura también tendrá acceso a los campos promocionados.
Como hacemos Un objeto typo strings bueno podemos lograr eso pero necesitamos crear un alias del tipo string ya que los metodos deben estar implementados en el mismo paquete
import strings
type Mystring string
func (r Mystring)Uppercase() string{
return strings.ToUpper(r)
}
str:=Mystring("auto")
#structuras
las estructuras son como un dato compuesto de otros datos ya sea primitivos o DAT(data abstarct type) pueden ser anonimas
sintasis es <<struct name Type{
	campos Type
	campos Type
} >>
y la manera de inicializarlas es de 3 formas 
la verbosa
@supogamos que tenemmos una estructura ya declarada al hacer un typeOff sera ->packagename.NameOfStructura
varName StructName=StructName{
camponame:value
camponame:value
...
}
la manera corta 
vaName StructName={valuetype,valuetype,valuetype}
	#si se omiten campos o se inicializa una strucutra en cero estos tendran automaticamente su valor cero del respectivo dato
O las structuras anonimas
varname:=struct{
fieldname types
fielname2 types
...
}{
fieldname:value
fielname2:value
...
}
y al hacer un typeof ->struct{fieldaname type;fieldname type;...}
Strucutras punteros 
ross *structName=&{campos field}
deberemos usar *ross pra obtener el valor real y usar (*ross).firstname para accder al valor para que el compilador no se confunda entre (*ross).firstNamey *(ross.firstName).
que no te gusta los punteros bueno go proporciona una sintaxis al igual que en los arrays sin la necesidad de crear un puntero
tambien existen los campos anonimos es decir tan solo declamos los tipos y accedemos a los campos invocando a los typos

xportando campos de estructuras bueno si queremos exportar los campos de la structura y la misma estrucutra debemos de cumplir con las reglas de poner los nombre en mayusculas
Comparacion de estrucuturas estas son comparables si son del mismo dato y y los mismos datos
Los metadatos de las structuras proporcionas datos adcionales para codificar o descodificar vemremos mas sobre los mtadatos mas adelante pero aqi dejo un ejemplo de una strucutra preparada para ser descodificada a json
type Employee struct { 
	firstName string `json:" firstName "` 
	lastName string `json:" lastName "` 
	salario int `json:" salario "` 
	fullTime int `json:" fullTime "` 
}
 
