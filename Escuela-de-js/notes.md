#frontend developer
##paginas recomendadas 
htmlreference.io -> todas las etiquetas de html y sus caracteristicas
cssreference.io -> todas las  caracteristicas de css
#dom(document object model)-> transformacion del codigo html a objetos entendibles por el navegador
#cssom(cascade stylesheet style object model)->convierte el codigo css en objetos entendibles por el dom
#tree tree-> no es mas que la union del dom y cssom en esta parate pasa por un proceso
bytes(En este proceso el lee la codificacion de la etiqueta charset y va codificando de nuevo el html de acuerdo a los bytes indicados)->characters(El codigo que retorna depues de ser analizado por los bytes)->tokens(una serie de codigo que indican aqui comienza y aqui termina)->nodes(son los objetos ya parseados)->dom(aqui se va renderizando de acuerdo a la jerarquia)
primero hace el dom despues hace el cssom luego el render tree que es el dom + cssom -> luego ejecuta el diseño del rendier tree y pinta el nodo en pantalla
Hacer  debbugin de html? si en validator.w3.org 
emoji eyboard online
#pseudo clase estos elementos son como una pisca de azucar a los selectores y siempre comienza con :
vamos a comprender el pseudo elemnto :nth-child(x)-> x hace referencia al una seleccion de elemento de acuerdo a una ecuacion matematica
supongamos que tengo 4 parrafos
<<n hace referencia el elemnto encontrado en esa posicion>>> si quiero que solo los elementos que esten en una posicion paa sea de color rojo pueno eso seriap:nth-child(2n){
...
}
<p></p>
...
#los pseudo elemntos son elementos que se añaden o se crean al elemnto seleccionado al momento de una reaccion y estos comienzan siempre con ::
#medidas existen mediadas absolutas<in,cm,mm,px,pt,pc>(las que no les importa quien carajo este delante de ellos) y las medidas relativas si les importa por que estas toman en cuenta los que estasn en ellas sobre ellas  o su padre<vmax,vmin,em,ch,rem,vw,vh>
#modelo de caja primero el contenido->pading->border->margin
#una paginaweb de combinacionde colores colorhunt.co
#que pasa si queremos que se respete el width y el alto y que el padding o el margin no las viole ->box-sizing:border-box;
#display 
block->este se acomoda una debajo del otro
inline->los elementos con este se acomodan al lado de su compañero
inline-block-> lo mismo que el inline pero este respeta el alto y ancho de los elemnto
table->se comportan de la manera de los elementos de table
#Arquitecturas de css 
OOCSS->object oriented css esto se debe describir solo ya que a este punto ya conocemos la programacion orientada a objetos
BEM->Block Element Modificador
	header__buttom--colorRojo
SMACSS -> escalable no se ya me olvide despues lo invetigo aqui se necesita una base->layout->module->state->theme
Atomic Design -> esto se basa en crear           atomos                              moleculas                 organismos
									pequeños componentes(botones,sele....)	unimos los atmomos entre se| son los templates pagina
#una pagina de buena documentacion
css-tricks
Un juego para poder aprender css flexbo> flexboxfroggy.com
tambbien hay uno para css grid cssgridgarden.com 
buscar informacion de los tabindex y sobre ala accesibilidad
buscar informacion de los tabindex y sobre ala accesibilidad
buscar informacion de los tabindex y sobre ala accesibilidad
