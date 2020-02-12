Una buena practica en reactjs es dividir en partes pequeñas un componente hasta que no se pueda mas 
# que es JSX?
en Javascript XML !! impresionante

bueno los atributos de las etiquetas de html sson atributos de cierta manera pero en 
jsx son atributos o palabras clave de js ¿como?
+ este un html normal
	<div class="algo">
+ en jsx
	<div className="algo">
	bueno como sabras classname es un atributo del objeto cuando hacemos un
	docuemeent.getElementById("algo").className
	IMPRESIONANTE!!!
	tambien veremos que una sintaxis con llaves dobles y simples
	las llaves externas denotn para mostrass codijo js
	un pequeño ejemplo
	
	<div style={{background:red,color:black}}> 
	<span>{"Hello"+"worl"}</span> # lo ves ? no es mas nada mas que como abrir un bloque de codigo nuevo de js

Hay reacjs parece que sera un dolor de cabeza par cconfigurar para typescript o adaptar a web

# Props(accesrios) PropTypes(accesorios de tipos)
como se sabe javasript es un dolor de huevos

React tiene los props del mismo objeto ,esos props son las propiedades del objeto js que nos devuelve al seleccionarlo de alguna manera
 Esto nos ayudara ha realizar componentes mas dinamicos
```javascript
	import React ,{Components,PropTypes} from 'react';
	class Title extends Component{
		render(){
		return(
	<h1>
	this.props.titleText
	</h1>
)}}
```
como ya dijimos js es un dolor,ahora no vez problemas con esto verdad? bueno a media que esto crece se hace mas complicado mantener esl codigo
por eso se creo 
# PropTypes
Los propTypes estan unidos en toda las clases , es decir son staticos.Agregar los protypes no hace la diferencia exactamente pero le mostrara mensages molestos n la consola (solo si esta en modo desarrollo)
Validadndo si son de los tipos correspondientes string,number,,func
Title.propTypes = {
titleText : PropTypes.string
}
Title.propTypes = {
Title.size: PropTypes.number,
}
Reac me esta empezando a encantar!
que pas si queremos tipós opcionales ?Utilzamos el metodo oneOf y el parametro son los tipos posibles en forma de un arrar
PropTypes.oneOfType([
PropTypes.string,
ProtTypes.number
])
Ahora le damos la oportunidad de que pueda ser number o string

Tabien podemos hacer lo mismo con valores predetermnados opcionales algo asi como un enum con el metodo oneOf este reecibe un array del rango de valores posibles
COMO SABRAN ALGUNOS ELEMNTOS CSS TIENEN DE NOMBRE - SOME ESO SE SOLUCIONA HACIENDO UN CAMELCASE

porsupuesto podemos crear tipos complejos

propTypes: {
	//un array de cualquier tipo
	simpleArray: PropTypes.array,
	simpleObject: PropTypes.object,
	//un array de un tipo,en este caso uno de numeros
	arrayTypado: PropTypes.arrayOf(PropTypes.number),
	//un objeto mas complicado tomalo con un struct en c o go
	someObject:PropTypes.shape({id:PropTypes.number,
PropTypes.string
})
}

Quieres hacerlo mas limpio?Bueno solo agrega un atributo static con el nombre propTypes igualando a un objeto con los attr necesarios 
Bueno muy beno pero Este azucar sintactico de Js no es compatible aun con todos los navegadores por lo tanto utilizaremos
SomeClase.propTypes = {//attr}
# Props(Accesorios) 
Los strings son los unicos que se pueden pasar directamente entre comilas
pero los demas debe comenzar con llavez para que se interprete de lo que viene es cdigo js
En el caso de los booleanos estos se pueden ommiter ya que estos funcionarian de las misma manera que en html osea su precesia sera true y su ausecia sera false

_Si nosotros no ponemos los valores o no olvidamos de colocar los props tendran un valor por defecto que es undefined esto puede causar muchos problemas_

Por suerte tenemos un propiedad (una propiedad estatica en el casod de que fuera una clase) llamada defaultProps "deben" contener objeto con las props definidas anrteriormente con sus respectivos valroes por defecto

class Auto extends Component{

	render(){return(
	<h1>{this.props.titleText}</h1>
)}}

Auto.PropTypes = {}
Auto.defaultProps = {}+

#Prop.children este amiguito se toma o mejor dicho es todo lo que este entre nuestras etioquetas del component+

render(){
return(
<h1>
	{this.props.children}
</h1>
)
}

sabemos que se pueden pasar o añdir eventos ,una manera es hacerlo atravesde  la api de manipulacion del dom
o la manera artersanal que es ponenerlo dentro de la etiqueta ,en ereact js se parece a la manera natrersanal
Podemos crear un metodo y agreagando el contexto¿Pero es algo verboso verdad?
onClick(){
//some code
}
render(){
return(
<div className="someClass" onClick={this.onclick.bind(this)}>
)

O mejor creandolo en el metodo contructor

contructor(props){
super(props)
this.onClick=this.onClick.bind(this)
}
En ese caso solo seria
<div onClick={this.onclick}>

React maneja el estado de un componente atravez de la propiedad state,su valor debe ser igual a un objeto js ahi podemos poner las diferentes propiedades que deseamos manejar
Este estate no biene con un estado predefinido pero nosotros podemos agragarle un estadopen el contructor
NO DEBES MANIPULAR DIRECTAMENTE EL OBJETO DE STATE¿prque? por que si lo hacemos asi no se notificara al componente para eso hacemos uso del metodo **setState** 
que recibe como argumento el objeto de nuestro estado este llamara al metodo render para actualizar nuestro componente

# ciclo de vida del componente 
Antes renderizar un componente en el DOM este pasa por una serie de pasos previos

1. componentWillMount() React comprobara si el compnente tiene esta clase si esa asi lo llamara este es un buen lugar 
para configurar una serie de parametros como colocar un temporizador para que empieze la llamda al servidor
2. render() este metodo sera llamado para parsear todo el jsx y comvertilo en html o en pocas palabrar lo montara
3. componentDidMount() este se llama una vez que el componente se monto en el dom pero este es un component opcional generalmente
se utiliza para llamar libreias externas pero recuerda no utilizar otras librerias que manipulen el dom si estas trabajando con React podria causar una catastrofe
Despues de esto el componente se enecuentra estable y es posible que necesite actualizarse y esto suscede por que el padre le pase nueos props o ocuurra un evento de ususrio esto

# the update cycle

1. componentWillRecivedProps(nextProps) aqui solo sabremos las propiedades que recive un component las nuevas y las vejas
aqui podreemos compararlas este ciclo de vida es bueno para actualizar el estado ya que es el unico metodo de estado que no se require al observar los cambios
2. shouldComponentUpdate(nextProps,nexStatei) este metodo se llama cuando ocurren cambios en el estado o los accesorios(props)
aqui podemos comparar los nuevos y viejos, pero este es especial ya que retorna un booleano
si retorna true este se actualizara
si retorna false este hara un 'cortocircuito' y no hara ningun cambio
3. componentWillUpdate(nextProps,nextSate) este es el ultimp paso para el ciclo de la actualizacion , si shouldComponentUpdate no esta definido se asume que siempre retornara true (imaginate el costo peiensalo) en este metod mayotmente se prepara para el drenderizado
4. componentDidUpdate(prevProps,prevState) este es ultimo paso despues de render termina su trabajo este es muy similar como trabaja shouldComponentUpdate solo que este recibe los componentes viejos

# Desmontaje de componentes
1. componentWillUnmount() este es opcional y es un buen lugar para eliminar cosas que nuestro componente halla creado un ejemplo es el intervalo de tiempo que creamos en componentWillMount

# alternativas ReactCreatclass  esta se utilizaba antes de la sintaxis de es2015 (pag56)

# functional componentes
Estos son creados para componentes con mayor simplesa quier no maneja estado de vida o unn estado , ya que solo manejan los props 
Se recomineda usar este tipo de componentes cuando sea necesario ya que son mas eficientes que los anteriores pero esos pueden usar tranquilaente propTypes y deafultProps
conts Title = () => (
<h1 className="auto">
	{this.props.children}
 </h1>
)

Me quede que toca iniciar en rect native
# inciando con react native
eror de usuario en npm 
solucion
sudo chown -R $(whoami) $(npm config get prefix)/{lib/node_modules,bin,share}
Herrameioentas
	Xcode para emular ios e empaquetar la aplicacion pa aios
	watchman como el hot reload de flutter (en archivo envconf.sh) esta como instalrlo
	flow añade anoitation a js ,para eso mejor usamos ts

bueno note re rompas la cabeza ,create-react-app utiliza un marco de herramientas definidas por Expo el cual tien un monto de 
bibliotecas nativas ,pero la desventaja que cuesta un huevo extender nuestrasm propias bibliotecas nativas
en cambio react native cli ese es mejo si queremos expandior mas adelante nuestra aplicacion con bibliotecas nativas

