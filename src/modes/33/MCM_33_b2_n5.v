/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_33_b2_n5 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5;

  wire [15:0] Y [0:4];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w5,
    w16,
    w15,
    w30,
    w20;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w30 = w15 << 1;
  assign w20 = w5 << 2;

  assign Y[0] = w1;
  assign Y[1] = w15;
  assign Y[2] = w30;
  assign Y[3] = w20;
  assign Y[4] = w5;

endmodule //MCM_33_b2_n5

