#funciones de salida estandar y de retorno fromaeado
- famila de las Print \*
	- estas funciones muetran el resultado de en la salida standar osea la terminal o el simbolo de sistema
	- importante que retornan dos valore un int y un error el int es el numero de bytes mostrados o traados
- familia de la Sprint*
	- bueno estas retornan la cadena ya formateada
#formateodeo de cadenas verbos(marcados de posicion)
	los caractere desued del % se llaman bandera
> formato predeterminado %v este retorn directamente el valor de la posicion y el tipo representado
> existe otra %#v esta se llama representacion de sintasis se prodria decir que lo traa y muestra exacamnte como go lo ve un estructura retornaria struct{campo type;campo type}{campo:value ,campo:value}
> badera de campos %+v este nos retorna lo campos por ejemplo de una srucutra
> formato type %T este retorna el tipo
> formato booleano %t
>tratando con numeros

|decimales|octales	|binarios	|hexadecimales|runas|
|--	|--	|--	|--|--|
|%d   |%o   |%b	|%x|%v|

bueno cabe resaltar unos trucos si pones %+verbo este te va a mostras el signo y si pones %#verbo te añadira el valor como se representa 0xff o 0Xff y si le das un espacion % d 21 231 213 231

#numeros decimales %f y %e notacion cientifica

> %w.pf => w es el ancho y p la precicion

w y p son opcionales go los tratara mientras que el si se decide utilizar uno es obligatoriro
#%c caracter o runa %U para saber el codigo unicode

#%s cadenas %q cadena scapado
printf("%s",[]byte{231,213,21,321,321,3,231,321})//string is hello
#un print con ascii %+q y %p para la direccion de puntero

#errores en go, go no tiene un ry cath como los otros lenguajes pero si se pude tratar con un valor error cuyo valor 0 es nil osea cuando no ocurre ningun tipo de error y por conveniencia siempre es el ultimo valor de retorno
error es un tipo incorporado globalmente o mejor dicho es un interfaz que implementa un metodo error que devuelve un mensaje de rror de cadena
podemos crear un error y retornar un error string que es un tipo struct que esta implemntado en el oag errors

func sample()(int ,errors){
retutn 0,errors.New("message of errors")
}
innnt,erro=:=sample()
#panic recover bueno no le puse mucha atencin asi que debo volover a leerlo
entonces lanzamos un panic("message of panic") y si queremos recuperarlo ultilizamos la funcion recover()
recover retorna un valor nil si es que no hay ningun panico y si es lo contrario retorna lo que fue enviado en panic 



