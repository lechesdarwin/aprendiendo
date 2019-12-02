Tienen 128 bits
direccion-ipv6/prefijo<este indica los bits de la red unica nomas de 64>
No se ponen 0 a la izquierda
se dividen en 8 grupos 
varios gruposde 0 puden ser ::
No existe termino de mascara de red/pero si algo como prefijo(prefix) para indicar la red o la subred
# Ambito(scope)
No se utlizan terminos de direccion public o private
En ipv es normal que una interfaz tenga varias direcciones IP de diferente ambito o no
ambito global p2p conexiones de punto a punto
ambito local una direccion ip de enlace local
tenemos tantas direcciones que hasta las direcciones locales sean unicas
La direccion es asignada automaic a cada interfaz de red utilizada para comunicarse en una red local
Prefijo fe80::<alogo>/10 para direcciones locales utilizada para el protocolo de descubrimiento de vecinos
# ESTAS SON PROPORCIONADAS POR LA IANA Y A NOSOTROS NO LAS DA EL PROVEEDOR DE ACCSEO A INTERNTS
Las direciones son prporcionadaas gerargicamente por la iaana
Prefijo 2000::/3
# Esquema de entrega <unicast anycast<es casi parecido a aunicast solo que este se conecta al mas cercano> multicast broadcast> 
en ipv6 no hay broadcast<esto se remplazo añadiendo previamente el multicast al que todos los nodos se conectan>
EN teorias
# Unicast (anycast)
64<bits para la red>+64<para la subred>
el esquema mas habitual es 48<que nos proporciona un proveedor> para la red 16<que puedes organizar para tu subred> para de subred 65 de interfaz de red
direcciones de alcance local
prefijo fe80::/10 
54 ceros y 64 bits de interfaz de red
# end Unicast anycast
# Multicast 
    prefijo ff00::/8
    De uso comun 
        ff02::1 Todos los nodos de la red local(algo asi como un broacast)
        ff02::2 todos los routes de la red local
        ff02::1:ff00:0000/104 Nodo solicitado. Cada interfaz de red se agrega a un grup de multicast
        con los ultimos 3 octetos de su direccion de enlace loca
    Para Ethernet(L2) existen las direcciones multicast a nivel de ethernet 33:33:*
# end
# Direcciones ip reservadas
    ::1/128 Loopback (localhost)
    2000::/3 Direcciones globales (de momento)
    ff08::/8 multicast
    ::/128 direccion no especificada (es el 0.0.0.0 de ipv4)
    2001:db8::/32 Documentacion
    2002::/16 6to4
    fc00::/7 Unique local adres (no le mires mucho aun no se especifico para que carajos sera)
# End Direcciones ip reservadas
# Direcciones de enlace Local
    En muchos casos se utilizada es EUI-64 
    Mac los 2 primeros octetos el faabricante los  ultimos la targeta
    EUI-64
    Se parte en a la mitad MAC al medio se coloca FFFE y el 7 bit del primer grupo se cambia 
# End Direcciones de enlace Local
Si queremos hacer un ping .Como ipv6 tiene direcciones para botar se debe indicar la interfaz por donde salir
ping6 ipv6%interfaaz
# configuracion 
en windows ya sabemos que es atravez del entorno grafico
enlinux se puede hacer de manera termporal a atravez de la linea de comandos
y de forma permanente en el fichero /etc/network/interfaces
auto **interfaz**
iface **interfaz** inet6 static
        address **dir**
        gateway **dir**
# SLAAC es un protocolo para que una maquina pueda autoconfigurarse una direccion ipv6
Este recibe los parametros de la red es decir los 64 bits de la red y esas cosas por el estilo
Si tenemos una configuracion SLAAC nuestra dir local == global
ip l set **interface** dow|up

