
perador@server:~# aptitude install apache2-utils gnuplot
Ejecución comando:

1. Selecciona la URL a probar y ejecute comando:

operador@server:~# ab -k -n1000 -c100 -H 'Accept-Encoding: gzip,deflate' http://www.example.com.ve/sitio/
Donde:
-k (KeepAlive). Realizar múltiples solicitudes dentro de una sesión HTTP, funcionalidad de los navegadores por la naturaleza
-n (requests). Número total de solicitudes para ejecutar
-c (concurrency). Cantidad de conexiones concurrentes
-H ‘Accept-Encoding: gzip,deflate’ (custom-header). Anexar encabezados adicionales a la solicitud. Imita la peticiones típica que un navegador enviará

3. Datos Importantes:

– Requests per second (mean): Cantidad de peticiones por segundo
– Time per request (mean): tiempo promedio en atender grupo de peticiones concurrentes
– Time per request (mean, across all concurrent requests): tiempo promedio en atender una petición

Graficar Resultado con gnuplot

1. Selecciona la URL a probar, adicionando el parámetro “-g” y el nombre de un archivo para almacenar los resultados “datos.csv”:

operador@server:~# ab -k -n1000 -c100 -H 'Accept-Encoding: gzip,deflate' -g datos.csv http://www.example.com.ve/sitio/
donde:
-g (gnuplot-file). Escribe todos los valores medidos como un ‘gnuplot’

2. En la misma ruta donde se encuentra el archivo generado “datos.csv”, crear archivo “plot.p”

operador@server:~# vim plot.p
Incluir la siguiente información:

 set terminal png size 600
 set output "resultados.png"
 set title "1000 peticiones, 100 peticiones concurrentes"
 set size ratio 0.6
 set grid y
 set xlabel "Nro Peticiones"
 set ylabel "Tiempo de respuesta (ms)"
 plot "datos.csv" using 9 smooth sbezier with lines title "http://www.example.com.ve"
 
3. Generar la gráfica “resultado.png”

operador@server:~# gnuplot plot.p
