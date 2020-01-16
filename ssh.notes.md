# mecanismo de clave simetrica 
se utiliza la misma clave para cifrar y descifrar
# clave asimetrica 
este utiliza 2 claves relacionadas una publica y otra privada

una vez al generar la clave publica para copiarla a servidor remoto hacemos
>ssh-copy-id -i pathdenuestraclavepublica serverremorit@ip
y podemos comprobarlo en el ficherp authorised_host del server remoto que ealli estara nuestra clave publica
ssh agent es una herramienta para manejar claves con frases para no estar colocando la frase a cada rato
es decir nos crea algo como una session

ssh-add pathdelaclaveprivadad

Los ficheros authirzed_keys y knoe_host -> este tiene la ip del host que se conectaron
            este tiene las llave publica conocidas
si queremos borrar un registro de host -> ssh-keygen -R ipdelhost
Una forma de hacer las cosas mas faciles ees trbajando con el fichero de congiguacion de ssh
~/.ssh/config alli agregamos las configuraciones necesarias
host sdad
    some fefje
    defew fref
la jerarquia de toma de configuraciones es (Los parametros de la terminal-> el fichero config -> el fichero de configuracion global)

**ForwardAgent yes**

scp es como cp es origen destino en el caso de que sea una maquina remota debemos hacer haci **user@maquina:path**
tambien se puede copiar archivos entre maquinas remotas!!!!!!!!!

tunel local
ssh -f -L elpuertoquequieroabrirdemimaquina:lamaquinalaquemevoyaconcetar:port usuariodelamaquinaqueseratunel@ipmaq -N
