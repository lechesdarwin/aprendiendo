# busqueda y remplazo
:s/busca/nuevo/ | busca la primera ocurrencia del patron en la linea actualy lo remplaza
:s/busca/neuvo/g lo mismo que el de arriba solo que remplaz todos
:%s/busca/buevo busca la primera ocurrencia en todo el documento y lo remplaza
:%s/busaca/neued/g lo mismo que el de arriba solo que de manera globañ
:g/busca/s//nuevo/c -> busca y remlaza todo el documento pidiendo confirmacion
:g/busca/s//nuev/g -> lo mismo que el de arriba pero no pide confirmacion
