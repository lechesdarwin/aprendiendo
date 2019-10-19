import threading
import time
#con este ejemplo desde la linea 3 a la 11
#def tread():
#    print("comenzamos")
#    time.sleep(2)
#    print("terminamos")
##nos damos cuentas que los treads no depem¿nden totalmente del hilo de ejecucion principal
##maintread finaliza cuando los treads hijos tambien lo hacen
#tread=threading.Thread(target=tread)
#tread.start()
#print("termina de ejecutarse la utima linea")
# en el caso de los demonios<correen en baackgorund> estos dependen del maintrad osea estos finalizan si el main tread finaliza en la manera de implementarlo es añadiendo el parametro daemon en true
def daemon():
    while True:
        print("devlopers")
        time.sleep(0.5)
if __name__ == "__main__":
    tread = threading.Thread(target=daemon , daemon=True)
    tread.start()
    while True:
        print("presionaste",input("algo apreta"))