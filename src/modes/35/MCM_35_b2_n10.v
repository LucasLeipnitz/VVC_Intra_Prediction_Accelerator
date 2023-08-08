/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_35_b2_n10 (
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
    w16,
    w13,
    w24,
    w27,
    w22;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w8 = w1 << 3;
  assign w11 = w3 + w8;
  assign w16 = w1 << 4;
  assign w13 = w16 - w3;
  assign w24 = w3 << 3;
  assign w27 = w3 + w24;
  assign w22 = w11 << 1;

  assign Y[0] = w8;
  assign Y[1] = w22;
  assign Y[2] = w27;
  assign Y[3] = w13;

endmodule //MCM_35_b2_n10

