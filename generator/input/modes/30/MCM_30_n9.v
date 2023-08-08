/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_30_n9 (
    X,
    Y1,
    Y2,
    Y3,
    Y4
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2,
    Y3,
    Y4;

  wire [15:0] Y [0:3];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w3,
    w8,
    w11,
    w2,
    w12,
    w22,
    w32;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w8 = w1 << 3;
  assign w11 = w3 + w8;
  assign w2 = w1 << 1;
  assign w12 = w3 << 2;
  assign w22 = w11 << 1;
  assign w32 = w1 << 5;

  assign Y[0] = w2;
  assign Y[1] = w12;
  assign Y[2] = w22;
  assign Y[3] = w32;

endmodule //MCM_30_n9

