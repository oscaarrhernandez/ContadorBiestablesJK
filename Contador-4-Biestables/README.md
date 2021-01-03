# COMPUTADORES I - Trabajo Contador Arbitrario

_Diseño y codigo de un contador arbitrario de 4 bits._

_Primero se realizarán el diagrama de transición de estados, tabla de transciciones y
finalmente los mapas de Karnaugh de todas las J y K. Una vez todo planeado programaremos
utilizando [Verilog](https://en.wikipedia.org/wiki/Verilog) el contador simulando el comportamiento del circuito. 
Además mostraremos la salida del biestable en GTKWave_


## DIAGRAMA DE ESTADOS
_Destacar que la secuencia es aleatoria para cada trabajo, por lo que el resultado
de este podría variar_
_La secuencia a realizar es: 6 - 5 - 13 - 2 - 4 - 11 - 9 - 8_

_El diagrama elegido (entre las diferentes opciones posibles) es el siguiente:_

<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Diagrama,%20transiciones%20y%20karnaugh/Diagrama.jpg">
</p>


## TABLA DE TRANSICIONES
_A partir del diagrama de estados anterior, escribimos las J y K de los biestables
en función de las salidas Q3, Q2, Q1, Q0._

_La tabla de transiciones quedaría entonces de la siguiente forma:_

<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Diagrama%2C%20transiciones%20y%20karnaugh/Transiciones.jpg">
</p>


## MAPAS DE KARNAUGH:
_Utilizando la tabla de transiciones como referencia, podemos sacar cada una de las
entradas de los biestables escribiendo sus [Mapas de Karnaugh](https://es.wikipedia.org/wiki/Mapa_de_Karnaugh). La negación la
realizamos mediante el símbolo '_
MAPAS JK0 JK1: 
<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Diagrama%2C%20transiciones%20y%20karnaugh/MapasJK0JK1.jpg">
</p>
MAPAS JK2 JK3:
<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Diagrama%2C%20transiciones%20y%20karnaugh/MapasJK2JK3.jpg">
</p>


## CIRCUITO
_Una vez hemos terminado los Mapas de Karnaugh realizamos un esquema del circuito
final que obtendríamos._ 
_En este caso es el siguiente:_

<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Circuito/Circuito.jpg">
</p>


## PROGRAMA EN VERILOG
_El [código](https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/C%C3%B3digo/circuitoverilog.v) está formado por diferentes módulos (JDK, contador y test)._


## GTKWAVE
_La salida que obtenemos del biestable en [GTKWave](http://gtkwave.sourceforge.net/) es la siguiente:_

<p align="center">
  <img src="https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/Cronograma/GTKwave.jpg">
</p>
