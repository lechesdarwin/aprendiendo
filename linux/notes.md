# UNA ARTICION ES UN TIPO DE LOGICA O MAS FACIL PARTE UN DISCO EN
VARIOS DISCOS O DISCOS LOGICOS
# EL SISTEMA DE FICHERO SE ENCARGAN DE ORGANIZAR LOS ARCHIVS Y DARLLE UN ESPACIO EN EL DISCO 
#comomo hacemos busqueda dentro de la terminal ctrl-r
# para ver los permisos es stat -e "%a"

#pushd popd funciona son una pila de directorio envez de hacer cd ../..
funciono mi alias!
que pasa si queremos estar mirando todo el tiempo los cambios de un archiv
esta el comando tail -f<f es de forever>
hay variables de stdout(1) y stderr(2)
entonces la cosa seria 1> para el stdout y el 2> por el stderror
si queremos que se el stderr se mande al stout
2>&1 -> todo el stderr mandamenlo donde esta que stdout
listar procesos ps -wA
grep -r . es analiza todos los directorios que estan debajo -e busca-esta_expresion
grep -r . este busca recursivamene hasta por dentro de los archivos
grep -n nos mostrara el numero de linea donde encontro la expresion
zip namezipreturn listOregexfiles
inf de zip zip -vl zipfile -> return  los archivos de csv
tar es una manera de hacer un solo archivo de varios
tar cfz name out create file z 
tar xfz extraxt from file zip name tar
awk -F"replace" file '{printf("%s",)}' los pesos son las columnas donde encontro
pipe | manda el estandar out a el stdin de este comando cat file| grep algp
dmesg muestra todos los log al comienzo del sitema
/var/log/kernel.log === dmesg
/var/log/boot.log -> todos los logs que interactuan con el fierra de la pc
/var/log/bostrap.log los relacionados con ficheros
niveles de ejecucion::
0 apagado 6 reinicio
> 1 monousuario -> root
> 2,3,5,6 multiusuario con sin red o grafico 
> no hay un estadar de estados del 2-6
cambiar nivel de ejecucion runlevel Nlevel
ver en que nivel estamos
runlevel
los scripst de ejcucion se encuentran en 
/etc/rcNrunlevel.d/scripts execute
si comienza con S se ejeutan al inicio y K al apapagar y los numeros establecen el orden de ejecucion
Systemd :
su directorio de trabajo es /etc/systemd/
el mas intererante es system alli se inicia scrips que queremos hacer al inicio del pc
systemctl el encargado de gestionar los demonios los ususrios
Systemd :
su directorio de trabajo es /etc/systemd/
el mas int
system-reload para poder lograr que sistemd reconosca nuestro nueovo servicion en /etc/systemd/

Las variable de entorno 
bueno unas variables locales son MIVAR=value 
ahora si la queremos hacer globales export MIVAR=value
las varibles de entorno predifinidas son el
$! muestra el PID del ultimo scrip lanzado en backgroud 
$$muestra el ultimo prceso

$\_ muestra los ultimos argumento s utlizados en el sisema
$? muestra el codigo de salida del  ultimo cmonandoo
si es 0 no hay error si es 1 hay error


apros es para buscar info de comando escencial
whatis este nos muestra las secciones de un comando

como saber info del sistema 
uname es qel que no da indormacion del sistema el sistema operatico el kernel

# procesos
el nodo principal es el comando y los hijos son flags
+ comando ps nos ayuda a ver los procesos
	+ fax nos mustra los procesos en modo de arbol
	+ aux nos muestra el proceso en modo de tabla
+ pgrep es como un ps aux | grep (pgrep nombrederocesos)-> devuelve los procesos que esta ejecutando ese servicio
	+ pgrep -n -> muestra todos los ulitimos procesos
	+ pgrep -c nombredeservicio -> muestra los numeros de procesos que corre un procesos
# señales
señal  numero significado
SIGHUP 1 para y reinicia.Utilizado (no pierde el PID)solo se reinicia
SIGINT 2 terminacion inmediata de un proceso == ctrl+c
SIGKILL 9 finaliza inmediatamente sin esperar su finalizacion natural(ejemlpo lo que hace un base de datos antes de finilacizarse)
SIGTERM 15 solicita un finalizacion natural
SIGCONT 18 reactiva un proceso de suspecion con SIGSTOP
SIGSTOP 19 pausa un proceso
**comando kill envia señales a los procesos**
LA seña por defeco es SIGTERM
kill -l mustra todas las señales en un sistema linux
-NUMERO el numero de la señal que queremos enviarle
+ pkill -> este es similar a grep solo que este recibe el numero de la señar(kill -9 algunnombre)
+ killal es como pkill solo que hace busqueda con expresiones regulares
	+ -i permite el envio de forma interactiva
	-NUMERO
	+ -w mata os prcesos de una manera inteligente hijos primero despues el padre
# primer y segundo plano
ctrl+z esta combinacion de teclas pausa un proceso
fg %numerodeljob recurpera un prceso a primer plano
bg %numerodeljob recuperra un procesos a segundo plano
jobs visual de todos los procesos que estan pendientes retorna los jobs con un - son bg y + detenidos
programa & lanzar directamente en segundo plano
# tareas desatendidas
nohup es comando ignora la señal SIGTERM que se ejecuta al cerrar la terminal y manda al stdout y stderror al fichero nohip.out
<esto lo manda al como un proceso diferente al padre donde se ejecuto>
el comando SCREEN GENERA TERMINALES VIRTUALES
 + la creamos con un screen -> esto crea la terminal virtual
 + la recuperamos con screen -r -> hace un detach y si tenemos varios screen solo le pasamos el "pip" del screen
# los procesos de prioridad en linux (la prioridad ue tendra un proceso en una cpu) entre mas cerca de -20 mas prioridad
la menor prioridad es 19
-20 la menor prioridad
la prioridad por defecto de nice es 10
los numeros de prioridad son de numero -20 20 
los usurios comunes pueden desde 0 20
nice -> establece una prioridad al incio de un programa
	+ nice number programa
renice -> reestaqbleze la prioridad a un proceso ya corriendo
	+ renice number PID
top(NI)
htop(NI)
# expresiones regulares en grep
comando
egrep -> espresion regular extendida
 + pero esto se logra con grep -E regexExtended
-v invierte el  significado de la regex
fgrep ->ignora cualquier expresion regular y lo toma como un literal
# sed
busca por eliminar sustituir cadenas de texto eliminar filas de un fichero por defecto muestra los cambio
	+ -e permite ejecutar scripts en los comandos
	+ -i escribe directamente los cambio en los ficheros
	+ -r Permite usar las espresiones regulares extendidas
# UN TRUCAZO LOS COMANDOS QUE SE USAN EN SED SON COMO LOS DE VIM ASI QUE YA SABES !!!!!!!!!!!
# PARTICIONES
la principal o msa comu la MBR
solo tiene 4 particiones primarias pero recienteente se agragron las llamadaas particiones extendidas
	+ llamado
	 	+ las particiones primarias se nombran desde el 1 al 4
		+ las extendias sen empiezan a nombrar desde el num 5 hasta dnde pues
# gpt para soportar la especificacion uefi
estas particiones tienen un GUI global unique identificator algo por ahi
ya no existen particiones primarias y extendidas ahora solamente existe particiones 
max 128
particiones desde 2 zezabite !!!!!!!!!!!!
tiene un sitemas de recuperacion integrado y un algo como un recuperador de daños
# gestion
	fdisk -> para gestionar articiones tipo mbr
		+ -l permite el estado de las particiones de un disco
fdisk in action
fdisk routedisk
DOS(MBR) para las etiquetasa o algo asi
p la tabla de particiones
n nueva particion
primer sector y el ultimo sector no es mas que el tamaño de la particion
cambiar el tipo de particion
t @@@@@@@@@listar los tipos L
v -> verifivar la tabla de particiones 
w guardar la tabla del disco
AHORA PARA LAS EL SISTEMA GPT ES gdisk es lo mismo o analogo a fdisk
# parted sirve para gestionar mbr y gpt 
# mkfs se encarga de generar el sistema de fichero 
nkfs.+TAB lista el sitema de fichero disponible == mkfs -t tipo
comandomkfs particion el comando -c
mkswap para dar un sistema de swap linux
#Sistema RM swap en la ram???????!!!!!!!!INVESTIGAR
mkswap partiticion
swapon articion -------activa una swap
swapoff particion --------desactiva la ssswap
# sistema xfs es viejisimo pero fue evolucionando
# tiene un sistema journaling<recuperacion a fallos> de 64 bits
permite particiones de hasta 500 terabytes
IMPRESIONANTE PARA SITEMA DE BASES DE DATOS VIRTUALIZACION CLUD MULTIMEDIA
# ReiserFS
ideal para disco cache HTTP agentes de correo y otros aplicaciones que requiere qu el acceso sea rapido
soporta jourdanil Redimension en caliente (solo aumentar) y reduce la fragmentacion interna 
**no viene de forma nativa (requiere instalacion)**
# Btrfs es como una mezcla de LVM y RAID
sistema de ficheros seguro y escalable
soporta copy on write ,permite hacer snapshots de sola lectura o modificables 
	es decir algo como el sitema de git pero mas cool
soprta ssd optimizacion
RAID 0,1,10 y single 
requiere instalacion no viene te forma nativa
# COMO SE INSTALAN ESTAS MARAVILLAS
xfsprogs ----> para system xfs
btrfs-progs ----> para el system xfs
raiserfsprogs -----> para Raisers
# MANTENER LA INTEGRIDAD DEL SISTEMA DE FICHERO
TOOLS
df permite ver el espacion usado y libre de un disco o particin
    + -h ver el formato en modo humano
    + -T ver el tipo de sistema usado el el disco
    + df -hT
du comando para el tamaño ocupado de un directorio en concreto en el sistema
    + -h muestra en salida humano
    + -s  un resumen en vez de desglosar todos los directorio interiosres
        + -c indica el tamaño ocupado
    + du -hs path
fsck analiza y corrige el sistema de dichero similar de como trabaja mkfs
    + se debe especificar el tipo de fichero
    + no se puede operar sobre un sistema de fichero montado como escritura/lectura o es lectura o nada
    + -A analiza los puntos de montaje en /etc/fstab
    + -R analiza todo menos el sistema raiz normalmente -AR
    + -a/-p repara sin realizar preguntas
    + no tiene que estar montado el disco
    + -f forza el escaneo
    + fsck.type -f /particion
debugfs realiza mantenimiento de tipo de ext
    + -w abre un sistema de ficheros en modo lectura/scritura
    + -c abre el sistema en modo castatofrico en modo castatrofico en sistemas con alto sistema de corrrupcion
tune2fs ajusta parametros del sitema de ficheros (analisis traas un numer determinado de montajes,bloques reservados)
    + -j convierte un sistema ext2 a ext3 add journaling
    + -c num establece un numero de montajes para relizar chequeo fsck es decir que cada vez que que se monta se va realizar una comprobacion en el montaje num
    + -C num establece el numero que lleva el sistema de ficheros mintado supangamos que se hace una comprobacion en num y ya estamos en 5 con este parametr lo establesco o num
    + -L estiqueta establece la etiqueta al sistema de fichero
    + -m porcetaje establece el porcentaje de bloues reservados en el sistema de ficheros
    este es un porcentaje que se reserva para evitar que se utilize el 100% del disco por defecto a la creacion es el 5%
        + no tienen que estar montados

 dumpe2fs se utiliza para mostrar informacion de los super bloques y los grupos
    + -b  Muestra los bloues reservados que estan malos
    + -h solo muestra los bloques reservados
# controlar el montaje desmontaje
en el apartafo de opciones que pasa si te si faltan mas opciones para el montaje bueno solo colocas una una ,
todas estas configuraciones se pueden realizar en el fichero /etc/fstab que estan en forma de loumna y filas
None(swap)
blkid command nos devuelve los los UUID de todos nuestro equipo
# mtab contiene los puntos de montaje actuales que se encuentra actualmente 
# command mount 
    + -a monta todos los dispositivos inidcados en fstab
    + -r monta de forma de solo lectura
    + -t tipo puedes indicar el tipo que vas a montar 
    + -o options | permite establece opcciones que ocurren en el momento de montaje
    + mount dispositivo pathdirection
# command umoun 
    + -a desmonta todos los dispositivos indicados en fstab
    + -f forza el desmontado
    + -r desmonta todos los dispositvos de solo lectura
# sistema de cuotas es nada mas y menos que que establecer un limite de espacion para algo o alguien normalmente se usa en la catpeta home
No lo soporta todos los sitemas de ficheros pero linux siiiiiiii
***primero activas quotas es decir lo habititas,segundo administrados***
#modos
SOFT LIMIT este es  un poco flexible permite que te pases de tu quota ahi te da un tiempo de gracia lo que hace es que te envia mensajes recrdandotelo y se pasa luego se ponde en modod hard
HARD LIMIT este es mas escrtip
usrquota activa los quota de user
grpquota active quota de grupos
-o remount 
quotacheck para verifcar si se encuentra disponibles el sistema de quotas 
    + -a analiza todos los sistemas de archivos que estan mtab
    + -u verifi support users quota
    + -g lo mismo que arriba
    + -m no intenta remontar el sistemas de quotas en modo lectura
    + quotacheck -gmuv /home
quotaon/quotaoff
    + -a active all configurations in file mtab
    + -u active support of users
    + -g top show
    + -v verbose
edquota permite modifica los valores de de soft y hasrd limit
    + -u user add support at user
    + -g grupo
    + -f filesystemesi<es decir /home/user>
    + -t edit time of tiempo de grcia
los limtes de hard and sof vbienene como añadi en Mb Gb
quota
    + -a
    + -u
    + -s format human
    + -p time of gracia
requota generamos un reporte de quotas
