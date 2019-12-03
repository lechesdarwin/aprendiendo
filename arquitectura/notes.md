# Atributos de calidad
**son expectativas del usuario ,en general implixitas en que tan bueno se comporta nuestro sistema**
Culidades de un sistema
Seguridad,eficiencia,rendimiento
# Ideneidad Funcional
Son cada una de las mediciones con lo que se espera del sistema
Completitud funcional-> Que vas necesitando conforme vas avanzando y como solucinas lo ya establecido
Exacitud funcional->resultado esperado resultado obtenid
pertinencia funcional -> Objetivos cumplidos y objetivos esperando
# Eficiencia de ejecucion
Tiempo de comportamiento -> el tiempo de repuesta a un estimulo
Uso de recursos -> Que tan bueno es utilizando los recursos donde se encuentra ejecutando
Capacidad-> el limite del sistema
# compatibilidad
Interoperalidad -> cuan facil es comunicarse con el sistema (JSON ,XML;SOAP)
Coexistencia -> Cantidad de fallos por razones externas en tiempo dado
Usablidad -> mide metricas de curva de aprendinzaje operabilidad ,la interfaz ,relaciones de dominioy acciones sobre el sistema
Confiabilidad
    mudurez-> la frecuencia de fallas
    disponibilidad -> tiempo fuera de servicio representada en porceentage ,entre mayor porcentage mejor
    toleracia a fallos-> como el sistema puede soportar a fallos,Nexflix ingresa en chaos testing ellos provocan los fallos y ven como responde su sistema
    Capacidad de recuperacion-> el tiempo que tarda en recuperarse

Seguridad
    confibialidad-> como el sistema protege al usuario
    integridad-> cuando el sistema toma recaudos para proteger al usuario
    recaudacion de usuarios -> la traza de responsabilidades
    autenticidad-> como el sistema logra indentificar al usuario
Mantebilidad 
    moduralidad
    capacidad de modificacion
    reusabilidad capacidad de analisis
    capacidad de pruebba
Portablidad
    Adaptividad -> capacidad de ejecutarse en diferentes plataformas
    capidad de instalacion-> la complejidad de instalacion 
    Capacidad de remplazo -> los requirimeinetos que cumple nustreo sistema

Modelos de arquitectura
    MOnoliticos todo el software es construido sobre una misma base
    Distribuidos este es mas tolerante a fallos ya que no necesariamente debe estar en la misma mauquina
    MVC el modelo es el que maneja los datos , la vista bueno este maneja la vista final del usuario
    el controlador se encarga de reaccionar a las accciones del usuario
    Capas tiene dferentes niveles de capas cada capa es independiente de la otra y no comparte datos de forma directa siempre el llamado entre capas es de la parte superior a la inferior
    Orientados aEventos Provicion de Eventos este es un modelo donde las funciones no necesariamente se conocen entre ellas pero r
    todas responden a los eventos sucedidos en el bus de eventos    MIcrokernel es  consta de un nuvcleo ppero este puede ir extendiendo su funcionalidades atravez de plugins
    Comparte nada un patron donde cada modulo se encarga de sus propios datos 
    Microsevicios yo lo considero que se basa con un orquestador dinamico dnde pueden entrar y salir servicions de forma dinamica
    Hexagonal tiene una funcion especifica para cada funcion pero no necesariamente sabe como hacerlo a los aactuadores son los adaptadores o puertos de comunicacion

Los conectores Pizarra/pepositorio ,colas
    un modelo conector es importante cuando tenemos un productor mas rapido que el cosumidor
    Pisazarra o repositori es un conector que asegura la lectura y escritura correcta de datos
