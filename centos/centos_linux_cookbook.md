# Instalacion en modo text (Si el sistema tiene menos de 768M este sistema iniciara automacticamente)
bueno iniciamos normalmente pero en vez de dar enter en Install Centos damos un tab y colocamos esto
>vmzlinuz initrd=initrd.img inst.stage2=hd:LABEL=CentOS
\x207\x20x86_64 rd.live.check quiet text

para regresar atras press c,una vez configurado todo esto debemos ingresar b para iniciar la configuracion

# instalacion en multiples servidores a la vez
para lograr esto nos apoyaremos del archivo de configuracion kickstart.cfg que proporciona anaconda
centos tiene por defecto un archivo de configuracion rapida para este tipo de instalaciones que esta en **/root/kickstart.cfg** pero en el caso de ubuntu se puede generar o mejor leamos la documentacion en https://help.ubuntu.com/lts/installation-guide/i386/ch04s06.html

al igual que iniciar en modo text ingresamos
vmlinuz initrd=initrd.img ks=http://192.168.56.100/kickstart.cfg # bueno el nombre puede variar deacuerdo al nombre de configuracion
pero en el servidor debe haber 
+ el archivo de configuracion en la raiz /var/www/html/kickstart.cfg
+ la iso en /var/www/html/centos/7/x86_64
# bueno eso es en caso de centos debemos investigar para ubuntu

# vamos instalar un gui en centos en ubuntu es un poquito diferente
yum groupinstall "GNOME Desktop" # instala el grupo de paquetes de gnome desktop
iniciar manualmente el servidor
startx
si tiene mas de un entorno grafico y quiere iniciar session en el
start /ruteodsessiondeserverX
alc cerrar la session volvear a la shell
o inicia el grafico de maner aauto matica con 
systemctl set-default graphical.target

cent os al parecer maneja la configuracion de la interfaz de red por separado 
/etc/sysconfig/network-scripts/**interfaz-de-red** # cada interfaz de red tiene un fichero de configuracion alli
es donde se deben ejecutar los parametros ¿y el gatway? Bueno eso es en fichero /etc/sysconfig/network # aqui es donde 
colocamos GATEWAY="IP" luego de eso reiniciamos el servicio de red **systemctl restart network.service**

Bueno si queremos tener varias ip dentro de la misma interfaz debemo copiar el archivo de la interfaz con un **:N** donde N es el numero de ip que vas subiendo
dentro del archivo cambias la el nombre al que quieras y al device le aumentas **:N** borrar La MAC y el UUDI si lo tienen y listo
**mierda hasta hoara es un quilombo cambiar el nombre de l interfazxa de eredfe asique no botes tu tiempo en haceer esa meida**
ME HE SALTADO LA CONGIGURACION DE DOS DIPOSITIVOS A UNO SOLO POR QUE NO TENNGO UN DISPOITVIO CON DOS INTERFACES
# configuracion e firewallD desde el sistema este es un firewall que trabaja con iptables por debajo
como ya vimos los comando anteriore
para vover a cargar el firewall despues derealizar un cambio realizae $:firewall-cmd --reload

en fierwallId todas las configuraciones de los servicios son guardados o los predeterminados en archivos xml
en la ruta /usr/lib/firewalld/services/
puiedes aggarrar unos y empezar a personalizar tus propios sericios

si queremos trabajar con iptables debemos parar el servicioo de firewallId y desactivarlo al inicio de l sistema luego instalr iptables-services si es que no lo esta
$:systemctl stop firewallid.sevioce
$:systemctl  mask firewallid.service

cuando queremos listas los reglas de iptables y mostras el numero de linea o id
$:iptables -L --line-numers
abriendo el trafico por el puerto 80
$iptables -A INPUT -i <interface> -blblblblb ya hay un libro completo de esta cachiporar
pero recordadr reiniciar el sistema para que se aplique las reglas systemctl restart iptables

# instalando u servidopr dhcp server , solo hace esto si es que su route o realmente lo necesite
instalamos ele paquete dhcp
copiamos una configuracion de ejempĺo de /usr/share/doc/dhcp-4.2.5/dhcpd.conf.sample
a donde debe ir la configuracion de dhcp
/etc/dhcp/dhcp.conf
podemos modificarlo de acuerdo a nuestera necesdades
luego habilitamos y reinciamos el servicio
systemctl start dhcpd
systemctl enable dhcpd
habilitamos la regla firewall
firewall-cmd --zone=public --permanet --enabled-service=dhcp
firewall-cmd --reload

# creando un servidor nfs network file system
este tipo de servidor funciona como una particion para los clientes !! wao
instalmos los paquetes necesario
yum install nfs-utils libnfsidmap
creamos una carpeta de accesos global
mkdir -m 777 /var/nfshare
insertar la siguiente linea en /etc/export
que es el archvo donde se indica las directorio quese expoertan debe haber un tab
/var/nfsshare	<ipdelclientequtendraaccesocon/baradenetmas>(rw,sync,root_squash)
iniciamos los servios
rpcbind nfs-server hacemos un start y un enable
añdimos las reglas 
firewall-cmd --permanent --zone public --add-service rpc-bind
firewall-cmd --permanent --zone public --add-service mountd
firewall-cmd --permanent --zone public --add-service nfs
firewall-cmd --reload
Bueno esto es la parte del servidor
luego el la parte del cliente
instalamos los paquetes de nfs-utils libnfsid
iniciamos los servicios
montamos el disco virtual nfs en una carpeta
mount -t nfs ipservernfs:pathShare destinodemontaje

# protocolo yservidor asmba
me lo he saltado no hay timepom por 
# escalamdo usuarios con sudo
poemos modificar un usario para que podamos usar comando de root podemos hacerlo de dos formas
desde la terminalñ
$:ussermod -a -G Elgruponuevo nameussr
o creacmos un acrhivo con el mismo nom,bre del usuario en /etc/duders.d/
La variable All es un referente para la lsitade comando 1que puede usar

# administrando los logins
podemos cambiar la cconfiguracion por defecto de como se comportan los loguins en /etc/login.defs 
o si queremos cambiar las configuracion de un usuraio especifico usamos el comando chage
chage [ptions] username

# administrando la valides de las pasww o la calidada de las pasww
esto se hace en el archivo de configuracion
/etc/security/pwquality.conf

# auttentificacio de contraseña y de sitema

Estos archivos se encuetran el el directorio /etc/pam.d/
Estos hacen control cuales son los pasos a seguir cuando se comentan errores en el sitema
tenere cuidado en el oreden que se edirtan por que toma en cuenta el oreden en el
que llaman **apesar que este trabajo ya lo hace fail2brain
 _el comado fillock se usa para ver cuantos intentos fallidos tiene un usurario y se puede desbloquear
# los permisos de
el umask es algo interante 
la composicion de la umask es asi node N es el valor del permiso
0(no se deque)N(El valor propietario)N(el falor del grupo)N(el valor de los otros)
el umask es como un gui en el cual cuando se crean deirectorio se resta los permisos por defecto
podemos configurrlo de una mnera global en /etc/profile o en el bashrc para una session en especial
o desde la terminal umask val
supongamos que nuetra umask es 0077 y los permisos por defecto de un directorio son 777 bu7eno al crearlo se va a restar 777-077 y los permisos quedarian del resultado de esa restat

# paqueteria con yum
archivo de configuracion
/etc/yum.conf
directorio donde estan la configuracion 
/etc/yum.repos.d
archivo de logs
/var/log/yum.log
asui como tenemos para descargar el paquete con apt-get download en yum nos ofrece
yumdownloader
comandos
install -> instala uno o varios paquetes
update/upfate-to -> Actualiza /actualiza a la version x
check-update -> actualizas las cabeceras de los reposiltorios o== apt update
upgrade/upgrade-to -> acttulixa o axtuliza al aversion x
remove/erase elimina un paquete
search -> busca un paute
list/info lista indormacion del pauete o de todos los paquetes
# extraer los datode de un paquete rmp
rmp2cpio alguimpaquete.rpm > contenedorcipio.cpio

extraemos los datos con 
cpio - --make-directories < contenedor.cpio
