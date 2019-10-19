import logging
#El debug tiene diferentes niveles 
#debbug(10),info(20),warnig(30),error(40),critical(50)

#debug ya biene configurado con alguas configuraciones basicas peri nosotros tambien podemso
#cambiar esas configuraciones predeterminadas
logging.basicConfig(
    level=logging.DEBUG, #desde que nivel deseamos que se muestre los mensajes
    format="%(message)s ",#el formato que deamos que sea mostrado el mensage recomendable invesigar los formatos disponibles
    datefmt="",
    filename=""#si no queremos que se muestre el pantalla y lo queremos redireccionar a un archivo
    )

logging.debug("mesage y asi susesivamente par alos demas nivels")