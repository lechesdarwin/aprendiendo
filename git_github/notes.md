# git

es unn control de versiones de 3 generacion

# autentificacion por dos factores

Esta da una capa de seguricidad a nuestra cuenta esto se encuentra en settings en la lista que 
aparece dar en settings ahi sale la opcion de doble autentificacion podemos hacerlo con una app
o sms , si la lo tenemos xonfigurado podemos hacer que eligir entre las dos opciones en Delevery Options

# Organizaciones

Las organziaciones son como cuentas compartidas que permite administrar todo un proyecto oseea como  un contenedor docker

# El markeplace 

El markeplace es un lugar donde podemos encontrar erramientas para la integracion continua devops
En este caso nostros probaremos codacy esta herramienta nos ayuda a encontrar posible mejora en nuestro codigo
app.codacy.com

# runtime configuration git config

Esto se le llama a la configuracion en general que que tien git para trabajar en el momento que se este ocupando esto le da
las capacidades para realizar diferentes tareas de adminstracion
Existen 3 niveles de configuracion systema , usuario(el usurio actual dque usa la computadora) y por repositorio

## por systema

Esta es la configuraciondel todo systema ose es como la configuracion global se pude configurar desde
/etc/gitconfig or $:git config --system

## por susario

este es la configuracion de usuario actual que usa el systema se puede congrar con
~/.gitconfig or $:git config --global

## por repositorio

Esta configuaciones especifica por cada repositorio este se puede encontrar en un archivo que 
debe esta en la raiz del projecto llamado  
somepaht/.git/config or git config --local 
__listando la configuracion $:git config [nivel] --list__

**Eliminadno configuraciones $:git config [level] --unset [sectionname].[sectionfiel]**

## configurando ssh

generamos una llave ssh
luego la agrgamos al agente ssh para no estar todo el tiempoponiendio la llave de prase
ssh-add -k sshllaveprivadapath
luego copiemos nuestra llave publica en guithub ya tu sabes

Toca 56