import threading
import requests
from concurrent.futures import Future
#el metodo done() sera false si ya termino de lo contrario seguira siendo true
def show_pokemon(future):
    response = future.result() #get result from future insrance
    response_json = response.json()
    name = response_json.get("forms")[0].get("name")

def generate_request(url):
    future = Future()
    tread = threading.Thread(target=(
        lambda: future.set_result(requests.get(url))#añadimos un resulado para que el callback del futuro lo  trate una vez este preparado
    ))
    thread.start()
    return future
