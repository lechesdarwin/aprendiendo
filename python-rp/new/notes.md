# la cosa se pone interesante con los magic methos averiguar
# los magic methos como __getattr__ y __setattr__< creacion de nuevo attr > no es mas que:
reciben como argumento el nombre del atributo que se llama o se inicializa su valor
	ob.name | ob.name=value
# __delattr__ este se llama junto a la palabra clave *del* obj.att 
	esta accion causa que se elimine de la clase

# Conjuntos set
  formas de inicializacion
  var =set()
  var = {23,24,24,23,432} //tener en cuenta que no añadira los vlaores repetidos
  *la funcion set recibe como parametros una list o dict<diccionario pero sin claves>* 
  var=set([4,234,32,4,324,32])
operacion de conjuntos
& muestra todos los elementos comunes de  a y b
| es una union pero no accepta los elemnto repetidos solo acep 1
^ solo devuelve los elemntos unicos
-operacion de resta de conjuntos
\> true si todos los elementos del primero estan en el segundo 
# colecciones avanzadas-> import collections as con
# START COLLECTIONS BASADAS EN DICCIONARIOS
## ChainMap -> este recibe mapas o diccionarios y hace como si fuerera un solo diccionario
cada clave del diccionario se obtiene con instacioa.get(clave)
y si queremos saber los mapas que lo componen instancia.maps
# Counter este lo que hace es devolvernos cuantas veces se repite algo <param recibe un iterable una lista o una cadena de string >
Conunter tiene un metodo .most_common(param<int los n mas comunes>) este nos retorna los mas comnuner osea retorna una clave y valor

# collections.defaultdict(list|)
este permite la instacicacion de un diccionario si preocuparnosde que este repetida
osea si hay una llave que no exite lo acrega como una list
ins=coollection.defaultdict(lis)
ins[clave].append(value)
se obtiene con un get
# import pprint -> este inclute un pprint bastante interesante

# un arbor con defalutldic

def tree():
    return collections.defaultdict(tree)

arbol=tree()

# diccionario ordenado OrdereDict()
normalmente los diccionarios comunes soon ordenados de acuerdo al hash
y si nos importa el orden de insercion ? -> collecitons.OrdereDict()
Bueno esto es para versiones anteriores de python 3.6
dejando eso si queremos obtener el valor con un get y el segundo paramentro es un valor pord defecto
# END DICCIONARIOS COLLECTIONS
# START COLLECTIONS LIST
# lista doblemente enlazada collections.deque()	le podemos poner limite param<maxlen>
# heap <heapd> import heapq recibe una lista de param
heapq.heapfy(list)
quitar elementos heapq.heappop(heaplis)
add heapq.heappush(heaplist,value) 
# bisec module para insertar en las listas de forma ordenada
bueno ya que la forma comun al agrega cada valor con una complejidad de o(1) pero el problema es al ordenar la cosa se pone mas complicada
pero con bisec esto la complejidad de agregacion va creciendo conforme a la lista pero al ordenar ya esta por defectero el problema es al ordenar la cosa se pone mas complicada
pero con bisec esto la complejidad de agregacion va creciendo conforme a la lista pero al ordenar ya esta por defectoo
o con la funcion de insort
bisec.insort(listcomun,value)
# END COLLECTIONS LIST
# basadas en tupla estas estan en collectiom
nametuple retorna una tupla y campos disponibles
Point = col.nametuple(name,[list of labels]
a=Point(1,2,4)
a.x
a.y
# enum import enum bueno ya tu sabes lo que hace un enum
class Color(enum.Enum):
	red
    yellow
	blue
    black
    pink

Color.red //0
Color.blue //1
# Funcional 
list compregesion aplican para listas sets tuplas<casoespecial las tuplas conpregension se comportan como un genreador> y diccionarios
[return ciclo condicion?]
# los decoradores en python no es mas que una abstraccion de lo que es el patron decorador por lo tanto el retotrno de la funcion de retorno no sera del la funcion decorada si no del decorador
es de buena practica utilizar functools la funcion wraper para hacer un buen tranajo por que si no lo hacemos asi pordra perder algunas priopiedades de la funcion principal 

# pero si sellama de un metodo de un clase y esta hereda tambien retornar lo que tien que retornar
```	
import functools as ft
def decorator(f):
	@ft.wraoper(f)
def _f(*args,**argsk):
		pass
	return _f
``` 
# es mejor utilizar functools.lru_cahe() que utilizar nuestro propia memoaze
# el decorador counter sirve bueno paa contar cuantas veces se ejecuto nuestra funcioon:

**los generadores no son indelebles se4a generqdor[2]**



