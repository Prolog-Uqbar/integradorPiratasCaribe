# Piratas del caribe
**En el último episodio de la clásica saga nuestros conocidos piratas retoman los aspectos más tradicionales de su oficio, o sea piratear.**

La corte de la hermandad realizó un relevamiento de los recorridos de todas las embarcaciones que recorren los puertos del caribe llevando y trayendo valiosas mercancías. 

De los puertos se conoce su nombre y el país en el que está ubicado. Se conocen las rutas marítimas que unen un puerto con otro y se sabe la distancia que las separa. Lo más importante es que tienen registrado cada uno de los viajes que se realizan, indicando el puerto de origen, el puerto de destino, el valor de la mercancía transportada, como así también la embarcación que las transporta. Sólo se hacen viajes entre puertos unidos mediante una ruta.
Los tipos de embarcaciones que hacen viajes existentes al momento son: 
* Galeón, del que se sabe la cantidad de cañones
* Carabela, del que se conoce la capacidad de su bodega y la cantidad de soldados. 
* Galera, del cual se conoce el país de bandera.
De cada capitán pirata se conoce su nombre, el nombre de su barco (no interesa saber el tipo de embarcación), la cantidad de piratas y el ímpetu combativo que aporta cada barco.

1. Saber si un capitán pirata puede con su barco abordar una embarcación que está haciendo un viaje. Para ello, su poderío debe ser mayor que la resistencia de la embarcación. El poderío del capitán pirata es la cantidad de piratas de la tripulación más 2 (el capitán vale doble) multiplicado por el ímpetu combativo que le aporta el mismo barco. La resistencia de las embarcaciones se calcula de la siguiente manera:
* Galeon: cantidad de cañones * 100 / distancia del viaje.
* Carabela: valor de la mercancía/10 + cantidad de soldados , independientemente de la distancia recorrida
* Galera: 100/ distancia del viaje, si es un barco español, en caso contrario valor de la mercancía*10.

2. Obtener el botín total de un capitán pirata que bloquea un puerto y se apodera de las mercancías de todas las embarcaciones que pueda abordar de las que llegan o parten de allí. 

3. Averiguar a qué capitanes piratas se los puede caracterizar como:
* Decadente. Un capitán pirata es decadente si no hay ninguna embarcación que pueda abordar y tiene menos de 10 piratas en su propio barco.
* Terror del puerto: Si hay algún puerto, del que el capitán pirata sea el único que puede abordar a todos las embarcaciones que llegan o parten de él. 
* Excéntrico. Definir una forma en que un capitán pirata es excéntrico, teniendo en cuenta su barco y utilizando algún predicado de orden superior no usado en el resto del examen (si se utilizaron todos los conocidos, vale repetir).

4. Asumiendo (sólo para este ítem) que las rutas marítimas son unidireccionales y que no hay ciclos, averiguar si un determinado pirata puede ir de un puerto a otro, considerando que se debe poder llegar al destino final pasando eventualmente por puertos intermedios, de manera que el poderío del capitán pirata sea siempre mayor a la distancia de cada una de las rutas maritimas utilizadas.	

5. Definir algunos hechos de prueba para que al menos:
* Jack sparrow, al mando del perla negra, resulta excéntrico.
* Davy jones, con su holandes errante, es terror del puerto. 
* Barbosa es decadente. 
* Averiguar las posibles caracterizaciones de Will Turner
* Se pueda calcular el botín para algún pirata que bloquee el puerto de cartagena de indias
* Que un determinado pirata a elección, con un barco que le da gran poderío, puede ir desde desde bahamas a islas cayman, pasando por panamá y algún otro puerto paradisíaco del caribe. 

6. Conceptos:
* Analizar la inversibilidad de dos de los predicados requeridos, justificando conceptualmente. 
* Explicar la utilidad del concepto de polimorfismo en la solución realizada.
