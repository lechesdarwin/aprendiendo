CLULETAS!!!!!
N,Mco. -> copia desde N hasta M y el punto significa peha en la posicion actual puede remplazar el . por el numerod e linea destino
!END CHULETAS"

claGpackloadall " cargara todos los plugins
silent! helptags ALL " load todas los help files
" los plugins deben estar el la carpeta **.vim/pack/plugins/start/<pluginname>**
en modo linea de comando un **/algunapalabra** buscara ese conjunto de caracteres desde el cursor hasta el final y la forma
contraria es **?alguna palabra**

# Los buffers son una manera de representar los achivosen el que se estan trabajando
si hacemos un ls desde el modo linea de comando nos mostrara 
**n<e numero del buufeer donde estamos parados %a<si estamos pocisionados sobre el actual> elnombredelarchivo lineaactual**

podemos cambiar entre buuffer con **b n** donde n es el numero del buffer o trambien podemos utilizar con los nombres de archivps
pero con cuidado por que si coenciden 2 archivos ,lanzara un erro.Tambien bn(buffer next) bp (bufferprev) el plugin unimpaired nos ayuda con la navegacion de ventanas tabs buffers
# Windows

crear una ventana horizontal -> :split somenamefile OR :sp somenamefile
crear una ventana vertical -> vsplit somenamefile OR :vp somenamefile
navegaos entre las ventanas con un <c-w> + <algunatecladearribaoabajoOlasjkhl>
,pero que carajos es es sintaxis?Bueno es presionar ctrl+w latecladedieccion
podemos cerrar todas las ventanas(el comando :o es only o :on) <c-w> o -> cierra todas las ventnas meno la actual
una forma de crear alias de tecladops es por ejemplo alias a las teclas de navegaccion de ventanas
noremap <alias> <comandooriginasl>
noremap <c-d> <c-w><c-j>
si quereemos cerrar el buffer eactual pero no la ventana debemos mejor guardar el siguien comnadno

h -> izquierda
j-> abajo
k -> arriba
l -> derecha
Podemos mover la posicion de la ventana con ctrl+w , i una tecla de direccion en mayusculas ya mencionadas anteriormente

ctrl+w,r mov todas las ventanas verticales al lado derecho ctrl-w,R hace lo contrario lommueve al izquierda
ctrl+w,x obten todo el contexto del siguiente buffer

# resize windows
:resize +-N aumenta o disminuye la altura de la ventana , la forma corta es ,ctrl+w,+/-
:vertical resize +-N aumenta o disminuye el ancho de la ventana,la forma corta es , ctrl+w,</>

# Tabs
abrimos una nuevo :tabnew O abrimos un nuego con un archivo :tabnew filename+,paranavegar entre tabs podemos hacer
gt or tabnext
gT or tabpreviuos
y cerramos con una pestaña con :tabclose
tambien podemos movernos entre los numeros de los tabs(vim cuenta desde el 0)
:tabmove N donde N es el numero del tab destino
**en vez de estar realizando abrir cerrar vim podemos recargar las configurciones en $:source VIMRC**
donde VIMRc esla ruta donde esta el mountro
abrir un plegable es con **zo** y al cerrarlo es **zc** un configuracion rapida de pliegues para pythone poner en rchivo de configuracion de
**za** closeall que se encarga cerrar los pliegues abiertos y abrir los pliegues cerrados
telefono podemos hacer un reenvio con zR y zM 
set foldmrthod=identi
# el navegador de archivos intregados de vim 
:e para ingresar a la ventana
:Vex -> abrilo cverticalmente
:Sex -> abrirlohorizontalmente
- subir un directorio arriaba,D eleiminar un archivo,R cambiar el nom,bre de un archibio

Netrw es tan potente que permite trabajar co archivos remomotoss atravez de sftpy scp protocols
:e|Ex sftp://<domaina>/directory|scp://<domain>/directiori
# menu salvaje en vim
para activar el menu salvaje en vim debemos colocar 
>set wildmenu 
en su archivo .vimrc o directamente el modo comando
este lo que hacees crear un menu de auto comopletado en la barra de estad
:e taborshift+tab+or key arroy

si queremos que nerd trree siempre e habra al iniciar vim debemeos colocar el sigueientecomando ene nuestro .vvimrc
autocmd VimEnter * NERDTree " activa el aurto inici de vim en Nerd tree
Nerdtree es interasnte pero el explorado de archivo interno de vim es bastante bueno asi que nos es recomedable
t/T(until) + anaycaracter -> buca  la siguiente palabra que contenga ese arcter en la misma linea la T mayusucla busca hacia atraas
f/F (find) + anycaracter -> busca una palabra que contenta ese caracter y posiciona el curos justo e el caracter mientrasque lo posisciona un caracter anterio
_ -> mov al incia de la linea
$ mov al fial de la linea
una **word** consioste en numbers,letrer,underscore y una **WORD** es cualquier caracter exepto espacio en blnco tab,newlines
H -> te lleva al arte superior de la ventana actual
L -> te leva a la parte inferior de la veventana actual
i-> coloca el modo de insercion en la posicion actuual del cursor
I -> colaca el modo de3 insersion al comienxo de la liea
a -> colocal el modo de inserccion un caracter mas donde se quedo el ultimop caraceter del modo de insercion
A -> coloca el modo de insecion ,al final de la  linea
o -> colocal el curso una linea debajo de la posicio acual del curor
O -> coloca la posicioonde del cursor una linea arriba de la pocision acual
gi -> coloca el modo de insercion en el ultimo lugar donde dejaste el cursor
S -> es un lias a cc
C -> borrar todo lo que esta delante de la pocison actual del curor
s -> elimna un  solo caraaceter del la pociocion  de cu
una vez tengamo los resualtado de busqueda con / o ? pofremos ir al siguiente con n y al previo con N
set hlsearch " esto es paera darle un color al los resultaados 
:noh para quitar esos colores
:set incsearch " para que nos posicione automaticamente con la primera coencidencia
# buscar dentro de archivos con grep y vimgrep
sintaxis de vimgrep <regexesprsion> <rutadebusqueda>

una vez tengamos los resultados podemos navegar a lasiguiente coencidencia con cn y retroceder con cp 
pero es mucho mejor utilizar :copen

# ack 
ack es un sucesor de grep ya que este esta diseñado a trabajar con codigo fuente 
Los objetos de texto
di -> borrar todo lo que este dentro de los parentesis
cNw -> borrar N palabras
# copiar pegar y registrps
y-> copia el caracter actual de la posicion de  cursor
yy --> copia toda la lina
ye -> copia hasta elfinal de la palabra
p -> paste
los comando changue a delete cuardar tambien el contenido para que un furturo proximo pueda pegarlos 
# Los registros pueden ser operados por nombres del la a-z o enumerados 0-9 
en los registros enumerados contiene las acciones de changue delete y el mas reciente comuienza desde el 0 y asi sucesivamente
los reistros pueden se accedidos y acompañados de comandos desde su respectiva pocision
los registrso pueden ser sobreescritos (los registros con nombres) solo cambiando en su version mayusculas por ejemplo
 "Ayw -> ell registro A seara cam,biado con el contenido de la palabra dentro
# El modo registro de sistema
vim --version | grep clipboard
+clipboard or +xterm_clipboard -> si tenemos eso buwno entoncwes estamos listos para irnos sino instalaremos vim-gui o vim-genome
y tipeamos en modp normal no en linea de comandos-> ```"*p``` para pegar

# administracinde plugis
instalr vim-plug

$ curl -fLo ~/.vim/autoload/plug.vim --create-dirs  https://raw.github.com/junegunn/vim-plug/master/plug.vim

bueno en entre la seccion de call plug#begi() entre end colocamos todfos loss pluguins que queremos instalar esta ves colocando <usuariodegit>/<namerepo>
guardamos e instalamos e inicializamos la descarga con :PlugInstall

actualizamos los plugins con :PlugUpdate y actualizamos el mmismo vim-plug con :PlugUpgrade
limpiemos los plugins :PLugClean
para que no se esta haciendo lenta la cosa cramos dcondiciones de cuanddo un plugin sera cargado o no
Plug 'usernamegit/reponame' , {'on': 'NERDTreeTogle'}
o creamos condicione para que solo funcione en un tpo de archivos
PLug 'name/reponame' , {'for':'markdown'}
Hay momento quede tanto instalar plugins vim se puede vlver lento pero alveces es cualpa de un solo plugin ya sea que no manejabien los recuros
o por descido del autor
para administrar eso 
vim --startuptime fileof.log
¿que pasa si mientras trabajamos detectamos una accion lenta?
bueno podemo iniciar el test de perfoma desde vim
:profile start profliefilename.log
:profile func *
:profile file *
luego de eso vim estara escuchado todas las caacciones para poder ver la casus de la lentitud
lugo de probar la func lenta nos salimos y examinamos el achivos de profile

¿que pasa si mientras trabajamos detectamos una accion lenta?
bueno podemo iniciar el test de perfoma desde vim
:profile start profliefilename.log
:profile func *
:profile file *
luego de eso vim estara escuchado todas las caacciones para poder ver la casus de la lentitud
lugo de probar la func lenta nos salimos y examinamos el achivos de profile
# dentro de los modos de vim
para navegar por el historial de comandos en vim pulsamos
ctrl+f -> pero claro que tenemos que estrar el en modos linea de comando
i# modos
 visual -> es mas un modo como s trabajaramos con el mause
line visual -> no imporata que solo selecionara lamlias completamente
block viasul -> esmas coomo una sincronizacion con le primero de doned comenzo a maracar
o -> vuelve al comeienzo o a la posicin actual del bloque
# modo terminal
podemos ingresar a este modo con >:terminal o :term 
oque abren noe s mas queuna ventana y podemos tratarla como tal
si ejeuctamos un comando directamnte depues determ este sera direccionado  aun biffer


# reasignacion de comando
map reasigna de forma recursivai
noremap solo  actua como unn alais
POR EL MOMENTO NOS SALTAMOS ESTOS PERO REVISAR LA PAG 130
	  
  
configurar como se muestran algunas cosas en vim como los fines de lineas y tab y mas ¶
set listchars=tab:→\ ,eol:↲,nbsp:␣,trail:•,extends:⟩,precedes:⟨
set list para mostrarlos

#autocopletado
vim ofrece un autocompletado nativo con las palabras ya existendetes en el buffer 
eso se puede lograr con ctrl+n o p
pero tambien puede teer diferenters maneras de lograr el autocompletado
ctrl+x nos pone en disponibilidad una manera de aurtoacompletado
ctrl+i nos autocompleta dfirectamente cion la primera coencidencia
ctrl+f nos autocom autocompleta ahi con los directorio del actuialepacio de trabajo
tambien nos oferce un autocompletado de sematica de un lenguaje siempre y cuenado este habilitado :set spell
accedemos a ello con ctrl+x y un mas s
# YouAutoComplete
este pluginle da super poderes a vim con el autocompletado se basa en la sintaxis del lenguaje donde estamos trabajando

si se esta trabajando con vim-plug has lo sigueiente
let g:plug_timeout = 300 " Increase vim-plug timeout for YouCompleteMe.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

:source $MIVIMRC | PlugInstall
Si ocurre un error de c++:internal error Killed es que tu maquina vieja no tiene memoria crea un swap para eso
$ sudo dd if=/dev/zero of=/var/swap.img bs=1024k
count=1000
$ sudo mkswap /var/swap.img
$ sudo swapon /var/swap.img
si da problemas al instalar ir al directorio de YoumeAutomcopeter y ejecutar python3 install.py

Podemios ir a la definicio  de una funcion con :YCmComplete GoTo 
esto nos llevara a la deficicion de funcion donde esta parado nuestro cursor
Vim tiene qetiguetas que podemos ir la primera declaracion de una palabra o uncion con
gd
pero para que busque desde elprncipio del fichero gD

# tags exuberantes
los ctags no son nativos de vim estan en un paqute de **ctags** en debian
esto crea un archivo de los respectivos tags
podemos agragar la opcion set tags=tags;" para que se busque recursivamente el archivo el (;) es para indiar a vim que busque el archivpde forma recursiva 

podemos navega entre los resultados con tn y tp o podemos listarlos con :ts podemos ir q la "deficicion de una funcion dentro
de un espacio de trabajo local con ctrl+]
podemos indicarle a vi directaente cuando abramos un archivop  a que tag quremos que nos lleve con 
$ vim -t tagname3 filename
para actualizar nuestra base de tags debemos ajecutar $ctags -R
pero esose puede volver cansador
podemos indicar que se actualizae automaticamente cuando guardamos un tipode archivop en especial, podemos configurarlo en nuestro vimrc

autocmd BufWritePost *.cpp *.h silent! !ctags -R &
# gundo 
vim a diferencia de otros editores  tiene la oportunidad de ir por los cambios atraves de un arbol, y no de forma lineal como otros editores
esto se puede hacer de forma artesanal pero gundo nos aydara a hacerlo mas facil
si surge pro}blemas de error como gunda required compilede python2+3 ingresa el sig code a tu vimrc
```vim
if has('python3')
    let g:gundo_prefer_python3 = 1
endif
```
un keyword para ligerar el trabajo
noremap <f5> :GundoToggle<cr> " Map Gundo to <F5>.
# control de versiones integrado vim-fugitive
bueno ya tu sabes la manera de insatalr 
Plug 'tpope/vim-fugitive'+
La mayotia de comando de vim fugitive no es mas que un espejo alos comando de git
por ejemplo :Gstatus == git status
a diferencia que la salida de aqui es interactia se puede navegar por el
ctrl+n o ctrl+p paa navegar entre los archivops o ventanas

POR EL OMENTO NOS QUYEDAMOS EN LA PAGINA 170 PASAMOS A VIM
