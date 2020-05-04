# macros con varaibles variadics
las macros pueden recibir args variables
```c
#define ADD(x,...) printf(x,__VA_ARGS__)
```
# compilacion condicional

#ifndef
#ifdef
#elif
#endif
#else

#pragma
es como un remplazo para #ifndef #endif
podemos pasar como argumento desde la linea de comando una definicion con laopcion -D
#ifdef CON

es este caso no esta defino por lo tanto podemos definirlo desde la linea de comando
gcc -DCON file.c

Paso por referencia no existe en C , todos los argumentos se pasan por valor pero la desrefenciacion nos ayuda a 
simular el paso de referencia , el paso por puntero en tipos primitivos es mas eficiente que pasarlo por puntero,
pero no es el caso para las estructuras y arrays

# definicion de nuevos tipos 
Por buena pactica o un estandar los nuevos tipos terminan en ```_t```
# loas archivos de encabezados solo deben incluir archivos de encabezados,los archivos de codigo fuente solo deben inclluir headers, esto es una buena
paractica ademas su no lo hace esta haciendo cagadas.

# Reglas para compilar
+ solo se compila archivos de codigo fuente
+ solo se debe compilar un archivo a la vez ,aunque el compilar pueda compilar dos archivos en un solo comando esto es una 
mala idea
cpp -> C preprocesador
as -> assembler 
ld -> linked de objects
nm -> vuelca la tabla de simbolos
objectdum -> vuelca el bojeto
readelf -> vuelca la tabla de simbolos en un objeto ejecutable
.text todas las instrucciones a nivel de maquina
.data todas las strucuturas  y variables globales
.symtab tabla de secciones de direcciones de objetos
.dyn tabla de objetos compartidos dinamicamentes

# librerias staticas 
Son mas que todo contenedores(de objetos) que se desempacan a momento de ser utilizadas por el linker, estans son 
desempaqutadas las bibliotecas staticas en UNIX los nombre comienzan con lib y terminan con la extencion .a
en windows terminan con .lib
$ar crs libname.a some.o files.o obtes.o ...

ahora para vincular nuestra bibliotica statica con nuestra nueva aplicacion ejecutamos el sig comando

$ gcc main.o -LpathAniveldecaperta -lnombredelaBiblioteca -m -o salidaejecutable.out

-Lpath indeica la carpeta donde puede encontrar las bibliotcas staticas
-lm le dice que busque el el archivo libm.a or libm.so esto es ncesario para algunas funciones matematicas 
-lgeometry le dice busca libgeometry.a or libgeometry.so
-o esta es la salida

# object compartido o dymamic library o bibliotecas compartidas
Estos objetos se cargan en ejecucion y si la biblioteca compartida no tiene el objet compartido dara un error

Create a objet para convetirlo en un objeto compartido
$gcc -c somefile.c -fPIC -o nameobj.o
convirtiendo en un objeto o compartido
$gcc -shared some.o objec.o compile.o with.o fPIC.o -p libname.so

bueno supongamos que compilaremos junto con la funcion main

$ gcc -c main.c -o main.o
$ gcc -L/opt/geometry -lgeometry -lm -o main.out
$./main.out
>error fatal

Esto nos da error por que no especificamos la ruta de objetos compartidos en la varible de entorno para eso colocamos
$ export LD_LIBRARY_PATH=/opt/geometry
tenga en cuenta que se puede agregar mas rutas con el separador de :
or . Esta tecnica es comun

$ LD_LIBRARY_PATH=/opt/geometry ./main.out
tambien funcionara
# car manual de librerias
esto es increible al moneto de decidir si se carga o no algo de acuerdo anuestro codigo
supongamos que linkeamos la libreia math directamente en nuestra library
$ gcc -shared geometry.o -lm -o libgeometry.so
```cpp
#include <dlfcn.h>

void *handle = dlopen("/opt/geometry/libgeometry.so",RTLD_LAZY)
func_ptr = dlsym(handle,"func_que_quiero_traer");
func_ptr(some some)
```

# Memory process structure
## segmentos de datos
### bss
Aqui se "colocan" las variables globales no inicializadas
### data segment
Aqui se colocan las variables globales inicializadas
### text segment or code segment
aqui viene el codigo a nivel de maquina
> los siguientes dos son parte de la "memoria dinamica" se cargan en tiempo de ejeucion
### stack segment
Es de tamaño limitado , normalmente contiene las vasriables no puede almacenar objetos grandes
### heap segment
es de tamaño "ilimitado" (en concepto por que tecnicamente no lo es),almacena objetos grandes

>La memoria deinamica constade tres elementos de la memoria estatica y los otros dos de la memoria dinamica
>Enotonces consta de 5 elementos


# resumen
Podemos mirar el tamaño de los segmentos con el comando `size` pero no su contenido , esto aplica para memorias estaticas
pero existen otros comando para ver su contendido como `readelf` `objdump`

# variables staticas
Estas pueden ser inicializadas en el segmento bss or data segment dependiendo de la plataforma o si son o no inicializadas
```
// una de sus caracteristicas es que conservan su valor coforme de manera global
static [type] name;
```
Podemos ver el contendido del objeto ejecutable

```sh
objdump -s -j .data prohgram.out
```
la -s indica que muestre todo el contenido
-j incica que seccion tomar como vemos en el ejemplo le dice que tome la seccion .data 

nos muestras 4 columnas 
la primera son las direcciones
las otras 3 son bytes de contenido y en la ultima columna muestra la representacion en ASCCI si tiene un . significa
que no puede ser representado por un caracter alfanumerico

__dynamic memory layout != dynamic memory allocation__

# preparando un debbug
Para depurar un binario en c con herremientas como gdb debemos indicar al compilador que lo compile con opciones de
compilacion esto se logra con la opcion -g

>$:gcc -g name_file.c -o out.out

Listo! ya tiene un binario de depuracion

# trips
para convertir los warnings en errores simplemente agrege la bandera -Werror, o para especificar el warning en especifico 
solo basta con -Werror=el-nombre-del-warnign

# malloc and calloc
malloc asigna un bloque de un determinado tañaño que se le pasa de argumento-> es mas rapido que calloc
calloc resibe 2 params el primero es de cuantos bloques y el segundo del tamaño de cada bloque , es mas lento

si quiere inicalizar los bloques en algun valor despues d utilizar malloc , veo el siguiente codigo
```c
#include <stdlib.h> // For malloc
#include <string.h> // For memset
int main(int argc, char** argv) {
 char* ptr = (char*)malloc(16 * sizeof(char));
 memset(ptr, 0, 16 * sizeof(char)); // Fill with 0
 memset(ptr, 0xff, 16 * sizeof(char)); // Fill with 0xff
 ...
 free(ptr);
 return 0;
}
```
## realloc
reasingna le tamaño del bloque asignado recibe dos parametros u puntero desde donde se expandera, el segundo parametro es 
una el nuevo tamaño del bloque.
realloc no elimina los datos del bloque viejo solo expande el bloque , si no puede expandir de nuevo por causa de la
fragmentacion de la memoria copiara los datos a la nueva direccion,realloc es una operacion costosa asi que debe manejarse
con cuidado
```c
int main(int argc, char** argv) {
 char* ptr = (char*)malloc(16 * sizeof(char));
 ...
 ptr = (char*)realloc(32 * sizeof(char));
 ...
 free(ptr);
 return 0;
}
```
# fugas de memoria
podemos rastrearlas con la herramienta llamada valgrid, con el programa compilado con la opcion -g y despues pasarlo como
parametros dde valgrid.
>$:valgrind objexecutable_with_opcion__g
O podemos indcar exactamente en que lineas son las causantes de la perdida de memoria
>$:vagrind --leak-check=full objprogram

