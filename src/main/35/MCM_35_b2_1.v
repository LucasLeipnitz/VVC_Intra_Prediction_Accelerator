/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_35_b2_1 (
    X,
    Y1,
    Y2
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2;

  wire [15:0] Y [0:1];

  assign Y1 = Y[0];
  assign Y2 = Y[1];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w3,
    w8,
    w11,
    w24,
    w25;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w8 = w1 << 3;
  assign w11 = w3 + w8;
  assign w24 = w3 << 3;
  assign w25 = w1 + w24;

  assign Y[0] = w25;
  assign Y[1] = w11;

endmodule //MCM_35_b2_1

