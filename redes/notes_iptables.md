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

TOCA LA CARPETA 4
