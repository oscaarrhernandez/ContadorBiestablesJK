/*
PRACTICA DE COMPUTADORES I:                                                         Autor: Óscar Hernández Hernández PA1 
       -Diseñar y programar en Verilog un contador de cuenta arbitraria de 4 bits.
       -Cuenta: 6-5-13-2-4-11-9-8
       -Numero de puertas: 
              JK3: 3 puertas(J3), 5 puertas(K3)
              JK2: 1 puerta(J2), 6 puertas(K2)
              JK1: 6 puertas(J1)
              JK0: 1 puerta(J0), 4.5 puertas(K0)
            TOTAL= 26.5 puertas 

*/

//Modulo del Biestable JK
module JKdown(output reg Q, output wire NQ, input wire J, input wire K, input wire C);
  not(NQ,Q);
  
  initial
  begin
    Q=0;
  end
  
  always @(posedge C)//Activado por flanco de subida
    case ({J,K})
      2'b10: Q=1;
      2'b01: Q=0;
      2'b11: Q=~Q;
    endcase
endmodule

//Circuito y cables auxiliares
module contador(output wire [3:0] Q, input wire C);
  //Salidas negadas de los biestables
    wire[3:0] nQ;
    
  //Cables de entrada a los biestables
    wire J0, K0, J1, K1, J2, K2, J3, K3;
  
  //Cables intermedios
    wire nq1q2, q0q2, nq1nq0nq2, q1q2, nq1nq0nq3, nq1q0q3, q1q0nq3, nq0nq3q2, nq0q3nq2, q0q3q2, nq1nq2, q3q2, q1nq3;
    //Puertas logicas de los biestables
      //Biestable JK3
      and NQ1Q2 (nq1q2, nQ[1], Q[2]);
      and Q0Q2 (q0q2, Q[0], Q[2]);
      or OJ3 (J3, nq1q2, q0q2);
      and NQ1NQ0NQ2 (nq1nq0nq2, nQ[1], nQ[0], nQ[2]);
      and Q1Q2 (q1q2, Q[1], Q[2]);
      or OK3 (K3, nq1nq0nq2, q0q2, q1q2);

      //Biestable JK2
      buf BJ2 (J2, nQ[0]);
      and NQ1NQ0NQ3 (nq1nq0nq3, nQ[1], nQ[0], nQ[3]);
      and NQ1Q0Q3 (nq1q0q3, nQ[1], Q[0], Q[3]);
      and Q1Q0NQ3 (q1q0nq3, Q[1], Q[0], nQ[3]);
      or OK2 (K2, nq1nq0nq3, nq1q0q3, q1q0nq3);

      //Biestable JK1
      and NQ0NQ3Q2 (nq0nq3q2, nQ[0], nQ[3], Q[2]);
      and NQ0Q3NQ2 (nq0q3nq2, nQ[0], Q[3], nQ[2]);
      and Q0Q3Q2 (q0q3q2, Q[0], Q[3], Q[2]);
      or OJ1 (J1, nq0nq3q2, nq0q3nq2, q0q3q2);
      //K1=1

      //Biestable JK0
      buf BJ0 (J0, Q[2]);
      and NQ1NQ2 (nq1nq2, nQ[1], nQ[2]);
      and Q3Q2 (q3q2, Q[3], Q[2]);
      and Q1NQ3 (q1nq3, Q[1], nQ[3]);
      or OK0 (K0, nq1nq2, q3q2, q1nq3);

      //Biestable JK
      JKdown jk3 (Q[3], nQ[3], J3, K3, C);
      JKdown jk2 (Q[2], nQ[2], nQ[0], K2, C);
      JKdown jk1 (Q[1], nQ[1], J1, 1'b1, C);
      JKdown jk0 (Q[0], nQ[0], Q[2], K0, C);

endmodule
     
      //Modulo de prueba
      module test;
        reg C;
        wire [3:0] Q;
        contador counter (Q,C);
        
        always
        begin
          #5 C=~C;
        end
        
        initial 
        begin
          $dumpfile("Contador.dmp");
          $dumpvars(2, counter, Q);

          counter.jk0.Q<=0;//Numero por el que empieza la serie,
          counter.jk1.Q<=1;//en este caso el 0110(6 en decimal).
          counter.jk2.Q<=1;
          counter.jk3.Q<=0;
          
          C=0;
          
          $monitor($time, "C(%b) |%d|",C,Q);//Representar salida en terminal.No es necesario pero asi
          #100 $finish;                     //compruebo que la secuencia es la correcta.
        end
endmodule
