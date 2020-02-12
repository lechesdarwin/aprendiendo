# transpilacion en el navegador
si queremos transpilar en el navegador los scripts tenemos que indicarle que seran de type="text/babel"
y en la parte de arriba debemos solo agragar desde el cdn de babel para que funcion eque es el archivo browser.js
por el momento es https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.23/browser.js
# la desestrucuturacion de objetos y arrays inclible

```js
var autos [1,2,3,4,4,5]
var [fir]= autos
firs // 1
//podemos saltar algunos valores remplazandolos con ,
//podemos recivirlos como argumento de funcion
function name(...some){
console.log(some)
}
name(1,1,3) // 1,2,3


```
lso modulos de js pueden ser un archivo es decir un archivo puede ser un modulo
los tipos exportados indiviulmene pueden ser utilizados directamente como un desestrcturacion de objetos
miestras que los expor default son importados como un el nombre de la varible con la fueron exportado
/some.js
export var date = new Date()
export var da = new Date("asdjkas2)
export deafault def = new Vacaeteion

/index.js
from def , {date .da} import "some"
date
da
def.someMethod(adklas)
estos modulos es propio de es6 pero no todos los navegadore lo soportar
antiguamente se utilizaba COMMONJS
esportamos uestros typos como un objetos con sus respectivas claves
//some.js
module.exports = { //los tipos que queremos exportar}

//index.js
podemos hacer tambien un desctrucuturaion de objetos 
cont {someObject,alog} = require("somefilejs")
# programacion funcional
una funcion se considera como miembtro de primera clase cuando puede declarase com varible o pasarse como argumento en una funcion

Las funciones de orden suoperior son las funciones que toman o retoran otra funcion

La inmutabilidad trata de no cambiar los valores ya que mutar es cambiar el la programacion no se cambia los valores pero de vuelve una copia modificada de lo que se trata de hacer
Las funciones pueros reciben al menos un valor ,no cambiar el estado de la aplcaion o valores externos y siempre retorna un valor o una fuincion

Las armas funciononales por defcto que vienden en cualquier lenguaje
filter
esta funcion trabaja con un predicado si el predicado es verdadero lo va añadiendo a la nueva funcion , recibe como parametro una funcion
que recibe cada uno de los elementos
map 
Esta funcion recibe una funcion ,mop aplicada  cada elemento a esa funcion y retotna un nuevo array
reduce
esta funcion reduce un arra a un solo valor ya sea un numero booleano un primitivo o a un objecto tien como parametro un funcion y un inicio,esa funcionrecibe en le
primer argumento elinicio ene el segundo cada elemento
y el incremnto va mutando dea cuerdo a lo qu retorne la funcion que se paso como parametro
# recursividad 
CASO BASE
CAS0 RECURSIVO

# ReactJs
#Pure react
Por el momento trabajaremos con reac tpurio para entener como funciona las cosas por abajo de l capomnota;si queremos trabajar con react js debemos
importarla arriba antes de cualquier cosa que queramos hacer con el 
por el momento es 
 <!-- React library & ReactDOM-->
 <script src="https://unpkg.com/react@15.4.2/dist/react.js"></script>
 <script src="https://unpkg.com/react-dom@15.4.2/dist/react-dom.js"></script>
Si dejamos el jsx por un lado lo que hace babel es convertir la aplicacion alos metodo nativo de react que es 
React.createElement(typo:cualquieEtiquetadehtml{locolocamosEnstring},lasPropiedadesOpropsEstanvanIncrustadacomoAtrrHtml,losChildernLoselemntoquevanDestrodenuestraEtiquetaHtml)

Para representar en el Dom React utiliza el metodo render que esta el ReactDOM ,este se separo de react para que react pudiera trabajar tambien en plicacion mobiles nativas
ReactDOM.render(elementoQuequemereorenderizar,ObjetivodeDondeLoVamosArenderizar)
Cada elementorenderizado en react el elemento padre siempre tendra un atributo **data-reactroot**
```html
<html>
<head>
<body>
	<div id="container">
	
	</div>
</body>
</head>
</html>
var fish = React.createElement("h1",null,"contenido children")
ReactDOM.render(fish,document.getElementById("container"));
//ele resultado es el siguiete
<html>
<head>
<body>
	<div id="container">
		<h1>contenido children</h1>
	</div>
</body>
</head>
</html>

```
Bueno si queremo interar o crear una lista de elemento que contengan React.creteElement devemos ñadirle a cada uno de esto 
una clave unica , esot para que no haiga errrores
# creando componentes ;React.createClass,Clases es6 , componantes fuciones sin estado
Cuando s presento react en el 2013 habia muchas caracteristicas de js que no soportaban en aquel entonces la manera
corrrecta de hacerlo era con la funcion de React.createClass que recivia un objetod e parametro  en el que era como s
crearamos una clase hoy en dia
esto retorn o crea un componente en react y este lo podemopasar como argumento a react createElement
react representara el ene l dom todo lo que retorna render es decir omite la creacion de un tag como el nombre del nuevo componente que hemos creado
REACT CREATECLASS SERA DEPRECRADO EN LAS PROXIMAS VERISONES

Los componentes sin estado
React recomienda utilizar componentes sin estado si es ncesario en la mayoria de las veces para aumentar el rendimiento 
ya que estos solo reciben los props y ademas estos son funciones no objetos ,ademas nos ayuda a practicar la programacion funcional
cont ComponentFunctional = (props)=>(
    <div data-test={props.datatest}>
        someContent
    </div>)
# renderizado del DOM
React se encarga de solo aplicar cambios donde se necesita para eso compara el dom con su dom virtual

# Fabicas(factoriaas)

Si te parece engorrosos estar creado siempre React.createElement(typw....), react ya iene con algunas fabricas de elementos html
y sgv por defecto ¡te los enseño!
React.createElement.typodeEtiquetaHtmlOSgv(props,nodosHijos)
tabien pdoemos crear nuestras propias fabricas
var NuevaFabricaDemiCompoente=React.cratefactory(Micomponete)
Babel 
babel es una herramienta para transpilar el codigo ES6 a ES5 para que pueda funcionar en lamayoria de los navegadores
tambien sirve para  que transformar jsx a react puro 
para trabajar con abel ene le navegador debemos agragar las etiqueteas script con untype="text/bale" para que babel
https://cdnjs.cloudflare.com/ajax/libs/babel-core/5.8.29/browser.js
Este no es la mejor forma de lantrabajar enproduccion para eso transpiaresmoestaticamente con webpack

Recetas para jsx
Recuerdas la destructuracion de las nueva version de jsx
Tambien s epuede hacer con jsx
Suponadamos que tenemos nuetro elementos como el siguiente
<Title name="some" ingredientes={someArray}/>

<title {...props}/>
ahora tengamos en cuenta que props es igual a:
{name:"some name",ingredients:[AlgunArray]}
y esto se apeara afacilmente  a 

<Title name="some name" ingredientes={someArray}/>
# babel presets 
babel da la opotunidadad de que podamos definir la manera en la que compilamo nuestro codigo
babel-presets-es2015
    compile es2015 or ES5 to ES5
babel preset-es2016
    compile es6 to es2015
babel-preset-env 
    compile todo 
babel-preset-react 
    compile jsx to React.createElements calls
# instalando dependencias 
para intalar webpack globalmente
sudo npm install -g webpack
para instalñar las de mas herramientas
npm install babel-core babel-loader babel-preset-env babel-preset-react babel-preset-stage-0 --save-dev

instalando react localmente
ANTES DE UTILIZAR DEPENDENCIAS DEBEMOS CREAR NUESTRO NPM INIT el package.json
npm install react react-dom --save

# quick start with webpack
webpack ultiliza un archivo llamado webapack.config.js que no es nada como un modulo de exportacion en js
module.exports={//some code}
este archivo de configuracion debe convivir con el archivo main(generalmente es el index.js) para poder trabajar bien
O en la carpeta raiz del projecto
# agregando css 
esto es benefcioso ppara nuest4a web para reducir klas solicitudes http 
debemos iinstalar las siguientes dependencias
npm install style-loader css-loader postcss-loader --save-dev

# los desarroladores somos flojos create-react-app
El ecositema de faceboks esta lleno de herramientas una de esos es <$:create-react-app> lo instalamos de la siguiente manerta
npm install -g create-react-app 
que esto nos configura las herramientas necesarias para desarrollar rapidamente con react osea ya configura la estructura de app de react , webpack

# custom validations props
Todos los tipos de de React son funciones. Esta reciben las props y el nombre de la props que se esta invocando y retornan un new Errror(somecode)
```js
const Sumary = createClass({
    displayName:"some name diplay UI",
    propTypes:{
        ingredients:PropTypes.nummber,
        title:(props,propName)=>(//some code validations )
    }
})
```
# las referencias en react (refs)
las referencias se utilizan dobre todo como su nombre de indica como referencia o normalmente se trabaja con datos secundarios o formularios es decir nos dan como un puntero al objeto o elemento al que se esta apuntando

```js
class AddColorForm extends Component {
 constructor(props) {
 super(props)
 this.submit = this.submit.bind(this)
 }
 submit(e) {
 const { _title, _color } = this.refs
 // si no hiciera esto se podria accder desde
//this.refs._title="some title"
 e.preventDefault();
 alert(`New Color: ${_title.value} ${_color.value}`)
 _title.value = '';
 _color.value = '#000000';
 _title.focus();
 }
 render() {
 return (
 <form onSubmit={this.submit}>
 <input ref="_title"
 type="text"
placeholder="color title..." required/>
 <input ref="_color"
 type="color" required/>
 <button>ADD</button>
 </form>
 )
 }
}
```
#manejo de datos bidireccionales
mosrar los datos en un alert esta bien pero eso no genera plata asi que tarde o temprano tendremos que manejar los datos para
ser tratados en la web o en aplicacion entonces podemos crear props que reciban con parametro un funcion y trabajen de acuerdo a esio
eso haria nuestro componenter mas flexible

SomeComponent.propTypes={
    onChangueColor:PropTypes.func
}
<SomeComponent onChangueColor={(args)=>someCode}>

Referencuias en componentes funcionales
Los componentes funcionales tambien pueden usar los refs pero  no de la manera que de estrings si no de funcuiones

<form ref={in=>_varGlobalFunctionBody=in}>
# recomendaciones 
Tratar de que existan una cantidad baja de componentes con estado para poder asi lograr un mejor rendimiento
Podemos tratar todos los datos de una aplicacion en un solo componente raiz ,pero solo en casos donde sea necesario o solo se necesite una cantidad de datos pequeñas por que si esto 
crece demasiado se puede volver una completa molestia.

# Mejora de componentes

# Ciclelyfe -> es una serie de acciones que se realizan en un componente en react antes o despues del montaje 
Hay dos ciclos de vida importantes:
    + El ciclo de vida del montaje
    + El ciclo de vida de la actualizacion

# ciclo de vida de montaje son metodos que se llaman al montar y desmontar un componente

Es6 Class contructor(props) ->componentWillMount()[*componente sera montado]->render()->componentDidMount()[*el 
componente esta montado]-> componentWillUnmount() [*componente sera desmontado]

# Desmontando un componente en React 
debemos importar un la funcion unmountComponentAtNode(target)
Asi
import {render,unmountComponentAtNode} from "react-dom"

supongamos que ..

<SomeComponent onClick={unmountComponentAtNode(target}/>
esto quitara SomeComponent del arbol de elementos pero antes de eso llamara a componentWillUnmount()

esto ocurre cuando se desmonta el componente padre o el mismo componente

# ciclo de vida de actualizacion
este se ejecuta cuando se recibe nuevas propiedades de parte del padre o cuando se llama el metodo setstate  si se llama el setState en el ciclo de vida de la actualizacionesto causaria un bucle recursive infinite
Execto en el metodo componentWillReciveProps(nextProps) este se ejecutara s0lo si se recive nuevas propiedades y es bueno para comparar los props etcc y llamar el set staate
+ compoentWillReciveProps(nextProps)
    este componente se llama cuando cuando recive nuevas props es un buen lugar para llamar el set state
+ shouldComponentUpdate(nextProps,nextState)
    este retorna un bool si retorna true el componente se actualiza y si retorna false el componente 'hace un corte 
    circuito'
+ componentWillUpdate(nextProps,nextState) 
    si shouldComponenteUpdte no esta definido se tomara que siempre retorna true entonces el componente siempre se actualizara este es similar a componemnteWillMount
+ componentDidUpdate(prevProps,prevState) este se ejecuta despues de render y recibe los componentesy porp viejos
# React.Children
react nos proporciona una api para poder trabajar con los niños mo los componentes hijos desde convert5ilo en una matrix
o asegurarnos que solo se muestre un hijo con React.Children.only(children)

# componentes de orden superior (hoc) estos componente tien bastante parecido ala s funciones funcionales

creamos un compnent como un component que retorna una clase como de toda la vida de los componentes de es6

Combined = (Componente,otherparam)=>{
    class SomeComponente extends Componentes {
    //some code
    render()=> someHtml <SomeComponente properties> some Html}}
Se puede usar los metodos de los ciclos de vida en el combinatorio
SomeNewClass = Combined(SomeComponent)
AHora necesita recibir los mismos paremetros que recivia someComponente para que se puede maperar dentro de Combined es decir que combined es como una especie de decorador
ahora solo falta que Some class reciba los paremostros que llegaba a recibir Combined o SomeComponente

#Administracion de stado fuera de React
Flux los datos viajan en una sola direccion las acciones y los datos son inmutables y el despachador matiene nuestros
datos en un cola
accion al despachador al storage al la vista

# Actions and Action Creators
Proporcionan instruccionaes y los datos (son Objetos) como minimo debe tener el tipo o campo  type:"VALUE" que
normanlmente es con letra mayuscula
las tiendas o storage no son nada mas que objeto js
Existen diferetes implementaciones de flux ya que este es solo un patron de diseño

# redux
# Introduction and state

parece descabellado pero todos los datos se almacenan en  un solo storage(matrix,tree) donde estaran todos los datos de unuestra aplicacion aqui es lo magico de redux que la
administracion del stado ya no lo maneja rect si no redux
podemos llenar los primeros datos de una aoplicacion con un json  lso datos son representados con un array donde los datos
se podria decir que estan indexados con los indices de la matrix

     **el estado de una aplicacion debe almacenarce en un unico objeto inmutable**

# Actions 
las acciones son intrucciones que nos indica que datos deberia cambiar del stado
o puede verlo como un recibo de los cambios que ocurren en la aplicacion 
las acciones proporcionan instrucciones de como deberia cambiar el stado o tambien podemos vcerlas de un recibo del historial de cambio del state
Devemos pensar las acciones como erbos genrarlmentwe son llamadas conletras masyusculas y la cuardamos com una consstates
en un archivo _constans.js_
El payload de las cciones sion datos adddicionales para ingresar en el stae o actualziar 

en edux debemos pensar en verbos estos seran las cciones que realizaremos normalmente se coloca en un archivo constanjs.js
una accion no es mas que un objeto de js que como minimo dedebe tener el campo type que indica que accion se realizaraOsea son pequeños paquetes agradables que le dice a redux de como de be cambiar el state
# reducers
EditingOldVersion:Los reducer son la unica manera de actualizar elstado en redux estos reductores toman una rama o hoja de l arbol del
estado y cre y retorna un nuevo state podemos atambien crear un reducer composer para manejar todo el estado de 
nuestra app desde un solo reducer esta reducer se guien por el tipo de accion que debe segui o realizar EditingOldVersion.

# Reducers
Los reducer son los encargados de manejar las partes del arbol se encargan de crear o actualizar el sstate los reducers son
los unicos capaces de actualizar el state podemos crear varios reducers para manejar partes del arbol o solo crear un reduc
estas funciones lamaas reducers reciben el state y un accion a realizar

lA COMPOCISION DE REDUCER NO ES REQUERIDO ES SOLO UNA RECOMENDACION
Por mas tentados que paresca hacer un state.push(some) or stag[index] debemos trataral stage ccomo un objeto inmutable

las funciones asyncronas deben generarce fuera de los reducers

#Primeross pasos 
debemos importar las funciones creaeStore and combinedReducers del modulo redux

import {createStore,cominedReducers} from "redux"

sorage = createStorage(combinedReducers(reducer1,reducer2),initialState)
los campos del storage son creados con los nombres de loss redducers

storage.dispathc({someAction}) essto se encara de hacer su trabajao}
podemos obteener el sstage con storage.getStage() // {stage}

# subscribe(function)
podemos subscribir funciones para que se ejecuten cada vez que se termina una accion osea despues que comcluye el metodo dipath
El metodo subscribe devuelbe una funcion que puede invocar para cancelar de dessubscribir la funcion oyente

Guardando datos persistente en el navegador
const store = createStore(
 combineReducers({ colors, sort }),
 (localStorage['redux-store']) ?
 JSON.parse(localStorage['redux-store']) :
 {}
)
# El creador de acciones 
Encapsula toda la logiaca de crear accione claro que esteos mismo retonar una accion od}sea con lo minimo de 
un campo type y por supuesto es un obj js

Redux viene con una funcion incolrporada llamada compose 
que nos facilita la tarea compose retorna una funcion ya compuesta

podemoss agregar midleware a ereux co su funcion applymiddleware que vien en redux
store = createStorage(reducers,applymiddleware(..middlewares)

# Redux and react

# El contex

El contexto es conmo un jet imaginaseviajar de washinting dc a california el jet pasara por los 9 estado pero no necesaria mente
aterrrizara en uno, el contextyo funcina de esa manera el contx es un objetos de js

Al componente que sera la raiz del la app de o de un frupos de contexo y que manejara el contexto debemos agregar el metodo
getChildContex() esrte debe retornar el contexto(un objeto de js) este contexto puede ser tomado desde las props
al componente debemos agragarle como las props los tipos que recibira con SomeClassComponentRoot.chi8ldContexType={}

los elemntos hijos o los que estan dentro del methos render tendran acceso al contexto
si es un componente funcional aparte de recibir las props en el primer parametro recibirar el conotexcto en el segundo paramentro
Y si es una clase componente se podra accdeder ha este mismo atravex de this.context si9 es lun componente funcional o clases
debe terner como las props el mimo tipo del conctex en SomeComponent.contexType

# AHORA SI REACT REDUX
debemos instalarlo de la sig manera
npm install react-redux --save

 Comocrear un contexto rapido en redux?+
reduc ya nios proporciona un contexto rapido que requiere una propiedad store como param
y los elementos hijops pueden accder facilmente a el como ya lo vimos mas adelante
import {Provider} from "react-redux"

render(<Provider store={store}><App/></Provider>,destino)

# redux connect es una mierda depues lo revizare 

# Testing
install
    :sudo npm install -g eslint
Eslint utiliza un archivo de configuracion de archivo raiz para la configuracion podemos agarar uno de los ya creados por 
compañias o crear nuestro propi respondiendo preguntas
$:eslint --init
#TDD test driven development
No es una tecnologia es una metodoligia de trabajo que indica que desarrollemos primero las pruebas luego el codigo
# testing reducers 
insstlaremso algubnas dependencias ,jest en especial
$:npm install jest --save && npm install babel-jest --save-dev

Los projectos creados con react create app ya tiene jest incorporados y las pruebas la llevan acabo en las carpeta __test__
jest tiene dos funciones describe and it 
que ambos reciben un nombre o suite y el segundo argumento un callback
describe se utiliza un conjunto de pruebas y la funcion it para hacer las pruebas
estas dos funciones son las mas imnportantes de jest
Jest ejecutara cualquier prueba que este en la carpeta __test__ y cuyos archivos terminen en .test.js algunos desarrolladores
prefieren colormlas pruebas al lado de sus archivos qu estan ejecutando como podemos esperar y comparar si es el resultado corecto?

jest nos proporciona una funcion llamada expect(SomeValueQueDevolvioAlgop).toEqual(El valoresperado)
Si estamos trabajando con programacion funcional o queremos asegurarnos que los objetos sean inmutables afurumnadamente existe una hwerramienta para ayudarnos en esto

$:nopm install deep-freeze
from deepFreeze from 'deep-freeze'
la funcion deeepfreeze recibe un valor este se encarga de asegurar de lanzar un error si es mutado en algu  lugar de la prueba

BeforeAll(cb)(antes) y afterAll(cb)(despues) se ejecutan al antes y esopues de cada agrupacion de codigo de testing
befoereEach(cb) afterEach(cb) se ejecutan antes y despues de cada declaracion it estas funciones son de buena practica
en jest
Para trbajar con el domen node existe un paquete llamado jsdom

para configurar unas pruebas de componentes de react 
package.json:
"jest": {
 "setupFiles": ["./__tests__/global.js"],
 "modulePathIgnorePatterns": ["global.js"]
}

"jest": {
 "setupFiles": ["./__tests__/global.js"],
 "modulePathIgnorePatterns": ["global.js"],
 "moduleNameMapper": {
 "\\.(scss)$": "<rootDir>/node_modules/jest-css-modules"
 }
 }Esto le dice a jest quye ignore los modulos que importen archivos css less para que no ocurrar errores en las pruebas
# Enzyme
Install
$:npm install enzyme react-addons-test-utils --save-dev

enzyme fue creada por airbind ,enzyme tiene 3 metodos principales
shallow -> para renderizar el componente a una profuncdidad de testing
mount-> renders el componente utilizando el DOM delnavegador
render -> para revizar si se esta renderizabndo el HTML correspondiente

el metodo shallow  debuelve un objeto con metodos que permite buscar como si fuera o tratase de una busqueda con Jqyuery

simular un click podemos con jest

cont \_click = jest.fn()
simulemos el vento en un componente lñlamadao STart

shallow(<Start onClick={_click} />.find('div.start').simulate('click')

expect(_click).toBeCalled() // tobe called_ se utiliza para verificar si una funcion simulada fue ejecutada

# Mocking componentes o los componentes de burlas son componentes que funcionan como los dobles de 
riesgo en holliwood
 El meetodo mOunt recive un HOC como arcumeto 
 pero una vez hecho el primer paso colocamos en el argumento de mount el compoeten como si estubieramos trabajando normalemente
esto nos regresa un wrapper de esrte poerdemos obtener una instaccion del mismo componente o tan solo
hacer un find como Jquery y continuar trabajando

 # Prueba de instantanea 
 el metod .toMAtchSnapShots() que devuelve hacer un expect de algo
 Guarda una instantanea exacta del componetes q se renderizo en una carpeta llamada __snapshots__
 jest  __updateSnapshot or jest --wath son comando que nos ayudaa en el desarrooolo de pruebas

 # using Code Coverage convertura del codigo

jest --coverage
este nos da unn informe detallado de las acciones de la pruebas en quelinea s que acciones o sea un informe de las pruebas d}reañizadas

La covertura de codigo presenta un infrome mas detallado de lo ocurrido esto lo podemos ver en el navegador esto podemos encontrarlo en
la carpeta coveragedentro de nuestra raiz del projecto

# react router
react no tiene un enrutador como otros framework como angular emberss etc  pero la comunidad desarrolo react router

Install:
    $:npm install react-router-dom --save
hashRouter -> es una buena funciuonalidad paa manejar aplicaciones relativamente pequeñas ya que si savemos # es un lugar 
hacia alggun id de la page si le damos clcik eso es lo que nos ayuda esta funcionalidad para aplicaciones mas grande existe browser router


<HashRouter>
 <div className="main">
 <Route exact path="/" component={Home} /> // comopodemos ver aqui los componetes que estan en el atributos de la ruta en las props del componente
 <Route path="/about" component={About} />
 <Route path="/events" component={Events} />
 <Route path="/products" component={Products} />
 <Route path="/contact" component={Contact} />
 </div>
 </HashRouter>
Ahora podemos ir a 
    domain.com/#/about
    domain.com/#/events
Aora vemo el porque de las almoadillas
 react-router-dom{import {Link} from 'react-router-dom'} nos proporciona un componente parcido al <href='someurl'>someurl</a> es igual a
 <Link to="about">title del link</Link> esto crea rutas dentro del navegador
 que pas si quremos imuilar el error 4040
 necesitamos el componente Switch y si la ruta selecciona no es ninguna de los casos dentro del componente Swith arrojara el componente que no tiene una ruta definida

 Reac router proporviona un   componente llamado NavLink que se puede usar para organizar nuestras rutas son exactas
 <NavLink to="/some" >
    Some tex or html o components
Si este navlink tiene un componente child ese componente recive props de ubicaion por el primer NavLink no necesita
tener la propiedad acticStyle pero los otros componentes si lo necesitan
</NavLink>

Sub rutas como los componentes dedentro de  un NavLink deben tener una pequeña propiedad

const SomeComponente = ()=> <navLink style0{match.isExact} //esto  solo sucede en subcarpetas>

#Using redirects
El componente Redirect nos permite redireccionar de una ruta otra esto es util cuando el usuario intenta accder atravez
de una ruta antigua 
Esto debe funcionar dentro de un Switch
<Redirect from="/some" to="/somePat/somealgo">

Como los componente en Router reciben las props de los los datos de navegacion podemos decir entonces que

SomeComponent = ({match})=> match.history.pop() //esto es como un atras en el historial
O podemos utilizar un Hoc que le da superpoderes de enrutamiento a un Component con el HOC withRouter(SomeComponente)
este some componente es una clase que automatica mente pude navegar por si solo en su propio historia que 
recibe en las props
Los parametros se puede recuperar con match.params.nameParam
/:id/hola/:name

# Rendering del lado del servidor
ReactDOM tiene un metodo que ayuda a renderizar reactjs dentro del servidor
import {renderToString} from "react-dom/server"
global.React = React

var html = renderToString(<SomeComponent id="2"/>)

Promp es un componente que recive dos props principalmente 
when -> que cuando es true permitira el mensaje de solicitud de si se va para atras pero si es falso permite la navegaion hacia atras el segundo prop es message -> es un callback que recibe location y debe retorna un mensage








