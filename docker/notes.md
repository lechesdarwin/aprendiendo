El contexto de build -> es un path donde se ejecuta el command build el deamon de docker toma todo lo que esta en esa carpeta y no puede hacer mas en otra es una forma de seguridad
Docker aplicaiones de bolsillo
En una imagen creas toda la configuracion de software libreirias ,etc
En un contenedor -> lo vuelves realidad

# Arquitectura de Docker
Toda base es un docker Host osea es la casa donde vive docker alli viven:
    3. docker daemon - server -> manejamos contenedor imagenes Volumenes redes
    2. Rest Api -> el canal de comunicacion entre el docker cli y docker server
    1. docker cli-client
¿Qué es una imagen?
>Estan viven dentro del docker host , es un paquete que aloja toda la configuracion o todo lo necesario para que se pueda ejecutar una aplicacion
>Una imagen se componen por n capas
>Una imagen tiene lo minimo para que funciones algo ,como un OS,sample
>Capas
>FROM -> desde donde voy a tomar
>RUN -> que va haber luego de la base
>CMD -> la linea que se ejecutara al levantar el servicio
>las capas anteriores son de solo lectura
>Esto se puede crear en un Dockerfile(Puede llamarse diferente pero es el que por defcto pusca)
>es importante que un contenedor se quede pegado con un proceso si no morira
CMD,RUN,FROM -> de solo lectura
¿Qué son los contenedores?
Digamos que es una capa adicional de ejecucion en tiempo real de las capas anteriores
Esta capa es lectura y escritura
Un contenedor es de es temporal ,osea la capa del contenedor es temporal ,si queremos una modificacion persistente eso se hace en las imagenes
Un contenedor una instancia de una imagen 
Un contenedor es un proceso aislado mas de del OS
# Imagenes oficiales 
Un tag sirve para indicar la version o versiona la aplicacion ppor default is **latest**
Descargar imagen
>docker pull imagename:tag

Imagenes colgadas lo que pasa cuando descargas una imagen o creas del misma imagen se crea una nueva imagen y la antigua queda como imagen huerfana con un tag de <none>

# Imagenes propias
**cuaquier codigo que tenga <some some> sera un explicaion previa**
Se debe tratar que los comandos sean los menos interactivos posibles por que si no dara un error
una vez tenemos nuestro dockerfile creamos una imagenc on
>docker build --tag<el nimbre de nuestra imagen tambien podemos pponerle junto un tag de version> name:tag Dockerfilename
¿Como podemos ver el historial de capas?
docker history -H<para que sea humano> imagenname
El CMD del dockerfile asi en bruto indiaca el comando inicial que se ejecutara al iniciar el contenedor
## delete imagenes -> docker rmi nameimage
Construccion de imagenes con direfente nombre a dockerfile
docker build-f filedockerdistintname .

## Dangling images -> imagen huerfana
Esto sucede cuando se crean imagenes con el mismo nombreh
docker images -f dangling=true -> retorna todas las imagenes huerfanas(-q solo retorna los id)
Multi-stage-build -> construir una imagen desde otra en una interna dockerfile
from image as img
run algo
from algo
copy --from=img /pathimg pathalgo
>En este ejemplo toma todo lo necesario de img y la imagen queda en base a algo es decir se ignora todo lo de img una vez tome lo que necesita:

# End Imagenes propias
---
# Contenedores
En el contexto de focker run
    + -p <miPuertoNdeMiMaquinaMapealoJHacia>:<EstePuertoDelContenedor>
    + --name namedelcontenedor
    + -d detach es para mondarlo al background y retorna el idHAsh
docker ps -> list todos los contenedores corriendo
docker ps -a -> list todos los contenedores
---
# Mapeo de puertos
>run-p X:Y
>yo quiero que mi puerto X se mapee a Y del contenedor
---
# Iniciar reiniciar detener
## detener
>docker stop nameOrIdHash
## iniciar
>docker start nameOrIdHash
##reiniciar
>docker restart nameOrIdHash
## Docker interactive
docker exec -t<terminal>i<interactive> [-u usuriopersonalizado] conatinernameOrIdHash<tiene que estar corriendo> bash<command a ejecutar>
## crear variables de entorno al mone¿¿mento de correr el contenedor -e "name=value"
Crear ver los logs de un contenedor -> docker logs -f nameContenedorOrIDHash
Inspeccionar los datos de un contenedor -> docker inspect nameOrIdHash
# Uso de recursos de contendor
docker stats nameOrdIdHash
---
# Administras recursos en un contenedor
docker run -m<meoria ram> "N{mb,gb}" --cpu-set-cpus rangeodCPUS
***los cpus se cuentan como un arrary desde el cero es decir si le ponemos 0-2 le estamos habilitando 3 cpus***
# en caliente
docker container update IdHashOrName --memory ....
Copiar archivos de mi maquina al contenedor y viceversa en un contenedor corriendo ¿o parado?
docker cp miRutaDeMiEquipo containerNameOrID:rutaDelcontendedor
Para hacer lo contrario es invertir las cosas
# Convertir un contenedor en imagen
docker commit [OPTIONS] container [OUPUT[:TAG]]
**todo lo que esta en un volumen como vimos anteriormentecuando se hace en un commit no se añade a la imagen ya que en la imagen no va informacion delicada**
# sobre escribir el cmd de un container
docker run [OPTIONS] image **este ultimo argumento seria el nuevo cmd**
# Crear contenedores auto destructible
docker run --rm -> este comando hace que el contenedor se destruya una vez terminada la session en el contenedor
# El document root es el directorio donde estas las confi de docker donde maneja las imagenes y todas esas ñañacas
editamos el archivo /etc/systemd/system/docker.service
    el comando Execblala le cambiamos el artibuto --data.root NewPAthRoot
luego
systemctl daemon-reload -> oye revisa los cambios porfi
___
# End Contenedores
--- 
# Apuntes 
## Renombrar 
docker rename nameAutomaticSetForDockerOrHashId newName
# End Apuntes
---
# Dockerfile
FROM laimagenbase
RUN corre comandos
CMD el comando por default del contenedor ,todo lo que este dentro del cmds seran ejeutados mientra en contendor siga vivo
COPY para copiar achivos capetas en el contendor
    COPY pathDeMiMaquina pathDelContendor
ADD (la gente de docker recomienda utilizar COPY)add sirve como copy y tambien baja archivos de internet
ENV nombre valor
WORKDIR path -> es una ruta de trabajo dentro del contenedor
EXPOSE port -> permite exponer puertos
LABEL some -> se puede crear multiples es para dar metadata a la imagen
USER username -> para indicar en que nivel que usuario ejecuta las tareas por defecto trabaja el user root 
VOLUME path -> es una forma de colocar la data persistente en nuestra maquina aunque borres en container
.dockerignore ->para ignorar archivos destro de nuestro espacio de trbajo sintax parecido a gitnore
Si dejamos el cmd en blanco tomara el cmd por defecto
## buenas practicas
efimero -> facil de destruir
un servicio por contenedor
pocas capas
Multilinea
Varios argumentos en una solacapa
No instalar paquetes innecesarios
Labels -> metadatas
# End Dockerfile
# Volumenes 
Nos permite almacenar data persistente del contenedor
la sintaxis es __utiliza este espacio para que guardes todolosque hagas:en este directorio del contendedor__
con el Tag del doccker file hasta donde dan mis conociemiento VOLUME path -> crea un volumen anonimo
con **docker run -v ponaqui:lodeaqui** image 
creas un contendor mapeado
facilmente pueden crear contenedores que compartan el volumen 
en los volumenes tambien existen los huerfanos por eso al hacer un remove de un contendor
se hace un rm -fv para asegurar
##Subdiviciones
### volumenes de host
son los volumenes que se alamcenan en nuestro docker host o nuestro file system

### End vol host
### volumenes anonimos 
    son los que no generamos o agragamos una carpeta si no que docker crea y asigna una de manera random 
    estos se quedan el la carpeta vlumenes del root de docker
    cuando no se especifica un volumen este lo crea o atraves de VOlUME path
### End vol anonimos
### Name Volumens
    Son volumenes que nosostros creamos pero que docker los maneja internamente el solito
    se crean con **docker volumen create name**
    docker run -v **name**:pathconendeor image

### End vol name volumenes

# End Volumenes
La red por defecto(bridge) es la docker0(ip a|grep docker)
docker network ls -> returna todas las redes
# Redes
## Crear
docker network create __name__ //its simple
docker network create -d **eldrivele controladordelaredpordefectoesbridge** --subnet **subnetadrres** --gateway **yatusabes** **name**
docker inspect __network__
docker run --network nameNetwork -> para crear un contenedor con un red distinta al default
En las redes creadas por nostros se puede hacer un ping o comunicacion por nombres ya que tiene un dns internamente configurado
Esa comunicaion se logra atravez de contenedores de la misma red
# conectar diferente redes
docker connecr network DockerConecameEstared AesteContendor
# AHcer lo contrario
docker disconect DesconectaEstared deEsteContendror
# Aignar una red a un contenedor
docker run --ip someIp
## Eliminar
docker network rm nameNetwork
_si parece Errors points active es que hay contenedores conectaods_
## Bridge
## Host
Una contenedor creado con la red de host hereda todas las culidades del lamaquina
## None
Es un contenedor sin red es decir que se queden aislados
## Overlay
## Conectar contenedores
# End Redes
# Compose
Nos ayuda a crear aplicaciones multicontenedores
Todo esto se define en un archivo de texto debe ser de formato .yml 
#partes obligatorias
version:obligatorios
sevices:obligatoris
volumes:no es obligatorio
networks:no es obligatori
# Example 
version:"doceker compos eversion va aqui"
services:
    cuaquierNombreParaElservicio:
        container_name: nombre del contenedor
        ports:
            "mapinf de puerto"
        **esto se parece como ir deglosando como lo hariamos desde terminal**
_docker-compose up -d docker-compose.yml_
_docker compose down_ esto el servicion y luego lo elimina
REVISAR LAS POLITICAS DE REINICIO,INCIO STOP EN DOCKER
como se sabe que se escribe asi?
https://docs.docker.com/compose
# instalar
ir abuscar los pasos a en la pag web de docker
# end compose

Docker registry -> es un servicio donde podemos subir y bajar imagenes
¿como creamos un registry  local?
on directory some/regystry
docker run -d -p 5000:5000 --name registry -v $PWD/data:/var/lib/registry registry:2
dokcer tag nameActualdelaimgen:tag localhost:5000/SomeName[:opcionalTag]
eso se llama tagear
docker push localhost:5000/namedeLaImageTageada
para bajarla hacemos un lo mismo pero un pull en vez de push
compartir nuestro registry cambiando el comando de start del demonio de docker añadidiendo el flag --insecure-regsitry miip:port

