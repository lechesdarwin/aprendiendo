# administracion de usuarios y grupos
getent === cat /etc/passwd -> y tiene aun mas
Caracteristicas de nombres de usuarios en linux
    admite números ,letras ysimbolos
    sensibles a masyusculas,max 32 caracters
    **best practice**
    Usar quiones bajos o puntos en vez de espacios
    No crear nombres mas de 8 caracters
    Seguir un metodo de creacion de usuarios
    No crear usuarios con el mismo nombre y que solo se diferencia en mayusuclas
Ficheros relacionados
/etc/group -> gwwstion de grupos
    nombre:pass:GID<identficador de grupo>:miembros
/etc/passwd -> administracion de usuarios
    nombre:pass:UID<identificador de usuario>:GID:Name:HOMEDIR:shell
/etc/shadow -> funciones adicionales de usuarios 
    nombre:pass_cryp_:camp1<el numero de dias que pasaron desde el 1 de enero de 1970 donde la contraseña fue cambiada por ultima vez>:camp2<el numero minimo de dias que se pide que se cambie la contra>:camp3<el numero de dias de expiracion de caducacion de contraseña>:camp4<el numero de dias antes que avisa wque caduca la contra>:camp5<cuantos dias de gracia antes de eliminar la cuenta>:camp6<un timestamp de fecha de caducidad de la cuenta>
/etc/gshadow -> funciones adicionales de grupos
    nobre:pass_encrypt_admins:miembro
Los grupos son un modo organizativo o modularizar el espacio de trabajo en linux -> realmente esto es para delimitar el acceso a diferentes zonas 
# Unir usuarios en grupos
groups -> retorna al grupo que pertenesco el grupo de la izquierda es nuestro grupo por defecto
newgrp gruponame-> sirve para cambiar nuestro usuario por defectochgrp grupoautilizar fichero
chwn user:grup fichero|carpeta
# configurar grupos
groupadd -> create new grop
groupmod -> modificar un grupo ya existente
gpasswd -> modificar bastante caracteristicas de un grupo ya existente
groupdel -> elimina un grupo
# End
# configuracion de usuarios
useradd/adduser<ofrece la interfaz interactiva para la creacion del usuario> -> crea un nuevo usuario
passwd -> cambia la contraseña de un grupo
usermod -> modifica las caracteristicas del user
chage -> cambiar politicas del user
userdel -> elimina un usuario
# Ancron es algo un poco mas efectivo que crontab por que este puede recuperarse de caidaas de sistemas 
Anacron
Gestion del  fichero /etc/anacrontab
Periodo:Periodo de ejcucion (dias)
Retraso:Retraso en min desde arranque de anacron para la ejecucion<es decir el tiempo que anacron retrasa una tarea una vez se percata que al anda mal>
Id:indentificador<un nombre cuaquiera>
Comando:comando a ejecutar
**correr todos los scripts de una carpeta -> run-parts /pahth**
registros de anacron /var/spool/anacrom/crom.bllal
Tambien tiene su propio comando

# programar tareas para el futura<osea programa una tarea en el tiempo y listo ahi acaba>
at
comando de at
    at -> add task
    atq -> lista las tareas programadas
    atrm -> elimina una tarea
    + at 20:30
    + >introdicin tus comandosm ...
    + > ctrl+d-> sales
    + atrm id -> elimina el la tarea
# Internaciolizacion 
Ficheros de cnfiguracion de zona horaria
/etc/localtime -> es un enlace simbolico a una zona horaria
/usr/share/zoneinfo ->una base de datos de las zonas horarias
#consulta y configuracion de locales
[idioma[_territorio][.codeset][@nodificador]]
locale -> vemos los locales e¿instalados en nuestro sistema
#Hora del sitema
date -> hora por software
hwclock -> hora del hadware del reloj interno del sistema
LAS HORAS SON IMPORTANTES EN LOS SISTEMAS LINUX
Network Time Protocol (NTP) estos se dividen en stratum (3)niveles desde el 0
Esto nos ayuda a mantener nuestro servidores sincronizado
```
   apt install ntp
   apt install ntpdate
   /etc/ntp.conf -> configuracion de ntp
    la parte de pool son los servidores con los cuales nos vamos a sincronizar nosotros como cliente
    systemctl ntp restart
    nptq ->  para saber si estan trabajando  el servicio
    ntpdate -u 0.debian.pool.ntp.org -> sincronizar nuestra hora con un stratum

```

#Logs
Journal 
    /etc/systemd/jornual.conf
jornalctl -> es el comando de administracion de log 
Syslog
    /etc/syslog.conf
Estableciendo las opciones de registro
Syslog
    facility -> cual es la herramienta que será registrada
        auth,cron,daemon,lpr,syslog
    Priority -> La importacia que tiene ese mensaje
        debug,notice,warn,ellmcrit,panic
    Action ->
        Guardar archivo o reenvialo
si no esta instalado apt install rsyslog
configuracion -> /etc/syslog.conf
Sintax -> **facilidades.prioridades***
Command **logger** -> para crear logs desde nuestro scripts

Rotacion de Archivos de Registro -> esto nos ayuda a tratar de forma automaticamente los ficheros de log crear,backups,copias,comprimir
configuracion /etc/logrotate.conf
    MTA-> Mail Transfer agent
    SMTP -> es protocolo de envio de correo
SMTP 
    Sendmail uno de los primeros
    Posfix bastante eficiente
    Exim -> desuso
    Qmail -> para sistema de poco rendimiento
POP/IMAP
    pull mail servers
    fetch mail
    lectores de correo
Gestion de correos Electronico
Enviar correos 
    Mail -> comandom,script
como vemos los correos internos?
    $~:mail
las colas estan en /var/mail/spoll
gestionar las cola de correos 
mailq
alias de correos /etc/mail/alias
redirecion de correos
    Fordward(~/.forward)
# Me salte la configuracion de impresora
# Configuracion basica de red
En distrubuciones como ubuntu y debia
iface **interfaz** inet dhcp|static
    address IPADDDRES<es la ip que quieres ponerle a tu maquina>
    netmask MASCARA<es la mascara de subred de esa IP>
    network IPSUBRED<es la ip a la que pertence esa direccion IP>
    broadcast BROADCASTDIR<ya tu sabes>
    gateway GATEWAYDIR<y tu sabes>

resolv.conf -> es el fichero de configuracion 
domain eldominiodelamaquina
search loslugaresdondebuscar
nameserver dirdeservidordns

#ifconfig -> es capaz de configurar una interfaz de red
ifup **interfaz**
ifdown **interfaz**

tabla de rutas
route -> es para ver como se resuelve la salida a interne y de nuestro paquetes REVISAR ADSL COURSE
nos ayuda a resolver de como llegar a un red 
/etc/hosts -> este fichero prevalece sobre el servidor de dns osea la primera busqueda
/etc/hostname -> el nobre de la maquina
/etc/nsswirch.conf -> nos indica cuales son las prioridades de resolucion de redes 

traceroute -n domain -> nos traza la ruta del paquete
netstat -> nos indica los sockets de linux que estan en uso
normalmente -> netstat -panut
tcpdump -> todos los paquetes que van por todas la interfaces
dig 
whois domain -> info de un dominio
lsof -> nos muestra los ficheros que estan que siendo utilizados por los procesos 
lsof fichero -> nos muestra info del proceso que lo esta buscando
lsof -i -> que procesos estan exponiendo servicios 
lsof -p $(pidof proceso<este comando nos devuelve el PID de el proceso indicadp>) -> nos muestra los ficheros utilizados por el proceso

fuser /carpeta -> los procesos utilizando el proceso actual

nmap -p port -sU ip -> busca informacion de red utilizada por esa direccion
/etc/paswd -> perm 644 
/etc/shadow -> 000
/etc/limit.conf -> configuaracion de uso de hadware para diferentes ususrios
ulimit file -> para las restrinciones de todo el quipo

who -> quienes estan logueados en el sistema
w -> que comod de donde esta logueando y que esta ejecuando
last -> un historico de conexxiones remota

# configurando inetd
configurando del fichero ined.conf(/etc/inetd.conf)

# ssh /etc/ssh/ -> ficheros de configuracion
authorized_keys -> ficheero de claves 
# mirar el curso de ssh

gpg -> encriptacion de ficheros
gpg --key-gen -> generamos las llave
gpg --ouput **PUB.gpg** --export **indentificador** (sample 243234/ **23e2332**)
    asi es paraexportar la llave publica
gpg --import PUB.gpg -> importa mi llave publica tenemos que suponer que estmos en otro server

gpg --encrypt --recipient **idedelallave   filenameaencriptar**
gpg -d fileencriptado > redireccion -> para desencriptar

#buscar el uso de spc

