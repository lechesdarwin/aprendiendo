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
# me quede en 137
toca react stage managent
