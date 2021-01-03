## DETALLES DEL CÓDIGO
Aquí vamos a analizar el [código](https://github.com/oscaarrhernandez/ContadorBiestablesJK/blob/main/Contador-4-Biestables/C%C3%B3digo/circuitoverilog.v), explicando cada una de las partes que lo forman. 

### PARTES
Nos encontramos el modulo del biestable JK, posteriormente el circuito del contador y por último el modulo de prueba.
#### BIESTABLE JK
Aquí definiremos el biestable que vamos a usar. En este caso es un Biestable JK con dos salidas (output reg Q, output wire NQ) y tres entradas (input wire J, input wire K, input wire C). 

_(C es la entrada de reloj)_

Para formar el NQ usamos una puerta lógica not. _not (NQ,Q)-> not (salida,entrada)_

Ponemos el Q a 0 y indicamos que queremos que sea activo por flanco de subida. _always @(posedge C)_

Lo siguiente es escribir los posibles valores de Q, estos son 0, 1 y ~Q .
#### CIRCUITO DEL CONTADOR
En este módulo lo que vamos a hacer es escribir es circuito y la circuiteria auxiliar a este. Aqui nos encontramos los cables correspondientes a las salidas negadas de los biestables, cables de entrada a los biestables, cables intermedios, puertas lógicas correspondientes al contador y por último los 4 JK donde pondremos las entradas y las salidas de cada 1, aqui es donde pondremos si el valor de una entrada el 1, 0 o el J o K correspondiente a ese biestable. No hay que olvidarse que hay que poner la entrada del reloj. 
#### CIRCUITO DE PRUEBA
El circuito de prueba nos permite probar el circuito, aquí es donde tendremos que indicar que queremos que nos proporcione un archivo .dmp y que el reloj se inicie en 0. A parte de esto podemos añadir cosas como que nos de el resultado tambien en la terminal (_$monitor($time, "C(%b) |%d|",C,Q);_) o que queremos que la secuencia empiece por un 

numero:  

         counter.jk0.Q<=0;
         counter.jk1.Q<=1;
         counter.jk2.Q<=1;
         counter.jk3.Q<=0; 
         Esto haria que la secuencia empezara por 0110, es decir, el número 6 en decimal.

