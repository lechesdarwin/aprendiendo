#atomicidad -> es la propiedad que asegura si una operacion se ha realizado o no

#consitencia -> asegura que los datos sean modificados a los indicados y no ocurran daños
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
>tabla   fila  columna  and NULL
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

## Instalcion

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

# tricks:genera datos aletorios

´´´sql
CREATE TABLE char_size_test (
 size CHAR(10)
);
CREATE TABLE varchar_size_test(
 size varchar(10)
);
WITH test_data AS (
 SELECT substring(md5(random()::text), 1, 5) FROM generate_series (1,
1000000)
),char_data_insert AS (
 INSERT INTO char_size_test SELECT *FROM test_data
)INSERT INTO varchar_size_test SELECT *FROM test_data;
´´´

-ver el tamaño de una tabla(\dt+ name_table)

# nota sobre los tipos de datos sobre texto de postgres

postgres sql recomienda usar el tipo de dato **text** por que no hay una diferencia clara de rendimiento sobre los otros tipos de datios
ademas ofrece una ventaja comercial

# emulando varchar

create table emulate_varchar(test varchar(4));
or
-- sematia equivalente
create table emulate varchar(
    test TEXT,
    contraint test_length check(length(test) <= 4)
);

# times

se puede esablecer en pg_conf la zona horaria por defecto de todas la coneecciones o se puede realizar a travez de comando

```sql
set timezone to "Asia/jesurasel"
-- show
select now()
```

la instruccion AT TIME ZONE 'ZONE'  conveirte una timestampos de acuerdo al parqam zone pasdo

'y'::timestamp without timezone at time zone 'x' -> conveirte y en la zona horaria de x sin zona horaria
'y'::timestamp with timezone at time zone 'x' -> convierte la zona y con zona horaria de x
Hay un tipo de dato INTERVAL que coge valores como '1 hour, 30 minutes'
se puden ralizar operaciones aritm,eticas de suma y resta

solo de operandos del mismo tiopo

```sql
#SELECT'2014-10-11'::date -'2014-10-10'::date = 1 AS "date
Subtraction",
'2014-09-01 23:30:00'::timestamptz -'2014-09-01 22:00:00'::timestamptz=
Interval '1 hour, 30 minutes' AS "Time stamp subtraction";
```
# el portal web del automovil
para crear un objeto en una base de datos postgressql  con una palabra clave se debe citar el nombre

```sql
\set verbosity  'verbose'
create table user as select 1;
-- error

create table "user" as select 1;
```
\set es un metacomando de psql para cambiar su comportamiento
set es un comando postgresqsql para cambiar su comportamiento en tiempo de ejecucion

```sql
CREATE TABLE account (
 account_id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
 first_name TEXT NOT NULL,
 last_name TEXT NOT NULL,
 email TEXT NOT NULL UNIQUE,
 password TEXT NOT NULL,
 CHECK(first_name !~ '\s' AND last_name !~ '\s'),
 CHECK (email ~* '^\w+@\w+[.]\w+$'),
 CHECK (char_length(password)>=8)
);
CREATE TABLE seller_account (
 seller_account_id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
 account_id INT NOT NULL REFERENCES account(account_id),
 total_rank FLOAT,
 number_of_advertisement INT,
 street_name TEXT NOT NULL,
 street_number TEXT NOT NULL,
 zip_code TEXT NOT NULL,
 city TEXT NOT NULL
);
CREATE TABLE advertisement(
 advertisement_id INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
 advertisement_date TIMESTAMP WITH TIME ZONE NOT NULL,
 car_id INT NOT NULL REFERENCES car(car_id),
 seller_account_id INT NOT NULL REFERENCES seller_account
(seller_account_id)
);
```
# views mira las views como metodos de objetos

Esta es su composicion:
```sql
CREATE [ OR REPLACE ] [ TEMP | TEMPORARY ] [ RECURSIVE ] VIEW name [ (
column_name [, ...] ) ]
 [ WITH ( view_option_name [= view_option_value] [, ... ] ) ]
 AS query
 [ WITH [ CASCADED | LOCAL ] CHECK OPTION ]
```
para crear columnas con nombres implicitos
CREATE OR REPLACE VIEW car_portal_app.account_information
(account_id,first_name,last_name,email) AS SELECT account_id, first_name,
last_name, email FROM car_portal_app.account;
cuando se crea con la declaracion OR REPLACE debe ser el mismo orden las mismas columnas tipos y nombres

## Tipos de categorias de views
temporary views: si se especifica las palabras claves TEMP or TEMPORARY el ciclo de vida es lo que dure la session del usuario, si no se

especifica bueno dura hasta que se diga que se ellimine
recursives: se usa para datos muy complejos , no le entendi muy bien
Updatables views: Esto es polimorfismo ,ya que, se permiten realizar operaccion insert update delete al usuario
y estas pueden afectar directamente a las tablas
Materializadas: estas de aqui se pueden aactualizar de acuerdo a un periodo de tiempo, o mas bien tambien podemos verlos como
unas tablas cache

## materialized views

Sintaxis o sinopsis
```sql
CREATE MATERIALIZED VIEW [ IF NOT EXISTS ] table_name
 [ (column_name [, ...] ) ]
 [ WITH ( storage_parameter [= value] [, ... ] ) ]
 [ TABLESPACE tablespace_name ]
 AS query
 [ WITH [ NO ] DATA ]
 ```
 No digas pero que carajos con el table espace , bueno esque estas son objetos fisicos

Si tu consultas una tabla materializada que no contiene datos(no estan poblados), te dara un error
Puedes mandar a actualizar sus datos con un

>REFRESH MATERIALIZED VIEW [ CONCURRENTLY ] name [ WITH [ NO ] DATA ]

Esta opracion es de bloqueo , pero hay algunos truquiillos como actualizar al mismo tiempo y solo debe tener un indice
Estas lista se usan principalmente como data warehousing, ya que casi no se leen , tambien para operaciones constosas , generar informes

## updatable views

Por lo general en postgres las vistas son self-updateble
```sql
CREATE TABLE check_option (val INT);
CREATE VIEW test_check_option AS SELECT * FROM check_option WHERE val > 0
WITH CHECK OPTION;
```
la opcion with check opction permite que solo se trabaje dentro de los datos que devuelve alias query, eso es unn punto extra de segurridad

# indixes

Son un objeto fisico en una base de datos estos pueden crearse en columnas , tiene direntes usos;

Un ejemplo es como para un sistema de reservas
CREATE TABLE no_date_overlap (
 date_range daterange,
 EXCLUDE USING GIST (date_range WITH &&)
);
INSERT INTO no_date_overlap values('[2010-01-01, 2020-01-01)');
INSERT 0 1
INSERT INTO no_date_overlap values('[2010-01-01, 2017-01-01)');
ERROR: conflicting key value violates exclusion constraint
"no_date_overlap_date_range_excl"
DETAIL: Key (date_range)=([2010-01-01,2017-01-01)) conflicts with existing
key (date_range)=([2010-01-01,2020-01-01)).

como los indices son objetos fisicos
```
CREATE [ UNIQUE ] INDEX [ CONCURRENTLY ] [ [ IF NOT EXISTS ] name ] ON [
ONLY ] table_name [ USING method ]
 ( { column_name | ( expression ) } [ COLLATE collation ] [ opclass ] [
ASC | DESC ] [ NULLS { FIRST | LAST } ] [, ...] )
 [ INCLUDE ( column_name [, ...] ) ]
 [ WITH ( storage_parameter = value [, ... ] ) ]
 [ TABLESPACE tablespace_name ]
 [ WHERE predicate ]
 ```
- indices de expresion
car_portal=> CREATE index on car_portal_app.account(lower(first_name));
CREATE INDEX
The preceding index will speed up the performance of searching an account by names in a
case-insensitive way, as follows:
SELECT * FROM car_portal_app.account WHERE lower(first_name) =
lower('foo');

>mirar la pagina  141 para uin detallazo sobre los indices de expresion

# nos sanltamos funciones

# user define data types
CREATE DOMAIN : son mas para tipos de checks , restrincciones
CRETE TYPE son como los lenguajes procedulaes, que retorna algo

Si recuerda los patrones de la tabla del portal web el prier nombre y el segundo tienen un check , podriamos mejorar
creando un dominio
```sql
CREATE DOMAIN text_without_space_and_null AS TEXT NOT NULL CHECK (value!~
'\s');
-- y remplazamos el tipo en la tabla con

In order to test text_without_space_and_null domain, let's use it in a table definition
and execute several INSERT statements, as follows:
CREATE TABLE test_domain (
test_att text_without_space_and_null
);
-- maravilloso no?
-- tambien podemos hacer los siguiente
CREATE SEQUENCE global_id_seq;
CREATE DOMAIN global_serial INT DEFAULT NEXTVAL('global_id_seq') NOT NULL;
-- podemos alterar el dominio
ALTER DOMAIN text_without_space_and_null ADD CONSTRAINT
text_without_space_and_null_length_chk check (length(value)<=15);
-- tenga en cuenta que esta nueva restriccion del dominio se vuelve validad para todas las tablas que la tienen a
-- menos que se les indique que no lo hagas para las viejas tablas
-- de la siguiente manera
ALTER DOMAIN text_without_space_and_null ADD CONSTRAINT text_without_
space_and_null_length_chk check (length(value)<=15) NOT VALID;
```
**create type no es mas para crear funciones , como nos saltamos esta parte , tambien lo haremos aqui**

# triggers

son acciones que se disparan al realizar acciones como inser,update delete pero no en la sentencia select

# Rule system

son el conjunto de reglas que se usan al al realizar acciones como insert , si recablea el un sistema de regla
determinado significa que agregara una nuevo funcionalidad, os si lo sobreescribe significa que le dara una nueva
funcionalidad, estas cosas se logran con los triggers 💕

```sql
CREATE TABLE car_portal_app.car_log (LIKE car_portal_app.car);
ALTER TABLE car_portal_app.car_log ADD COLUMN car_log_action varchar (1)
NOT NULL, ADD COLUMN car_log_time TIMESTAMP WITH TIME ZONE NOT NULL;
CREATE RULE car_log AS ON INSERT TO car_portal_app.car DO ALSO
 INSERT INTO car_portal_app.car_log (car_id, car_model_id,
number_of_owners, registration_number, number_of_doors,
manufacture_year,car_log_action, car_log_time)
 VALUES (new.car_id, new.car_model_id,new.number_of_owners,
new.registration_number, new.number_of_doors, new.manufacture_year,'I',
now());
```
# triggers ahora si

La definicion o sinopsis
```sql
CREATE [ CONSTRAINT ] TRIGGER name { BEFORE | AFTER | INSTEAD OF } { event
[ OR ... ] }
 ON table_name
 [ FROM referenced_table_name ]
 [ NOT DEFERRABLE | [ DEFERRABLE ] [ INITIALLY IMMEDIATE | INITIALLY
DEFERRED ] ]
 [ REFERENCING { { OLD | NEW } TABLE [ AS ] transition_relation_name } [
... ] ]
 [ FOR [ EACH ] { ROW | STATEMENT } ]
 [ WHEN ( condition ) ]
 EXECUTE PROCEDURE function_name ( arguments )
where event can be one of:
 INSERT
 UPDATE [ OF column_name [, ... ] ]
 DELETE
 TRUNCATE

 ```
 BEFORE: solo en las tablas antes de que se realizaer la opccion conrrespondiente
 AFTER: solo en tablas y se aplica de realizar la accion correspndiente
 INSTEAD OF: esta es paa las vistas

Los triggers se ejecutan para todas las filas afectadas a monos que se especifique WHEN

Finalmente los disipadores pueden declararse CONSTRAINT para especificar donde se ejecutaran, al final de la declaracion o al final de la transaccion , estos deben ser de tipo
BEFORE or FOR EACH, tienen la opcciones:

- DEFERRABLE: que se ejecuta al final de la transaccion
- INITIALLY DEFERRED:esto indica el momento en que se ejecuta el gatillo del triger
- NOT DEFERREABLE:Esto es el comportamiento predertimando del triger esto hace que se ejeute imdoantamente de
cada intruccion del trigger

Para crear un trigger debe ser una funcion , vemamos un ejemplo;
```sql
CREATE OR REPLACE FUNCTION car_portal_app.car_log_trg () RETURNS TRIGGER AS
$$
BEGIN
IF TG_OP = 'INSERT' THEN
 INSERT INTO car_portal_app.car_log SELECT NEW.*, 'I', NOW();
ELSIF TG_OP = 'UPDATE' THEN
 INSERT INTO car_portal_app.car_log SELECT NEW.*, 'U', NOW();
ELSIF TG_OP = 'DELETE' THEN
 INSERT INTO car_portal_app.car_log SELECT OLD.*, 'D', NOW();
END IF;
RETURN NULL; --ignored since this is after trigger
END;
$$
LANGUAGE plpgsql;
-- To create TRIGGER, we need to execute the following statement:
CREATE TRIGGER car_log AFTER INSERT OR UPDATE OR DELETE ON
car_portal_app.car FOR EACH ROW EXECUTE PROCEDURE
car_portal_app.car_log_trg ();
```
>En la pagina 160 hay una tabla de los valores de las variables que estan disponibles al momento de llamar a esa funcion
Ya que los triggers no deben tener argumentos

> Los nombres de los disipadores definen el orden de ejucion esos significa que se ordenan alfabeticamente

# Si no la cago

Un inner join es como la interseccion de dos conjuntos

Una union entre dos tablas independientes de la igualdas de las filas se llaman outer join

# left outer join

es como B-A todos los conjuntos de A menos los conjuntos comunes de B

# rigth outer join

Es como A-B

# full join

te trae todas las filas de las tablas

# join

es como la intercession

# el producto cartesiano

Que no es nada mas que todas las combinaciones posibles de la tablas se puede hacer de dos manera

```sql
SELECT * FROM a,b;
-- or
SELECT * FROM a CROSS JOIN b;
```

# las clausula where en la logica es lo mismo que inner join

entonces las siguientes consultas son lo mismos, pero no funciona paras clausulas de outer join

```sql
SELECT * FROM car_portal_app.a
 INNER JOIN car_portal_app.b ON a.a_int=b.b_int;

SELECT * FROM car_portal_app.a, car_portal_app.b
 WHERE a.a_int=b.b_int;
```

# self-joins

Son las auto uniones de la misma tabla, funcionas con todos los casos de join

```{.python .numberLines}
def a():
    print(2)
```

x BETWEEN a AND b
es equivalente
x>= a and x <= b

# las clausula insert

muy interante en la pagina 214

# recursive

~~~sql
WITH RECURSIVE genealogy (bloodline, person, level) AS
(
 SELECT person, person, 0 FROM family WHERE person = 'Alan'
 UNION ALL
 SELECT g.bloodline || ' -> ' || f.person, f.person, g.level + 1
 FROM family f, genealogy g WHERE f.parent = g.person
)
SELECT bloodline, level FROM genealogy;
~~~

# distint on

Esta clausula se utiliza para obtener el primer registro de un grupo, ojo que __some__ debe ir en la lista de SELECT-list

```sql
-- SELECT DISTINCT ON (<expression_list>) <Select-List>
...
-- ORDER BY <order_by_list>
SELECT DISTINCT ON (car_id)
 advertisement_id, advertisement_date, car_id, seller_account_id
 FROM car_portal_app.advertisement
 ORDER BY car_id, advertisement_date;
```
# table sample
Al veces necesitamos obtener una muestra de una tabla enorme

~~~sql
-- TABLESAMPLE <sampling_method> ( <argument> [, ...] )
-- [ REPEATABLE ( <seed> ) ]
~~~

