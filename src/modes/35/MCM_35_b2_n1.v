/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_35_b2_n1 (
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
    w5,
    w64,
    w59,
    w55,
    w4_,
    w20,
    w2,
    w2_;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w5 = w1 + w4;
  assign w64 = w1 << 6;
  assign w59 = w64 - w5;
  assign w55 = w59 - w4;
  assign w4_ = -1 * w4;
  assign w20 = w5 << 2;
  assign w2 = w1 << 1;
  assign w2_ = -1 * w2;

  assign Y[0] = w4_;
  assign Y[1] = w20;
  assign Y[2] = w55;
  assign Y[3] = w2_;

endmodule //multiplier_block

