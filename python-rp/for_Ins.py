import threading
import time

def sal():
    
    print(threading.current_thread().ident)
    time.sleep(0.5)

if __name__ == "__main__":
    for i in range(1,20):
        tread = threading.Thread(target=sal)
        tread.start()