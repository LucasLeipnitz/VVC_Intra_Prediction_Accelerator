/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_3_b2_7 (
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
    w32,
    w31,
    w8,
    w39,
    w38,
    w19,
    w2,
    w16,
    w4;

  assign w1 = X;
  assign w32 = w1 << 5;
  assign w31 = w32 - w1;
  assign w8 = w1 << 3;
  assign w39 = w31 + w8;
  assign w38 = w39 - w1;
  assign w19 = w38 >> 1;
  assign w2 = w1 << 1;
  assign w16 = w1 << 4;
  assign w4 = w1 << 2;

  assign Y[0] = w2;
  assign Y[1] = w16;
  assign Y[2] = w31;
  assign Y[3] = w19;
  assign Y[4] = w4;

endmodule //MCM_3_b2_7

