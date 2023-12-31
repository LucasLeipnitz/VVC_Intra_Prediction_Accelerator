/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_planar_1 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15,
    Y16,
    Y17
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output unsigned  [12:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9,
    Y10,
    Y11,
    Y12,
    Y13,
    Y14,
    Y15,
    Y16,
    Y17;

  wire [12:0] Y [0:16];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];
  assign Y9 = Y[8];
  assign Y10 = Y[9];
  assign Y11 = Y[10];
  assign Y12 = Y[11];
  assign Y13 = Y[12];
  assign Y14 = Y[13];
  assign Y15 = Y[14];
  assign Y16 = Y[15];
  assign Y17 = Y[16];

  //Multipliers:

  wire signed [12:0]
    w1,
    w4,
    w3,
    w5,
    w8,
    w7,
    w9,
    w16,
    w15,
    w17,
    w32,
    w31,
    w11,
    w13,
    w19,
    w21,
    w24,
    w23,
    w25,
    w27,
    w29,
    w18,
    w20,
    w22,
    w26,
    w28,
    w30;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w5 = w1 + w4;
  assign w8 = w1 << 3;
  assign w7 = w8 - w1;
  assign w9 = w1 + w8;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w17 = w1 + w16;
  assign w32 = w1 << 5;
  assign w31 = w32 - w1;
  assign w11 = w3 + w8;
  assign w13 = w16 - w3;
  assign w19 = w3 + w16;
  assign w21 = w5 + w16;
  assign w24 = w3 << 3;
  assign w23 = w24 - w1;
  assign w25 = w1 + w24;
  assign w27 = w32 - w5;
  assign w29 = w32 - w3;
  assign w18 = w9 << 1;
  assign w20 = w5 << 2;
  assign w22 = w11 << 1;
  assign w26 = w13 << 1;
  assign w28 = w7 << 2;
  assign w30 = w15 << 1;

  assign Y[0] = w16;
  assign Y[1] = w17;
  assign Y[2] = w18;
  assign Y[3] = w19;
  assign Y[4] = w20;
  assign Y[5] = w21;
  assign Y[6] = w22;
  assign Y[7] = w23;
  assign Y[8] = w24;
  assign Y[9] = w25;
  assign Y[10] = w26;
  assign Y[11] = w27;
  assign Y[12] = w28;
  assign Y[13] = w29;
  assign Y[14] = w30;
  assign Y[15] = w31;
  assign Y[16] = w32;

endmodule //module MCM_planar_v1

