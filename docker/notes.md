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
