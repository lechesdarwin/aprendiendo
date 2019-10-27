#stack memorria inmediata del bloque
#heap memoria permanente durante la ejecucion del programa
int sa =10//stack
int* ha =new int(10)//heap
sa se destruye al terminar el bloque donde fue declarada 
por ejemplo en una funcion ya sea que retorne o no 
ha se destruye inclicitamente con 
delete ha
#aritmetica
++p incrementa la direccion en 1
--p decrementa la dirreccionde memoria
p+=X incremnta la direccion en X 
p==p2 apuntan a misma dir?
*P= accde a lo que hay en esa posicion
#doble direccion
@ en la direccion
int *p=10//@1000
int **a=&p//1001
*a//1000
**a//10
#para no romper la cabeza si aumnetas la direccion de memoria en un una funcion de stdout no cambiara en el scope global la direccion de memeoria
Los enumeradore enum van mapeando nombres con un valo ascendente 
los enum class igualmente pero estos ya no puede ser comparados con numeros sino que ya son un solo tipo y debe trabajar como si fuera un tipo
los contrucores de strucutras en c
struct A{
	struct{float a;float b;}
	A(int q ,int v){
		a(q)
	}
	//ooooo
	A(int a ):a(q)
}
las clase en cpp son struct pero por defecto sus atributos son privados
campos de bits 
typo <name_var> : ancho de bits
#contructor una cosa que me rompe la cabeza es de como podemos inicializar la variable
Conster():atr_1(valor),attr2_2(calor)
como si fueran funciones !!!
#destructor 
~Name 
este sera llamado dependiendo donde fue inicializado el heap o en stack si fue en heap sera llamado cuuando lo llamaaos por la palabra delete
#cuando un metodo tiene la palabra virtual esta indicando que pueede ser sobre escrito o utilizado directamente 
override se encanrga de inidicar al compilador que se utilizar esa misma
si se coloca una funcion con el modificador final ya no podra sobre escribir al funcion virtual
#friend este modificador lo que hace es que se le indica que una (friend class Name| frien funcNameFirma) podra accder y modificar todos sus elemntos sin importar si es privada o protedted
#super no la hay pero podemos hacer con l operador de ambitp -> clasePafre::atributometho
#las macros agarra la macro y lo sustituye
#intruccion nombre codigo_a_sustituir
#que pasa si vuleves a definer la misma macro bueno c tomarara la ultima macro defininida
#macros como funcion
	f(arg,arg2,argn)
	#define f(arg) #arg //el operador # antes del arg stringifica la variable
	int a
	f(a)-> "a"
#el operador ## este es comom un operador de concatenacion
	#define a(arg) in##arg  no hace una stringificacion esto solo lo une tal como esta
		a(dev) -> indev
#undef esto quita la definicio o la directiva
#ifndef -> sino esta definido
#ifdef si esta definido
los templates nos ayudan a la programacion generica es decir no depengamos de los tipos los bueno de eestos es que son sobre cargables asi como funciona la sobre carga de methodos en las clases
 template<class T>
 T add(T r,T t){
	 return r+r
 }
 add<int>(2,3)
 tambien se puede tipos predefinidos
 template<class t=int>
 t add(t n){return n}
 tmabien on valores predefinidos
 template<int max=1000>
 int add(){return max}
 add()//1000
 add<300>()//300
#pero que cagada la de cpp se puede inicializar una variable asi
int i=10 ==== int i(10)
//asi que no te rompas la cabeza como yo