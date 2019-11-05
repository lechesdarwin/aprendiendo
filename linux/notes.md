#pushd popd funciona son una pila de directorio envez de hacer cd ../..
funciono mi alias!
que pasa si queremos estar mirando todo el tiempo los cambios de un archiv
esta el comando tail -f<f es de forever>
hay variables de stdout(1) y stderr(2)
entonces la cosa seria 1> para el stdout y el 2> por el stderror
si queremos que se el stderr se mande al stout
2>&1 -> todo el stderr mandamenlo donde esta que stdout
listar procesos ps -wA
grep -r . es analiza todos los directorios que estan debajo -e busca-esta_expresion
grep -r . este busca recursivamene hasta por dentro de los archivos
grep -n nos mostrara el numero de linea donde encontro la expresion
zip namezipreturn listOregexfiles
inf de zip zip -vl zipfile -> return  los archivos de csv
tar es una manera de hacer un solo archivo de varios
tar cfz name out create file z 
tar xfz extraxt from file zip name tar
awk -F"replace" file '{printf("%s",)}' los pesos son las columnas donde encontro
pipe | manda el estandar out a el stdin de este comando cat file| grep algp
dmesg muestra todos los log al comienzo del sitema
/var/log/kernel.log === dmesg
/var/log/boot.log -> todos los logs que interactuan con el fierra de la pc
/var/log/bostrap.log los relacionados con ficheros
niveles de ejecucion::
0 apagado 6 reinicio
> 1 monousuario -> root
> 2,3,5,6 multiusuario con sin red o grafico 
> no hay un estadar de estados del 2-6
cambiar nivel de ejecucion runlevel Nlevel
ver en que nivel estamos
runlevel
los scripst de ejcucion se encuentran en 
/etc/rcNrunlevel.d/scripts execute
si comienza con S se ejeutan al inicio y K al apapagar y los numeros establecen el orden de ejecucion
Systemd :
su directorio de trabajo es /etc/systemd/
el mas intererante es system alli se inicia scrips que queremos hacer al inicio del pc
systemctl el encargado de gestionar los demonios los ususrios
Systemd :
su directorio de trabajo es /etc/systemd/
el mas int
system-reload para poder lograr que sistemd reconosca nuestro nueovo servicion en /etc/systemd/
