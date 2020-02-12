@atomicidad -> es la propiedad que asegura si una operacion se ha realizado o no
@consitencia -> asegura que los datos sean modificados a los indicados y no ocurran daños 
parall

# u sistemas NoSql no puede puede cumplir el teorema Cap

consistencia todos lo clientes accden a los mismo datos actualizados de la base de datos
availible es disponible auque ocurran fallos de para esos estan las replidcas
partition tolerance

# Acid
 Un opercion simple logica en una base de datos se llama transaccion veose la transaccion como un conjunto
 de pasos logicos (CRUD)

 + Atomicidad significa todo o nada es decir si una parte de la transsaccion falla todo falla

 + Consitencia es pasr de un estado otro estado nuevo afectando solamente al elemento elegido o no repercutiendo en otras filas o datos

 + Isolation(islameiento) es to garantiza que ocurrar u  race condition en los datos

 + Durabilidad esto garantizaq ue una vez se realize una transsaccion garantizar que el dato este aho aunque ourra un corte de energia potgre tien un sistema llamado WAL

 # Sql
 consta de varias partes

 DDL define y modifica la strucutur relacional de la base de datos
 DML recupera y extre los datos
 DCl controla los derechos de accesos de las relaciones

>los terminos relacion,tuple,atributo and unknown es un lenguaje de humano
>               tabla   fila  columna  and NULL
>Los dominios no son nada mas y nada menos que el nombre y tipo de atributo(columna)

## Normalizacion

la normalizacion es el modelado de bases de datos relacionales ,es decir, el procesos de organziacion de columnas y 
relaciones evitando la redundacia de datos,la regla formal es aplicar la normalizacion a menos que haiga una buena razon
para no hacerlo

# Tupla

Es cun conjunto de datos ordenados que se escriben entre() y estan separados por coma ejemplo (Jhon,Hail,1970)
    (a1,a2,a3,a4)=(b1,b2,b3,b4) si y solo si (a1=b1)(a2=b2)...
En una tupla el orden importa tambien que los elementos no esten repetidos y son datos finitos , tambien una tupla no es un
conjunto

# El valor null

Las base de datos relaacionales utilizan 3 valores logico __tree-value logic 3VL__ verdadero , falso y NULL
el terce valor puede ser conocido como iinexistente , vacia , desconocido o que llenara despues, es por eso que no puede 
haber dos valores nulos

# constraint (restrinciones)

Permie el contrl de la data, la redudancia la integridad

# domain integretid constraint

La integridad del dominio se asegura que los datos de entrada son y solo son del tipo especificado(int,real,text,inet)

# Identity integridad constraint

esto se refiere que un atributo debe tener un clave primaria que no se repitaa y sea nulo

# Las claves foraneas KF
Una FK es un atributo o conjunto de atrinutos que que pueden indentifar unas tuplas en relacion refernciada
Son como tuplas de referencia a otras tuplas estas claves foraneas pueden ser a difrencias de las claves primarias , pueden
terner el valor nulo y pueden refernciar 1 sola tupla
Por ejemplo un padre que puede tener muchos hijos esto es una relacion 1 a muchos
Cuando ocurre un actualizaion o eliminacion en un FK pueden suceder cosas como:

Cascade: cuando se actualiza o elimina una tupla en la relacion referenciada las tuplas en relacion de referencia tambien se eliminan o actualizan
Restrict : la tupla no se puede eliminar o actualizar si esta referenciada por otra relacion
Set default : cuando se elimina o cambia un atributo referenciado la clave externa se le pasa el valor po defecto
Set null : la clave externa se coloca en null si se elimina un atributo referenciado

# algebra relacional

# Instalcion

postgresql  soporta variaas plataformas cada plataoforma o OS tiene un binario listo para la 
instalacion , la desventaja de esto es que no estan actualizados pero si vamos a la pagina de 
postgresql podemos encontrar la manera de encontra un binario actualizado
https://www.postgresql.org/download/linux/

Create the file /etc/apt/sources.list.d/pgdg.list and add a line for the repository
    deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

or si el sistema como es ununtu simplemente has 
sudo apt-get install postgresql-server-11
## por codigo fuente
sudo apt-get install build-essential
sudo apt-get install zlib1g-dev libreadline6-dev
en centos sudo yum groupinstall 'Development Tools'
You can get the source code of PostgreSQL from the PostgreSQL server FTP site and extract
it as follows:
wget https://ftp.postgresql.org/pub/source/v11.1/postgresql-11.1.tar.bz2
tar -xvf postgresql-11.1.tar.bz2

luego de hacer el 
./configure
make
sudo make install
El binaria se encuentra en /usr/local/pgsql

El servidor posgre no se ejecuta si no tiene el usuario postgres
adduser postgres

Ahora necesita crear una carpeta donde alamacenara los datos del cluster de base de datos
y cambiar el propietario a postgres
inicializar el comando initdb -D elpathdelacarpetadealmacenamiento
No olvidar que lo debe ejecutar siendo usuario postgres

El cliente de terminal es pqsql 

## si instala desde la paqueteria oficial de tu sistema (recomendado)
Instalndo el cliente
sudo apt-get install postgresql-client-11
esto termina en /usr/lib/postgresql

Instalacion del serividor
sudo apt-get install postgresql-11
Un cluster de base de datos es una colecciones de bases de datos administrado por una sola instacia
Este cluster se puede crear en difrentes carpetas
es decir que podemos tener muchos cluster en una sola maquina
para inicializar un cluster es con initdb
Esto inicia el server de postgress
/usr/lib/postgresql/11/bin/pg_ctl -D /var/lib/postgresql/11/main -l logfile start
Y es asi como se inicializa un cluster el argi puede carbiar la ruta pero el propietaria debe
ser postgress

pgrep -a postgress -> para listar los procesos que ha creado

# postgres clients

\set  ya tu sabes 
podemos indicar un archivo externo desde el cli con -f o desde el client \i path
las variables 
ON_ERROR_STOP este es false por defecto pero es recomendamble ponerlo en true ya tu sabes
ON_ERROR_ROLLBACK este es true por defecto y revierte las operaciones transaccionales
AUTO_COMMIT esto es false y es mejor tenerlo desactivado para evitar errores humano

## atajos
postgres=# \set activity 'SELECT pid, query, backend_type, state FROM
pg_stat_activity';
postgres=# :activity;

reindexdb este es bueno para reindexar indecis dañados por diferentes motivos, raramente se usa
clusterdb este se usa para agrupar relaciones(tablas,vistas,etc) en una sola para aumentar el rendimiento cuidado que este 
    es una  operacion de bloqueo 
backup fisica este se encarga de agrupar todas las bases de datos en uno solo ,esta copia solo sera compatible con otra 
    pg_basebackup es una herramienta para lograr esto
    base instancia de la misma version que la genero
backup logic este hace un volcado de los datos a sentencias SQL(menos la de create database)
pg_dump este comando ayuda a hacer un volcado logico a un determinado db
pg_dumpall este hace un volcado a todas las bases de datos
    el volcado logico es jodidamente lento
# Database naming conventios

para las bases de datos ,tablas usamos nombre singulares ya que estos representan un entidad en el mundo real(objeto,
persona) para los nombre compuestos usamos guion bajo para las columnas tambien nombres singulares 
las claves primarias nametable_identificado las claves foraneas debe tener el mismo nombre de la clave primaria 
referenciada
Postgresql no tiene o el mala paractica usar camelcase
La logitud de los nombres de objetos tiene un maximo de 63 caracteres
## comentarios
de una sola linea -
multilinea /**/

postgre permite guardar la documentacion de un objeto en COMMENT ON

# jerarquia de PostgreSQL

template database
databases
Roles
TableSpace
Settings 
Templete procedural languajes

## template database

Vea las plantillas como el esqueleto de una base de datos o el namespace en los lenguajes de programacion
Por defecto al crear una base de datos(si no se especifica una plantilla) postgre utiliza la plantilla template1,
por ejemplo si desea que las proximas bases de datos tengan la misma extencion podria modificar template1 para lograr eso
si embargo esto ya no aplicara para las otras bases de datos ya creadas el template0 es como una copia de seguridad porsi 
todo flla si no encuentra el templete1

## database user
En postgresql puedes accder a otras base de datos atrvez de la base de datos o es5o se llama conexion de bases de datos 
cruzado se remienda usar foreign data wrapper
nostros podemos visualiar los permisos de un usurio sus previligios ccomo la siguiente sintaxis
<user>=<privileges>/concedido por

con el eetacomando \l podemos listar las bases de datos en el cluster

Privilegios
CREATE(-C) PERMITE A USSUARIO CREAR ESQUEMAS DENTRO DE la base dea datos
CONNECT(-C) conect les da acceso a labase de datos
TEMPORARY(-T) permite al usuario crear tablas temporales estas tablas se destryen al finalizar la sesin de usuario

datafrozenxind utilizada para autovacum oerations
datatablespace para especifiar el espaciodetabla
datconnlimit para especificar el numero de conxiones concurretes si esta en -1 sifnifica que no hay limites
datallowconn desactivar la conexiones a la db principalmente para proteger templete0

El metacaracter \c se tiliza para concentar o desconectar una base de datos

__la tabla pg_catalog es como un simple tabla regular, perio esta se puede usar para autom,atizar tareas

### cambiando el nuemero de conecciones maximas a una base de ddatos
```sql
ALTER DATABASE postgres CONNECTION LIMIT N - donde n es el numero de conexiones maxiams
```

# Roles
Mira los roles como los permisos, pero estos "permisos" se aplican para tod el cluster donde fue asignado
Atributos de los roles
SUPERUSER: omite todas las verificaciones de permisos(es el todo  poderoso), eepto el atributo LOGIN
LOGIN:este autoriza que un cliente peda conectarse a una base de datos
CREATEDB: le permite crear bases de datos
CREATEROLE:podriamos decir que tiene el poder de hacer ubn crud sobre otros roles
REPLICATION permite crear conecciones
PASSWORD sse puede usar con el mtodo md5 o sha256 pero se recomienda el sha256
CONNECTION LIMIT especifica el numero de conexiones concurrentes que puede generar el usuario , las conecciones 
    concurrentes causan consumo de recursios de hardware , recomienda usar herramintas como PGPOLL-2,YANDEX ODYSSEY
INHERIT sis e especifica el rool heredara los privilegios assignadosde los que es miembro ¿si no lo especifica inherit es defautl?
BYPASSRSL si se especifia este rol puede ommitir la seguridad a nivel de fila RLS
__los roles no necesariamente tiene access a todas las bases de datos
CREATE USER es equivalente a CREATE ROLE
LOGIN CREATE GOUP es equivalente a CREATE ROLE con la opcion NOLOGIN

# tablespace
una espacio de tabla no es ma que una ubicacion el el ddisco duro (un path) pra el almacenamiento de bases de datos u 
objetos

# template procedural languaje

Este se usa para registrar nuevos lenguajes añadiendo asi mas funcionalidades a postgresql se puede registrar un 
nuevo lenguaje con CREATE LANGUAJE

# SETTIGS

Aqui es donde se manejan las configuraciones de las db las conexiones concurrentes,las direcciones permitidas etc

las configuraciones tienen diferentes contextos, esto significa que los ajustes que reliza puede tener apliacion de
inmediato o puede tardar
internnal:estos cambios son tan profundos que necesita reinstalar o compilar postgresql, hacr cambios como el max de
caracteres por atributos(63)
postmaster:Reinicia el servidor al cambiar los valore de postgresql.conf
sighub:No es necesario reiniciar el servidor ya que este le manda la señal SIGHUB al proceso de postresql
backend:No requiere reiniciar el servidor
superuser:El todo poderoso que lo puede este actua directamente sobre la tabla
user:similar al super user

Esto se puedo lograr con ALTER SYSTEM , pero es mas recomedable sobre escribir los valores de postgresql.conf atravez
del su primo postgresql.conf.auto ya que este tiene mas prioridad que el anterior
En oncaciones queremso restringir al cliente para que solo realice lectura en la base de datos 
SET default_transaction_read_only to true;
Es reconmendable usar pg_reload_conf() para evitar errores humanos

Para lograr que todos los clientes entren en modo de solo lectura 

$sudo su postgress
$CONF=path del archivo de conf de tu cluster
$sed -i "s/#default_transaction_read_only = off/default_transaction_read_only = on/" $CONF
$psql -U postgres -c "SELECT pg_reload_conf()"

tenga en cuenta que esto creara un tiempo de inactividad en el servidor, puedo usar esta tecnica para cambios urgentes
o si simplemete desea realizar una futura configuracion al momento de reload the server is auto call

#  Postgresql higth-level object iteraction

## creando una base de datos
Nos basaremos en el contexto de la tienda de auto
CREATE ROLE car_portal_app;
CREATE DATABASE car_portal ENCODING 'UTF-8' LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8' TEMPLATE template0 OWNER car_portal_app;

Si las configuraciones de encoding no hacen mth entoncen se utilizara template0
# componentes de bases de datos en POstgre
## Schema
Un schema es como una clase en lenguaje de programcion ,utilzada para definir sb lo mas parecidas ,e stas contieen las tabl
s,vistas , indixes ,trriger,funciones , dominios etc
CREATE SCHEMA AUTORIZATION nameshema
111



