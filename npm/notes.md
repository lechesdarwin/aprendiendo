como buena practica debemos iniciar un npm init antes de comenzar a trabajar
las dependencias son aquellas que son requeridas para el proyecto 
    npm install some-package --save
las dependencias de desarrollo son aquella que se necesita para y solo el desarrollo 
    npm install some-package --save-dev
las dependencias opcionales son aquellas que pueden se instladas opcionalmente si es asi como lo desea el equipo un ejemplo
de desarrolo opcional es un linter
    npm install some-package -O
Instalando con forzando la ultima version de los servidores de  npm
    npm install some-package -f
las dependencias globales son aquella que estaran disponible en todad la maquina ,se ncesita acceso root para instalar esto
tipos de paquetes
Podemos simular la instalacion de un paquete para ver de como se pude comportar 
    npm install some-package --dry-run
Instalando de acuerdo a a una verison en especifica
    npm install somepackage@x.y.z
    npm install some-package@latest // para instalar la ultima vesion
# actualizar y eliminar paquetes
con el siguiente comando podemos ver que paquetes estan actualizados o no
    npm outdate // podemos hacerlo mas verboso con el flag **--dd**
    npm update // actualiza los paquetes desactualizados
Podemos actualizar un paquete de la siguiente manera
    npm install some-packge@latest
Podemos deinstalar un paquete de todo el node modules y del package.json con :
    npm uninstall some.package
O podemos desintalar un package si eleiminar del package.json
    npm uninstall some-package --no-save

la ^en versionado de package.json es que le indica que reciba actualizaciones de cambios menores y parches
la ~ es para garantizar la actualizacion de solo los parches
Los scripts son comandos que podemos utilizar o crear nuestro shotcuts de comandos
estos script se ejecutan con **npm run el-script**

Podemos tener errores de versionado e intentar intalarlo de nuevo pero talvez siga dando los mismos errores por que 
npm ira a buscar al cache 
para solucionar eso podemos eliminar el cache con
    npm cache clean -f
Y podemos verificar
    npm cache verify
Esto garantiza que se haga la peticion a los servidores

# Seguridad  podemos indicar a nom que nos haga una auditoria de los paquetes con
    npm audit // esto nosbota informacion en la consola
    si le pasamos --json nos dara una salida json

Actualizamos los paquetes para v¿tener mas segguridad
    npm update some-package --depth N
    N es el nuemro de profuncdidad esd decir las depencdencias de sus dependencias tambien se actualizaran
    O si no queremos ensuciarnos la mano  hacemos un
        npm audit fix
# desarrololando nuestro paquete
    sudi npm link
    Esto nos crea un link para ejecutarlo comom un comando mas del sitema
    actualizamos en local
    npm install /pathLocalDelProjecto
Añadiendo un usuario a npm
    npm adduser
publicando npm
    npm published



