# que pasa si creamos particiones y no son ejecutadas 
podemos forzar al kernel que sicroniize la tabla de particiones
$:partprobe
# creando una copia de seguridad de la tabla de particiones o del MBR(512bytes) o GPT(1536bytes)
$:dd if=/diskdondeestaelbootloader of=/rutadelbackup bs=MBR|GPT count=1
o talves la gpt pofriaamos hacerlas mas seguras sin muchos errores con gdisk

# redimensionar una particion? Es mas facil y seguro de lo que creees
Eliminar la tabla de particiones no necesariamente significa que eliminaremos los datos
Sigue paso a paso 
iniciamos gdisk el el disco donde queremos trabajar
eliminamos la particion que nos interesa eliminar ,pero antes nos fijamo el numero de particion y el numero de inicio en los bloques del disco
creamos la nueva particion con el mismo numero donde estaba la anterior particion y el mismo numero de inicio del bloque y luego lo guardamos
si nos da un error es por que desmontamos donde estaba montada ,no pasa nada ejecutamos
$:partprobe
Luego tenemos un contenedor mas grande ahora falta redimensionar el sistema de archivo ,poedmos indeicarle el numero que va acrecer 
por defecto es todoel disco
$:resize2fs /particion ; # este comando es solo para sistema ext debemos buscar el comando correspodiente para cada sitema de archivo
 # lvm 
los discos o particiones que añdam,os deben estar vacios o de lo contrario de igual manera los elimira

pvcreate /diskopartition
pvs
asi creamos volumenes fisicos
creamos grupos logigos
vgcreate name /volumenesFisicos # podemos pasarle la cantidad de volumenew lo0guicosque queremoas
vgs
creamos volumenes logicos
lvcreate --name name --size eltamaño grupoVolume
lvs
estos volumenes logicos son reconocido en
/dev/Gruponame/logicalvolume

# extension
cuando hagamos unresize si vamos a aumentar no es nesesario desmontar la unidad din embargo si vamos a reducir entonces es desesarioreducir
extendemos los grupos siempre y cuando haiga mas volumenes fisicos
vgextend nameGroup /pathdelvolumenfisico
lvresize -S tamaño [nameLogicaVolume] /pathdelvolumenlogicio
e2fsck -ff /path del volumen logico
esto nos entregaria a sus captura de errores e el diskp
# la manera artesanal de lvresize
Example aumentado el volumen logigi
desmontamos o no la particion
verificamso el sitemas de archivo
e2fsck -ff /pahvolummenlogico
resize2fs /pathdelvoluen Ncuantoqueremsocambiar
lvresize -L NM|T|G /pathdondeestaelvolumenlogico
Hay un manera mas rapida de hacer esto pero esta soportado en todos los sistemas 
lvresize -r -L tamaño /pathdelvolumenelogico
esto se encarga de desmontar acutualiza montar es un poco mas inteligente

# simulando la extracion de un disco
queremos sacar un disco fisico de la mauina
seleccionamos los volumenes logicos donde esta nuestro disco que queremos cambiar y lo movemos al nuevo volumenfisico
pvmove /dondeseencuentraelorigenfisico /hastaElnuevodestino
esto movera los datos al nuevo destino
ahora quitamos el voluen fisico del grupo
vgreduce namedelgrupo /pathdelapartefisico
# snapshots
lvcreate --snapshot --size tamaño --name nombre /pathdelviolumenlogicoquequeremostomaslaintatatenea
la montamos donde deseamos montarla
para eliminarla la desmontamos donde esta y asegurarnos no esta donde se esta montando originalmente
lvremove /pathdelvoumenlogiopc

# creando rollback
creamos una instantanea

si queremos volver al estado anterior hacemoun un merge con su resopectiva instatanteo
pero antes de eso devemos desmontar y apagar el volumen logico
lvchange -an /pathdelvolumenlogicoaapagar
luego hacemos el merge
lvconvert --merge /pathdelainstataner
encendemos el volumen logico
lvchange -ay /pathdelvolumenlogicoaencender
y luego lso montamos donde deseamos
**SI QUEREMOS CREAR UNA ROLLBACK DEL SISTEMA RAIZ SOLO HACEMO EL MERGE Y ESTE RETROCEDERA UNA VEZ REINICIEMOS EL SISTEMA**

# convirtiendo ext2 a ext3 ; no es recomendable estos porque desapareceran en fururas versiones de linux
tune2fs -j /pathdelplaparticioquequeremosconvcertiaext3

# convertir cualquiert ext2 o 3 a ex4
tune2fs -0 extents,uninit_bg,dir_index,has_journal /pathdelaparticioaconvertir
esta no es la mejo0r manera ya que los archivos atiguos seguiran utilizando su sistema anterior y los nuevos recien comenzaran a utilizar ext4
la mejor forma es frmateando el disco as
mkfs -t ext4 /pathde la particioaconvertir

# reparar el sistema de archivo
check si un sistema de archivos esta dañado 
fsck -n /pathdeldiscoaconptrobar

# formateando un sistema de archivos xfs
mkfs -t xfs /paticionaconvertir
reparar
xfs_repair /partivione

# montando por uuid o label 
obtenemos el uuid de un disck con ; lbkid /pathdeldisco
o colocamo una etiqueta auna disco o particion con 
e2label /pathde la particion nombre de la etiqueta
# crenado memorias de inercambio
cremaos una particion swap
mkswap /pathdelaparticion
encendemos la memoria de intercambio
swappon -p prioridad /particiondswap
listar lso swap
swappn -s
n archivo de inrtercambio es mucho mas lento peo hay momentods} donde no hay de otra
dd if=/dev/zero of=/swapfiledestino bs=yamaño count=1 

# la prioridaddad de los archivos swapp debe ser por lo menos 10 par un bue rendimiento
echo 50 > /proc/sys/vm/swappines # de manera termporarl

o agragamos la configuracion en el archivo /etc/sysctl.conf
vm.swappines=value

# backups con el comando dump

dump -0rf /namedelbackup /discoquequeremoshacerbackup

ahora solo lo restauramos en la carpeta que necesitamos

restore -rf /rutadelacopiadeseguridad

