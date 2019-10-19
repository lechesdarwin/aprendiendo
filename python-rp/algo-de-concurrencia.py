import threading
import requests
import time

def get_name(n):
    time.sleep(n)
    print(n*2)

#de manera secuencial un solo hilo 
#if __name__ == "__main__":
#    for n in range(0,10):
#        get_name(n)

#de manera concurrente    
#un tread es la expresion mas minima del codigo 
#el metodo join es un metodo que le indica que que se una el el hilo se una con el proceso principal es decir que si se llama al metdo join en l linea 15 y hay otro proceso en la linea 16,16 no se ejecutara a menos que termine lo que esta sucediendo en el tread que llama el metodo join en la inea 15
if __name__ == "__main__":
    for n in range(0,10):
        tread=threading.Thread(target=get_name,args=(n,))
        tread.start()
#dormir un tread para poder dar paso para que otro tread

#como programar callbacks
tread=threading.Timer(
    3,#numero de segundos a esperar
    callable #un callback
)
tread.start() #esto no deterndra el proceso esto se ejecutara una vez pase los 3 segundos
