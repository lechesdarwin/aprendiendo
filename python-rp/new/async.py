import asyncio

loop = asyncio.get_event_loop()
# acontinuacion hare algo como lo hace nodo de una manera verbosa
async def slow_functio(future:asyncio.Future):
    """el parametro future es como el return de una promesa """
    await asyncio.sleep(2)
    future.set_result("este mensaje viene desde el slow function")

def cb(future:asyncio.Future):
    """este seria como el then() o un callback tradicional """
    print("resultado al calback",future.result())
    loop.stop()
# preparamos el furure
future = asyncio.Future()
# algo si como crea un new Promise
asyncio.ensure_future(slow_functio(future))
# agragamos algo como un .then()
future.add_done_callback(cb)
try:
    loop.run_forever()
finally:
    loop.stop()
# Todas estas cosas es en python3.5 lo bonito estan en python 3.7