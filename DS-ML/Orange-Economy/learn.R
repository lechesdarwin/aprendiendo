#asignacion de varibles
a =2
b <-4
4->e
#guarda una imagen de como quedo tu trabajo hasta el momento
save.image(file ="actual.Rdata")

#carga todo lo que guardaste en la imagen
load(file = "actual.Rdata")
#remove toda la memoria esto elimina todas las variables
remove(list = ls())
 #fatores la funcion agrupa ? valores de repeticion?
#aplicas taplly nu vector un factor y una funcion a aplicar 
# y busca encontrar una relacion de los valores
n=c(1,1,0,0,0,1,1,1,0,1)
fn=factor(n)
#tambien se puede "hacer un filtrado de datos
#vector? vector[vector <1] 
# un array n dimensiones matriz fila columna
#cambiar la dimension de un vector
v=c(1:20)
dim(v)=c(5,4)#5 filas y 4 colunmas
#creando un array y matriz
array(1:20,dim = c(5,3,2))
matrix(1:20,nrow = 10,ncol = 12)
#operaciones 
#productor exterior osea multiplicar dos matrixes
x=matrix(1:20,nrow = 4,ncol = 4)
x=matrix(10:40,nrow = 4,ncol = 4)
outer(x,y,"*")#el tercer paramentro es la operacion a realizar
x&o&Y
#la traspuesta 
t(matrix)
diag(matrix)#tambiens epueden dev etores
#data frames funciones atach y detach
#atach(dataframe)  coge todas las variables o colunas y estan diponibrls al scope original
#detach es lo contrario de atach
#lectura de archivos sin espacio sin separador
read.fwf(file = "nombredelarchivo",skip = 3#cuantas lineas se va a saltar
         ,widths = c(23,32,32)#los vectores de ancho de los datos que se tomara
         ,col.names = c("de")#vector de nombe de columnas tambien se puede con las filas
         )
#leyendo csv file o separados por algun caracter read.table read.csv read.csv2
#blucles for como python while el de diempre repeat{code} next == continue
#interesante las operacionde binarias
#algo como un alias
"%m%"<-function(x,y){c#ode
}

2%m%2 #call
#lograr que una variable del scope de una funcion se vuelva "global2
var <<- value
#algo como si fuera una clase el crear un lista con funciones detro de la funcion e ir llamando 
#a=func();a$m()
#manejando errores
try(funcion)#esta si falla no para la ejecucion pero devuelve el error
#warnig("mesage de warnig")
#stop("para la cosa")
#trycatch({code a intentar},erros=function(err)#trata ek error
#  warnings<-function(recivaQueWarnig)
#   finally-< {executa el bloque}#
#.)