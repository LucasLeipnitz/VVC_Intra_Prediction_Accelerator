/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_planar_2 (
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
    Y16
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
    Y16;

  wire [12:0] Y [0:15];

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
    w11,
    w13,
    w2,
    w6,
    w10,
    w12,
    w14;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w5 = w1 + w4;
  assign w8 = w1 << 3;
  assign w7 = w8 - w1;
  assign w9 = w1 + w8;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w11 = w3 + w8;
  assign w13 = w16 - w3;
  assign w2 = w1 << 1;
  assign w6 = w3 << 1;
  assign w10 = w5 << 1;
  assign w12 = w3 << 2;
  assign w14 = w7 << 1;

  assign Y[0] = w1;
  assign Y[1] = w2;
  assign Y[2] = w3;
  assign Y[3] = w4;
  assign Y[4] = w5;
  assign Y[5] = w6;
  assign Y[6] = w7;
  assign Y[7] = w8;
  assign Y[8] = w9;
  assign Y[9] = w10;
  assign Y[10] = w11;
  assign Y[11] = w12;
  assign Y[12] = w13;
  assign Y[13] = w14;
  assign Y[14] = w15;
  assign Y[15] = w16;

endmodule //MCM_planar_v2

