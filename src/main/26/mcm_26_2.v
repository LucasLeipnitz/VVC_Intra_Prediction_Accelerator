/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module mcm_26_2 (
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
    w5,
    w10;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w10 = w5 << 1;

  assign Y[0] = w10;
  assign Y[1] = w4;

endmodule //mcm_26_2

