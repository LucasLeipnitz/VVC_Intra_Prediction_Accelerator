/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_49_b1_0 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8;

  wire [15:0] Y [0:7];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w3,
    w5,
    w8,
    w9,
    w16,
    w17,
    w11,
    w19,
    w21,
    w24,
    w23,
    w18,
    w20,
    w22;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w5 = w1 + w4;
  assign w8 = w1 << 3;
  assign w9 = w1 + w8;
  assign w16 = w1 << 4;
  assign w17 = w1 + w16;
  assign w11 = w3 + w8;
  assign w19 = w3 + w16;
  assign w21 = w5 + w16;
  assign w24 = w3 << 3;
  assign w23 = w24 - w1;
  assign w18 = w9 << 1;
  assign w20 = w5 << 2;
  assign w22 = w11 << 1;

  assign Y[0] = w17;
  assign Y[1] = w18;
  assign Y[2] = w19;
  assign Y[3] = w20;
  assign Y[4] = w21;
  assign Y[5] = w22;
  assign Y[6] = w23;
  assign Y[7] = w24;

endmodule //MCM_49_b1_0

