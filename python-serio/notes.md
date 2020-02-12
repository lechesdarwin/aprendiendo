# standar package directory
El nombre standar del script de instalacion del script es setup,py
acompañado de su setup.conf con sus respectivos parametros
Podemos encontrar tambien algunas carpetas como
  etc para muestra de configuracion
  tools para script shell o otras herramientas
  bin para binarios que tal vez puedan ser generados por setup,py

# __inti__.py
Este archivo se llama la primera vez que se llama al modulo generalmente dveria estar vacio pero si usted sabe
lo que hace bienvenido

# Como escribir codigo python
Tenemos herramientas como pep8 ,flake8(un pep8 con superpoderes) , pylint

+ 4 spacios por nivel de indentacion
+ por cada linea limitar 79 caracteres o 79 columnas max
+ los nombres de las clases deben ser CamelCase y de la funciones deben ser palbras descriptiva
    y deben ser con _ bajo si no alcanza los metodos y atrbutos privados deben contener _ de prefijo
+ desopues de declaran el prototipo de una clase o funcion debe haber 2 espacioas en blancos

# Librerias modulos framework

python tiene una palabra clave para poder importar modulos y es <import> pero import no es 
nada mas que una funcion

import sys

sys = __import__('sys')
los mismo sucede con import sys as sy

Recordar que el resultado de las importaciones no son nada mas que imples objetos , ya sabes
metodos,atributos

# El modulo sys
El odulo sys es curioso este contien informacion de varibles y funciones del mismo python y del
systema operativo en genral
por ejemplo sys hacemos un sys.moddules nos devuelve un diccionario de los modulos importados
o sys.modules.builtin_no me acuerdo los mulos compilado y que se ejecutan en tiempo de 
ejecucion en python

# import path
pytyhon al momento de importar modulo se basa en una lista d direcciones de alque se puede 
añdir o eliminar mas direcciones esta lsita de direcciones se encuentra en 
sys.path esto nos regresa una lista de direcciones donde python va abuscar al moneto de 
importar modulos
podemos hacerlo de dos maneras 
sys.path.append("ruet")
$:$PYTHONPATH="NEWRUTE" python

# Ampliacion del systema de modulos
Python ofrece una manera de ampliar el systema de importacion de modulos com sys.metha_path o sys.path_hooks
En la pagina 20 del libro serius python muestra como carajos personalizar la importacion

# Pip es la herramiena recomendable para tratar paquetes

$:pip install --user pkg-name -> esto ayuda para que no ensucie el sistema de archivos del 
systema e instale en l carpeta raiz del usuario

o podemos crear el huelbo simbolico para panejar dentro de el todos los paquetes como enlaces 
$:pip install -e . -> en el punto deberia eta el path o la acarpeta donde estara  el huevo link
o tambien podemo clonar desde github
$:pip install git+https://github.com/user/reponame.git\#egg=eggelinkname

# Documentacion con sphinx
Instalacion: $:pip install sphinx
Una vez instalado debemos ejecutar en la raiz de nuestro projecto $: sphinx-quickstart para que
haga su trabajo esto nos dara un trabajo de la documentacion que generó y un  archivo de 
configuracion conf.py en docs/source o podemos transpilar los archivos rst a html con
$:phinx-build doc/source doc/build esto dejara los archivos html de nuestra documentacion en el
segundo argumento de CLI

# Modulos de sphinx
Sphinx en su funcionalidad mas basica admite ssolo documentacion escrita a mano pero se puede 
generar autodocumentacion con un extenccios
```python

extensions = ['sphinx.ext.autodoc']

```
```srt
..automodule:: foobar
    :members:
    :undoc-members:
    :show-inheritance: 
    :undoc-members:     # para lograr que los mienbros indocumentados tambien puedan imprimirse
```
Puede se que desea crea una tabla de documentacion de los diferentes modulos

```py
# en su configuracion de conf.py debe agragar la siguiente linea para hablilitar en algun 
extensions = ['sphinx.ext.autosummary']
# todas esta cosas las simplifica el comando $:sphinx-apidoc lea la documentacion para sabermas
# en algun archivo srf ah en el conf.srt
# ..autosummary::
#    mymodule
#    mymodule.submodule
```
# Automatizacion de pruebas de documenrtacion

Esto quiere decir que nostrosautomatizamos la muestra de ejemplos que realizamos

```sh
$:sphinx-build -b doctest source output

```
# Una breve intro de como se escribe documentacion en python
Como sabra para la descrion del codigo se necesita delararlo dentro de la clase metodo o 
funcion entre """ Some documentacion """
```py
class Someclass:
def funcleft():
"""Turn the car left.
 .. deprecated:: 1.1
 Use :func:`turn` instead with the direction argument set to left
 """
    pass
 def turn(self, direction):
 """Turn the car in some direction.                     descripcion de la funcion
 :param direction: The direction to turn to.            paramtro 
 :type direction: str                                    el tipo del parametro anterior
 """
 ```
Tambien podemos mandar mnsajes en tipos de ejecucion indicando que un elemnto en futura o 
actual deprecacion
 en el modulo warnings

 warnings.warn(message deprection,leveldebrecation) los level deprecation tien algoc como 
 contantes ya definidad como DeprecationWarning
 xon la opcion -w en el interpretee est6e lanza las advrrtencias como errores pero esto es 
 tedioso tener que escribir todo esto a amano es por eso que entra a la caccion la bibliateca 
 de deudas
 Example
 ```py
from debtcollector import moves
class Car(object):
  @moves.moved_method('turn', version='1.1')
  def turn_left(self):
    """Turn the car left."""
    return self.turn(direction='left')
  def turn(self, direction):
    """Turn the car in some direction.
    :param direction: The direction to turn to.
    :type direction: str
 """
 # Write actual code here instead
 pass
 ```
# Manejando timestamps y zonas horarias
la zona horaria utc es como una aona horaria internacional como l hora del mundo
Las zonas horarias son jodidamente necesarias pra trbajr con tiempo es decir si su programa 
tiene un timestamp si un zona horaria esto es un mierda si un time stamp no tiene zonaoraria 
deberia genrar un error(este error debe ser generado por usted por buan practica)

el objeto date time en el modulo date time nos ayuda a eso
datetime.datetime.utcnow() trae la zona ahoraia acuatual en utc
or datetime.datetime.now() la zona horaria en local con la zona horaria reginaonal

Podemos obtener la zon horaria de de una determina regin concociendo la ubucaion como "Europe/
Paris" con el modulo dateutil que se puede instalr con $:pip install python-dateutil

from dateutil import tz
tz.gettz("Europe/Paris")
Esto va y busca el systema opertivo la confikguracion correspondiente a la zona horaria de los indicado
Esto puede ser util ya que podemos remplazar la o colocar una nueva zona horaria a una timestamp si no lo tiene
```py
from dateutil import tz

tz = tz.gettz("Europe/paris")
alguntimstamp.replace(tzinfo=tz)

para obtener una lista de todas la lista de la zona horaria que hay en tu sistema
from dateutil.zoneinfo import get_zonefile_instances
get_zonefile_instance().zones

```
Obteniendo el nombre de la zona horaria ssi no lo tenemos

localzone = tz.gettz()
localzone.tzname(un time stamp)

# Solving ambiguos times
# Distribucion de packetes
La configuracion para la distribucion de paquetes en python tiene una larga historia pero en este tema hablaremso 
principalmente de <setuptools>
 tener el archivo de setup.py sirve para poder inicializar las configuraciones y especificaciones que estan en setup.cfg 
 este archivo sirve de ayuda para herrramientad como sphinx wheel etc ademas este archivo se llama cuando se inicializa lo siguiente en setuptools 
import setuptools

setuptools.setup()

```rst
 [metadata]
name = foobar
author = Dave Null
author-email = foobar@example.org
license = MIT
long_description = file: README.rst
url = http://pypi.python.org/pypi/foobar
requires-python = >=2.6
classifiers =
 Development Status :: 4 - Beta
 Environment :: Console
 Intended Audience :: Developers
 Intended Audience :: Information Technology
 License :: OSI Approved :: Apache Software License
 Operating System :: OS Independent
 Programming Language :: Python
 ```
 El modulo de wheel es compatible con setuptools y pasar el siguiente comando para que wheel empaquete el codigo en un 
 archivo .whl que no es nada mas que un .zip
 python setup.py bdist_wheel
 Si no tiene wheell instalado = $:pip install wheel
 Si nuestro codigo es completamente compatible con python 2 y 3 puede usar el flag --universal
 o en el archivo setup.cfg
 colocar 
 [wheel]
 universal=1

 ## distribuyendo nuestro paquete en la red
 $:python setup.py sdist
 En nuestro archivo  .pypirc colocamos la siguiente configuracion para poder subir nuestro proyecto
En este caso estaremo subiendo a un servidor de pruebas
[distutils]
index-servers =
   testpypi
[testpypi]
username = <your username>
password = <your password>
repository = https://testpypi.python.org/pypi

Y ejecutamos el siguiente comando , no olvide poner -r si no lo hace el el proyecto se subirar a un servidor de produccion
$ python setup.py register -r testpypi

O alternativamente podemos subir un archivo wheel con
$:python setup.py bdist_wheel upload -r testpy

Hasta ahora otros desarrolladores pueden descargar el pacquete con
>$:pip install -i https://testpy.python/pypi namepackage

Podemos distribuirlo en los servidores centrales de pypi tambien con
 
[disutils]
index-servers =
    pypi
    testpy
[pypi]
username = <your username>
password = <your password>

Ahora  solo falta poner esto es pypy con
$:python setup.py register -r pypi
y podemos instalar nuestro paquete con pip como cualquier otro paquete

# Puntos de entradas
 Instalando un visualizador de puntos de entrada para una mejor perscepcion
 pip install entry-point-inspector
Una vez instalado podemos ejecutar el siguiente comando para visualizar los puntos de entrasa que ternemos en nuestra maquina

$:epi group list

Los puntos de entradas nos yuda a crear facilmente entorno de ejecucion directament desde la 
consola y que nuestro escript puedan trabajar con otros programas
Osea es como si realizaramos una instalacion dentro del systema.Aqui dejo explicando un ejemplo
Normalmente utilizamos la sinstaxis module.submodule:function
```py
from setuptools import setup
setup(
 name="foobar",
 version="1",
 description="Foo!",
 author="Julien Danjou",
 author_email="julien@danjou.info",
 packages=["foobar"],
 entry_points={
 "console_scripts": [
    "foobard = foobar.server:main", # con este codigo estamos indicando que podemos llamar directamnete a la funcion main de nuesto paquete foobard en el submodulo server desde nuestra consola con solo escribir foobard
    "foobar = foobar.client:main",
 ],
 },
)
```

# Creando nuestro propio entrypoint
```py
import pkg_resources
import time
def main():
 seconds_passed = 0
 while True:
    for entry_point in pkg_resources.iter_entry_points('pytimed'): # pyttymed es el nombre de nuestro archo ademas del nombre del entry point
      # osea este recibe el los parametros de module.submodule:function
      try:
        seconds, callable = entry_point.load()() # esta funcion llama a la funcion indicada en el parametro ahora solo nos queda jugar con la logica
      except:
        # Ignore failure
        pass
      else:
        if seconds_passed % seconds == 0:
          callable()
    time.sleep(1)
    seconds_passed += 1
```
ahora solo lo registramos en el paaramtro
entry:points:{'pytimed':['hello = module.submodule:function']}
 ahora solo llamanos la funcio main del nuestro modulo pytimed
 Esto puede ser tedioso no? afortunadamente existe una manera menos tediosa con el package
  que devemos instalar con pip

  $:pip install stevedore
  
  from stevedore.extension import ExtensionManager

  extensions = ExtensionManager("namedemientrypoint",invoke_on_load=True)

  for extension in extensions:
      func_to_call = extension.obj
Y listo nada más , esto funciona para ejecutar todas las funciones establecidaas en nuestro entry point
 O podemos especificar solo que entrypoint llamar dea acuerdo al nombre

 ```python
import stevedore.driver.DriverManager

def main(name):
    callable = DriveManager("nameentry",name,invoke_on_load=True).driver

main("someElementeOfEntryPoint")
 ```

# Pruebas unitarias
Pytest es un modulo de pruebas de ptyhhon pero este es una buiena opccion paera proyectos medianos pequeños debemos instalarlo no biene en la biblioteca estandar
podemos crer pequeñas pruebas solo con el assertion si estos son true entonces pasara la prueba
y siolo correomos el comando 
pytest test_file.py

## santaldo pruebas
Puede haber escenarios dondem necesie saltarce las pruebas de acuerdio a condiciones o 
decoradores o en le runtime con decoradores 
```py
import pytest
try:
 import mylib
except ImportError:
 mylib = None
@pytest.mark.skip("Do not run this") # Marcando prueba deirectamente para que salte
def test_fail():
 assert False
@pytest.mark.skipif(mylib is None, reason="mylib is not available") # saltandio prueba en una condicion
def test_mylib():
 assert mylib.foobar() == 42

def test_skip_at_runtime():
 if True:
 pytest.skip("Finally I don't want to run it") # saltando prueba en el runtime
```
Tambien podemos pasar como argunmento que funciones queremos que se salten con el sig comando
$:pytest shs/test_file.py -k noEjecutarEsatFuncionQueEstaEnElArchivo
Pero tambien podemos marcar las pruebas por grupo
supongamos que le colocamos el decorador @pytest.mark.dicset
Estp lo que hara es poner esa funcion al grupo dicset y este no se jecutara a menos que sea 
llamado con la ocion -m y el nombre del grupo

pytest test_file.py -m dicset

Pytest puede correr en paralelo con un parametro que le inidca el numero de prioesos a utilizar
pytest -n NUmOfProccess
Podemos tamien crear simulacros o pyrhon tien una oBjeto muy interesante donde se puede simular kcualquier objeto
from unittest import mock
mock =mock.Mock()
Puebala y veras que crears cualquier objeto simulado
## trabando concovertua de coddigo
necesitamos instalar esto nos ayudara a moniterear el codigo de como se jecuta y sis realmente 
se ejecutaron todas las pruebas
$:pip install pytest-cov
 ahora solo ejecutamos el siguiente comando pero debemos añadir la opcion --conv=namedelpackage
 para que genere el informe perom es mucho mejor si lo genera en html asi que podemos agragar
 la bandera de --cov-report=html
 $:pytest --cov=namedelpackage --cov-report=html pathdelosarchivosdeprueba

# Los entornos virtuales

sirven para que no ensuciemos nuestro entorno y tengamos solo lo ncesario apra trabajar
en python 3 podemos crear el un entorno virtual con el siguiente comando python3 -m venv mivienName
Y lo activamos de la siguiente manera $:source mienv/bin/activate y lo podemos cerrar con 
deactivate

# El projeco tox
pip installl tox

toz es un projecto que usca estendarizar las pruebas y automatizar las pruebas en python
tox lo que hace empaqueta la aplicacion en un entorno virutial y lo ejecuta lsobre es enetrno virtual

Todo lo que necesitamos es crear un archivo tox.ini
[testenv]
deps=pytest # si no esta insatlado pytest olo instalar
command=pytest # este el comando que se encargar de ejecutar para conrrer todaas las pruebas

Podemos recrear el entorno virtual con <tox --recreate>
o podemos crear un entorno virtual con una versio especifica de pyton con
<tox -e py27> esto crea un entorn virtual con python 27

o podemos trabaja con diferentes entornos virtuales un ejemplo
[testenv]
deps=pytest
commands=pytest
[testenv:py36-coverage]
deps={[testenv]deps}
 pytest-cov
commands=pytest --cov=myproject

# Trabajando con travis
travis permite realizar las pruebas depues de cada insercion de codigo engithub , bueno 
trabjar necesitamos tener un archivo .travis.yml
Algo como esto
```yml
language: python
python:
    - "2.7"
    - "3.6"
# comand to install dependencias
install: "pip install -r requiermnets.txt"
# comand run test 
script: pytest

```
# Decoradore en python
Los deodcrados no son masfunciones que reciven un funcion de parametro y devuelve otra funcin 
modificada

Hgamos un ejemplo super sencillo

def indentiti(f):
  return f
def foo():
  return "bar"

ahora solo haga la funcion decorador con prefijo @ seguidop de la funcion que quiere decorar 
@indentiti
def foo():
  return "bar"

Esto es lo mismo que 
foo = identiti(foo)

Hagamoss un ejemplo de una decorador que prueba si es unusuario admin
```py
def ccheck_user_admin(f):
    def w(*args,**kargs):
        if kargs.get("username") != "admin"
            raise Exection("no user admin")
        return f(*args,**kargs)
    return w
# O podemos generar una funcion decoraddora que recibe que nombre de usurio 

def dec_param(user):
  def _f(f):
    def work(*args,**kargs):
      # somne work 
      return f(*args,**kargs)
    return work
  return _f
@dec_param("auto") # 2
@dec_param("dos") # 1
def foo():
  return "de2"
 # los decoradiores apilados son fifo los decoradores mas cerca de la opalabra def se aplican primero pero se ejecutan de ultimo
 # esto es igual a 
SomeClass.method = dec_param("auto")(SomeClass.method)
```

Los decoradres de Clase estos son menos comune pero igual se utilizan estos enve}z de recibir 
una funcion reciben una clase
@decorator_class
class some :
  pass

o podemos hacer un decorador  con una clase

class RegisterCalls(object):
    def __init__(self,f):
      self.f=f
      self.llamadas=0

    def __call__(self,*args,**kargs):
      # Some code
      return self.f()

@RegisterCalls
def foo():
  pass

Pero como ya hemos dicho una decorador devuelve nada mas y nada menos otra funcion por lo 
tanto la funcion decorada pierde susatributos como la func_doc para obtener la documentacion 
de la funcion y el nombre afortunadamente funcools llega al rescate con el con una funcion 
llamada update_wrapper(decorador,funciondecorada) retorna la funcion decorada pero manteniendo 
sus atributos sin perderlos pero esto puede convertirse tedioso entonce functools proporciona 
un decorador para la funcion decorada que facilita las cosas

```py
def decorator(f):
  @functools.wraps(f)
  def wrapper(*args,**kargs):
    # some code
    return f(*args,**kargs)
  return wrapper
```
Con el codigo anterior solucionamos el problema de la perdida de sus atributos 

Python viene con un modulo para permitir sacar bastante informacion de la funcion hasta la  
firma de la funcion este modulo se llama inspect
```py
import inspect 

def decorator(f):
  @functools.wraps(f)
  def wrapper(*args,**kargs):
    # some code
    func_args = inspect.getcallargs(f,*args,**kargs)
    # de esta manera no la pasamos adivinando si el valor de un parametro es pocicional o no esto nos devuelve un 
    # diccionario con claves de los argumentos
    return f(*args,**kargs)
  return wrapper
```
# metodos staticos y de clases
los metodos en python son soon atributos 
no importa si no tenemos la un instancia en pythnon con que tengamos la direccion de memeria de algun metodoa llamadno
directamnete basta para poder acceder con __self__
en python esxisten dos decorador
@staticmethod
este metodo sirve par crear functoolspor que no depende del estado del objeto este pude dser instaciado directamente para 
poder llamrase este tippmde metodo no reciben el parametro self y ademas son bastante rapido al llamarse
a diferencia de los metdos convencionales
@classmethod estos metodos pertecen a la clase y no al objeto es decir si cambiamos atribtos de clase en estes se cambia 
en todo las instancias ademas en vez de recibir el parametro cls recibe class

# Clases abstractas (abc(abstract base class))
el modulo abc cuenta con una serie de decoradores que permite  trabajar como clases abstractas como lo harias en otros 
lenguajes
```py
class SomeBase(object,metaclass=abc.ABCMeta):
  @abc.abstractmetod
  def domain():
      """"Haber pendejo debes implementarme en otra clase """"
```
El methodo super , como python es de herencia multiple podemos intanciar muchos objetos y llamar los metodos de la clase 
padre
super(Base,self).__intit__(some)
super(Base2,self).__intit__(some2)

super(Base,self).some_method()

# understanting super
los parametros que se pasan en class Some(object padres) son en relidad un lista de objetos que utiliza el mro method 
resoluction order en realiad este sistema busca o devuelve la primera coincidencia en su arbol de atributos al momento
de elegir que atributo de que clase elegir suponiendo que tienen semejanza
el metdo super en relidad es un constructor de la superclase recibe 2 argumetos el segundo es opcional , el primer 
argumento recibe la clase y el segundo una subclase o una instancias del mismo
el mro se puede llamar para obetener la listas de objetos
SomeClass.mro() python toma como preferencia a los objetos que estan a la izquierda usted mismo puede comprobarlo
llamando al metdodo mro
Si llamamo a super solo con el primer argumento este devuelve un objeto no vinculado

# Los generadores
los generadores no son mas que objetos iterables ,jodidamente eficientes con datos grandes
Como creamos un generador? Bueno sollo necesitamos colocar la palabra yiel  y python lo interpretara como un genrador
la funcion se ejecuta hasta que encuentra la palabra yield podemos ir retornando los valores con de los yields que 
pongmaos con el metodo __next__() o la funcion next(instaciadelgenrador) estos genradores se dtienen cuando llegan al final
y lanzan un StopIteration
La funcion send trabaja despues del yield sede el yield con y podemos setar un nuevo valor con send y vuelve a ceder al 
primer yield que se encuentre

# list comprehesion
Las list son estremendamente bellas y son más rapidas a comparion de los for tradicionales , podemos añadir la cantidad de 
word anidados (juntos ) como sea necesario
Example simple listcomp
x = [i for i in (1,2,3)]
>>>x
(1,2,3)
o podemos subir de nivel 
x = [word.capitalize()
    for word in ("uno","undos","cuatro")
    for i in word.split()
    if i some condition]
tambien se puede crear diccionarios y tuplas comprehesion, la imaginasion es el limite
## enumerate(iterable,[start]
star es un parametro desde donde deveria de comenzar
enumerate es un generador que devuelve el indice y el valor de una lista
## zip()
Esta funcion toma varios interables como argumentos y devuelve una tupla 
>>> keys = ["foobar", "barzz", "ba!"]
>>> map(len, keys)
<map object at 0x7fc1686100d0>
>>> zip(keys, map(len, keys))
<zip object at 0x7fc16860d440>
>>> list(zip(keys, map(len, keys)))
[('foobar', 6), ('barzz', 5), ('ba!', 3)]
>>> dict(zip(keys, map(len, keys)))
{'foobar': 6, 'barzz': 5, 'ba!': 3}

bueno las list dict tuple comprehesion devuelve un interable
La funcion next iene un segundo argumento por si falla toatalmente el iterador el segundo argumento es un valor que retorna
pode default en caso de que se cumpla esa condicion

# solucionando los problemas de lambda 
Como sabemos lambda no puede tener mas de 1 linea por lo tanto es un limitante bastante importente y si pasmos nuestras
 funciones como argumetno no tenemos la posibilidad de personalizar el comportamiento de la funcion a menos que
 hagamos la funcion mas compleja pero python ya viene  con baterias cargadas que en functools la funcion parcial nos ayuda
 a no hacer mas coplejo nuestro codigo y permitir que le pasemos argumentos de una manera mas dinamica
 con la funcion partial de functools nos permite pasrle argumentos pocisionales o directamente en clave

 functools.partial(someFunc,arg1,karg=somevalue)

 __En la pagina 151 hay algunas herramientas de interables de la libreria estandar__

 # abstract syntax tree , hy, lisp like attributes
 
 Esta cosa me salte

 # performance y optimizaciones
 Preocuparse por l rendimiento desde el incio del desaroolo es un gran error
 Utilizar las estructuras de datos correctas puede hacer nuestros programas aun mas rapidos de lo normal
por ejemplo si queremos accder a un indice desde erroneo nos da un error , pero python tiene una estructura lista para esos
problemas

import collections
structure = collections.defaultdic(set) 
structure["some"]=231221
structure["some"]["some2"]=23423
python en vez de levantar un error llama al constructor de la del parametro que le hemos pasado y crea un nuevo campo

O que pasa si queremos saber cuales son los elmentos mas repetidos o cuantas veces se repite un elmento para eso python 
viene con Couter le pasamos un iterable y que sus metodos re asombre
podemo obtener de forma segura mejor un item con el metodo .get que directamente del indice admeas si el indice no esta en 
la lista o dic retorna un None por defecto pero tambien podemos indicarle en el segundo paramentro que queremos que
retorne en casod e falla

## profile en python 
Python viene con un modulo nativo para pruebas cProfile
python -m cProfile some.py or podemos pasr el flag -o filedesalida
pero tambien tenemos otra herramienta
pip install pyprof2calltree
este trabaja con junto a cProfile y tambien jusnto a cachegrind
pyprof2calltree -k -i mycscript.prof
La forma correcta de leer la tabla de Kcachegrid es desde la izq

## profile uing the module dist

dist contiene la funcion dist que esta permite convertir el codigo o "objetos" a byte python
Definir funciones dentro de funciones es bastante lento por que esta se define varias veces

## alveces podemos crear clases simples como la clase tuple

# Zero copy with copy buffer

python proporrciona una funcion que recibe algo en python y lo que retorna actua como un 
puntero es decir no copiar todo el contenido si no solo lo convierte en un puntero
esta funciones memoryview(requiere un objeto similar a bytes)

# SCALING AND architectura

# Write less code more

## contex manager

El protocolo context mange es ideal para codigo que asemeja a lo ssiguiente
CALL MEHOD A
SOME CODE
CALL METHIOB B
para que una clase actue como contexmanger debe tener los metodod __enter__ y el metodo
__exit__(self,exepctioon_type,exeption_value,traceback)

pero podemos hacer con funciones tambien

import contextlib
@contextlib.contextmanager
def MyContext():
 print("do something first")
 yield # aui es como la instacia que retorna
 print("do something else")

O mejorarlo aun mas

import contextlib
@contextlib.contextmanager
def MyContext():
 print("do something first")
 try;
    yield
 finally:
    print("do something else")





