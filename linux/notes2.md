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

