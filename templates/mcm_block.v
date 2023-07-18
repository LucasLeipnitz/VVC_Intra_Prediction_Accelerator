/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */


/*Renomear o arquivo e module para MCM_modo_ref onde:
	modo: número do modo
	ref: referência de entrada desse bloco MCM (0,1,2,3 ...)	
  Se refêrencia for valor negativo, colocar n_ antes do ref e seguri com o valor numérico (MCM_modo_n_ref).
	Exemplos: MCM_35_n_1, MCM_35_0, MCM_35_1, MCM_36_n_1, MCM_36_0 ...
*/

module MCM_modo_ref (
    X, -- Valor de entrada (referência). Não modificar
    Y1, -- Valor(es) de Saída. Para multiplos Y, começar a partir do Y1 (Y1, Y2, Y3 ...). Para apenas 1 valor de saída, deixar apenas Y 
    Y2,
    Y3
);

  // Port mode declarations:
  input  unsigned  [7:0] X; -- Mudar para veter de 8 bits ([7:0])
  output signed  [15:0] -- Mudar para veter de 16 bits ([15:0])
     Y1,
     Y2,
     Y3;

  wire [15:0] Y [0:2]; -- Mudar para veter de 16 bits

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];

  //Multipliers:

  wire signed [15:0] -- Mudar para veter de 16 bits
    w1,
    w8,
    w7,
    w16,
    w15,
    w60,
    w14,
    w2,
    w2_;

  assign w1 = X;
  assign w8 = w1 << 3;
  assign w7 = w8 - w1;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w60 = w15 << 2;
  assign w14 = w7 << 1;
  assign w2 = w1 << 1;
  assign w2_ = -1 * w2;

  assign Y[0] = w60;
  assign Y[1] = w14;
  assign Y[2] = w2_;

endmodule //multiplier_block

