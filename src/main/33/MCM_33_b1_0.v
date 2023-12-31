/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_33_b1_0 (
    X,
    Y1,
    Y2,
    Y3
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2,
    Y3;

  wire [15:0] Y [0:2];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];

  //Multipliers:

  wire signed [15:0]
    w1,
    w32,
    w31,
    w4,
    w27,
    w8,
    w19;

  assign w1 = X;
  assign w32 = w1 << 5;
  assign w31 = w32 - w1;
  assign w4 = w1 << 2;
  assign w27 = w31 - w4;
  assign w8 = w1 << 3;
  assign w19 = w27 - w8;

  assign Y[0] = w31;
  assign Y[1] = w19;
  assign Y[2] = w4;

endmodule //MCM_33_b1_0

