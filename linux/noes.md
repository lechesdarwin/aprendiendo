# chown cambia el propietario de un directorio
# chgrp cambia el grupo propietario
#chmod cambia los permisos de ficheros
permisos especiales

Permisos especiales    permisos    Uso
Bit SUID            rw**s**rwxrwx  Usuario ejecuta con los permisos del propietario 
Bit SGID            rwxrw**s**rwx  Nuevos ficheros y directorios heredad grupo propietarop del directorio es decir que todos sus desencdientes herederara de la carpeta<uso chmod g+s>
Sticky Bit          rwxrwxrw**t**      Evita que los ficheros puedan ser borrados por usuarios que no son sus propietario un ejemplo como el caso del directorio de tmp todos pueden escribir ejecutar leer pero solo los creadores pueden borrarlos
# umask
Establece el valor por defecto de los ficheros por defecto
# enlace de referencia
un fichero es un puntero a una direccion de datos en el disco
entoces un enlace de referncia tambien lo es
si se borra el fivhero se borra la direcion pero aun queda y se puede accdeer desde el enlace de referencia
no es posible hacer enlaces de referencia en diferenctes particiones si o si tiene que estar en la mismaparticion

# enlace simbolico
no es mas que como los accseos directos de windows
es un puntero al puntero de del fichero 
en este si se pueden hacer enlaces simbolicos en diferencientes particiones
# ln para crear enlaces
    + -f boorar otro parecido a el en el sitema de achivos
    + -s para crear  un enlace simbolico
    + -i interactive
    + cuando se crean se copia exactamente lo mismo que el original

#estandar FHS este define una serie de directorio y archivos
/usr todas la aplicaciones de linux de un equipo
    /src codigo fuente de aplicaciones
/opt apps de terceros
***INVESTIGAR EL STANDAR HFS***
# busqueda de fichero
find este hace una busqueda a fuerza bruta en vivo de los parametros
    + -name Busca nombre de ficheros
    + -size Busca por tamaño
    + -perm nusca por tipo de permisos
    + -gid busca por grupo propietario
    + -uid busca propietario
    + find ruta params
locate este utiliza una base de datos que indexa los contenidos del sistema de fichero
updatedb este actualiza la base de datos de para locate
    + -i ignora Ignoara las mayusculas es decir 
    + su configuracion esa en /etc/updae.conf
whereis nusca ficheros ejecutables documentacion o configuracion
    + -b binarios
    + -m manuales
    + -s ficheros de configuracion
type indenfica de como es el comando en el sistema es decir un comando interno externo o alias
# TEMA 105
# gestion de de variables de entorno
    unset -> elimina una variable de entorno
    env -> print all vars de entorno
    export -> convierte un a varible local a glogal
  # variables de entorno
  USER el nombre del usuario logead en la shell
  SHELL indica la shell que se usará /bin/bash
  PWD indica el directorio donde se enecuentra actualmente el usuatrio
  HOSTNAME el nobre del host tcp/ip del sistema
  PATH establece la ruta donde estan los ejecutables de los programas
  LANG guarda la configuracion del idioma del sistema
  TERM guarda el emulador usado como terminal grafico
  PS1 and PS2 son las varibles que almacenar el promr de una terminalr root@host:~#
  NTPSERVER 
  DISPLAY nos muestra la sesin de entorno grafico donde se esta ejecutando

  *archivos de configuracion de la shell*
  tipo de archivo  Ficheros de login                Ficheros de no login
  Global           /etc/profile                      /etc/bashrc
                   o ficheros en /etc/profile.d      /etc/bash.bashhrc
                                                     /etc/skel
  
  Usuario         ~.bash_login                       .bashrc
  Usuario         ~.profile                          .inputrc
  Usuario         ~.bash_profile
                  ~.bash_logout 
el /etc/skel -> basicamente es cuando se crea un usuario las configuracion de pordefecto
Los ficheros de login se llaman bueno cuando se hacen loguin y se hacen loguin y los de no loguin tiene diferentes maneras de llamarse

# End gestion de de variables de entorno
# Inciando script sencillos
  #!/bin/sh -> esto indica el shell que se usaria
# End script sencillos
$0 el nombre del script
$1-9 corresponde a cada argumento que se pasa por la promt
# condicionales para cadenas
los que conocemos son lo mismo
-n cadena cadena no es nulo
-s cadena cadena es nulo
**si se cumplen son true**
# condicionales en la parte numerra
estos funcional con la nomenclatura inglesa
-lt -le -eq ...
# atributos de fichero (para evaluar si son verdadero)
EXPRESIONES CONDICIONALES (ATRIBUTOS DE FICHEROS)
f=fichero
-d f existe el fichero y es un directorio
-e f rxiste el fichero
-f f el fichero existe como fichero regular(texto file)
-r f el fichero tiene permiso lectura
-s f fichero existe y no esta vacio
-x fichero tiene permisos de ejecucion
EL COMANDO DE SALIDA DE exit es interante por que nos permite d
ponerle la salida dee exit STATUSCODE
#condicionales
if []
then
//code
fi
read num -> este read hace que se pare el script a la espera del numero
case $expresion in
    "1") code ;;
    "2") code ;;
    "*") code ;; //este es como el default
esac
# bucles
# seq[1-10]
for var in secuencia ; do
    //code
done

while [condicion]
do
    //code
done
until //lo mismo que while solo que esta continua ejecutando si se mantiene falsa su expresion

select OPCION in op1 op2 op3 
    //code
done
//nos reduce el trsbajo
$# contador de argumentos
$* refiere a todos los argumentos
Depurar con bash
-v ejecucion linea por linea
-x nos indica la ejecucion de un comando
    un + es la ejecucion 
    y si no tiene nada es el retorno del comando
las funciones son las mismas que utilizamos funcname(){} solo que se recomiendo poner comentarios arriba de ellas y los argumentos son resividos 
como lo hacemos desde el promt

somefunction argume argum2 argum3 ....
#end tema 105
