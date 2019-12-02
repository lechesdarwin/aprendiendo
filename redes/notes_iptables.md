NAT network address translation<creado para solucionar la falta de ipv4>
# SNAT o soucer nat
este de aqui se encarga de hacer posible que un dispositivo con ip privada pueda accder a internet
# DNAT o destination nat esto nos ayuda a exponer un servicio que esta con ip prvada
DMZ Zona desmilitarizada (es separa una serie de sercidores de forma logica o fisica)
Politicas de cortafuego
DROP deniego todo exepto lo que yo configuro que este permitido
ACCEPT inicialmente se permite todo _modo por defecto_ se prohibe trafico inadecuado
Jerarquia de elementos
reglas
estas pueden ser encadenadas
estas reglas encadenadas se convierten en table
# Tablas
+ filter -> cortafuegos.Tabla por defecto
+ nat Para hacer NAT
+ magle Marcar y modificar paquetes
+ raw Depurar seguimiento conexion
+ security Usada para MAC!No es  (SELinux)
# Cadenas de filter
INPUT son la reglas que se aplican a los paquetes que quieran entrar a mi maquina
OUPUT son las reglas que se aplican para los paquetes que salen de mi maquina
FORWARD paquetes que atraviesan mi equipo <sample ai no es para mi?estonces que salga a buscar su destinio>

# Cadenas de NAt
PREROUTING es decir cuando le entra un paquete desde internet mayormente(esta esta destinada para DNAT)pensada para modificaciones de tipo nat antes de que salga de nuestro nat antes de tomar la decision de encadenamiento
INPUT bueno su nombre lo dice no?
OUPUT
POSTROUTING (esta mayormente relacionado con in SNAT)
# sintaX
La tabla por defecto es filter
iptablrs [-t TABLA] [-P CADENA] POLITICA

## listar reglas
iptables -L [CADENA] [-n<para que lo resuelva de forma numerica>] [-v] [--line-numbers]
iptables -S [CADENA] -s
Los targets son las acciones que se aplican cuando un paquete hace match
    ACCEPT:se permite el paso del aquete
    DROP:se elimina silenciosamente
    RETURN:No leer mas reglas y pasar a la siguiente cadena 
Añadir reglas sencillas
_desde este momento los params opcionales son en negritas_ 
APPEND -> esta añade al final de todas la reglas
iptables -A **cadena** **-p PROTOCOLO** **-s IPORIGEN** **-d IPDESTINO** **-i INTERFAZENTRADA** **-o INTERFAZSALIDA** **-j ACCEPT|DROP**
INSERT -> añade al inicio de todas las reglas

_lo mismo que arriba pero remplazando -A por -I la -j son los targets_
## Eliminacion de reglass
check 
colocamos lo mismo que append o insert solo que remplazamos -A|-I por una -C 
delete
los mismo que arriba solo que ahora un -D
o mas facil
iptables -D cadena number
## limpiar
Flush
iptables -F cadena -> borra las reglas
ipables -Z -> pone los contadores a 0
# cadenas INPUT<cuando un paquete viene del exterior a nuestro equipo> y OUPUT<un paquete que sale de mi maquina>
utilizadas para proteger el propio cortafuegos o de forma general en cualquier equipo
Cuando la politica DROP a cada una regla de INPUT le suele corresponder una de output
Como activar el bit de forwad para que permita la salida de trafivo por una interfaz en el caso de un server firewall
    echo 1 >> /proc/sys/net/ipv4/ip_forward

# SNAT
IP Masquerade -> cuando un dispositivo tiene ip dinamicas
activar el bit ip forward
iptables -t nat -A POSTROUTING -s 192168.100./24 -o eth0 -j SNAT --to 80.14.123/32 -> esto es si la ip es statica
Si es dinamica
iptables -t nat -A POSTROUTING -s 192168.100./24 -o eth0 -j MASQUERADE -> esto es si la ip es dinamica
# Nos saltamos las extenciones de NAT

#Seguimiento de conexiones 
contrack
state -> lo hace de forma mas sencilla
# NOS SALTAMOS LA CREACION DE NUEVAS CADENAS
Como hacemos para que nuestros cambios queden guardados?
bueno modificamos los ficheros de systemctl
o en system.conf para activar el bit de forwad
iptablrd-save -> retorna todas las configuraciones actuales de iptables
iptables-restore fichero.data recupera la configuracion
