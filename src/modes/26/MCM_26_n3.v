/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_26_n3 (
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
    Y10
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
    Y8,
    Y9,
    Y10;

  wire [15:0] Y [0:9];

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

  //Multipliers:

  wire signed [15:0]
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
    w10,
    w22,
    w28,
    w30,
    w24,
    w18,
    w12,
    w6;

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
  assign w10 = w5 << 1;
  assign w22 = w11 << 1;
  assign w28 = w7 << 2;
  assign w30 = w15 << 1;
  assign w24 = w3 << 3;
  assign w18 = w9 << 1;
  assign w12 = w3 << 2;
  assign w6 = w3 << 1;

  assign Y[0] = w4;
  assign Y[1] = w10;
  assign Y[2] = w16;
  assign Y[3] = w22;
  assign Y[4] = w28;
  assign Y[5] = w30;
  assign Y[6] = w24;
  assign Y[7] = w18;
  assign Y[8] = w12;
  assign Y[9] = w6;

endmodule //MCM_26_n3

