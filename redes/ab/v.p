set terminal png size 600
set output "resultados.png"
set title "1000 peticiones, 100 peticiones concurrentes"
set size ratio 0.6
set grid y
set xlabel "Nro Peticiones"
set ylabel "Tiempo de respuesta (ms)"
plot "datos.csv" using 9 smooth sbezier with lines title "https://www.eldeber.com.bo/santa-cruz"
