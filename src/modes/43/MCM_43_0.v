/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_43_0 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6,
    Y7,
    Y8,
    Y9
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
    Y9;

  wire [15:0] Y [0:8];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];
  assign Y7 = Y[6];
  assign Y8 = Y[7];
  assign Y9 = Y[8];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w3,
    w8,
    w7,
    w9,
    w32,
    w31,
    w16,
    w13,
    w24,
    w21,
    w23,
    w26,
    w28,
    w18;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w8 = w1 << 3;
  assign w7 = w8 - w1;
  assign w9 = w1 + w8;
  assign w32 = w1 << 5;
  assign w31 = w32 - w1;
  assign w16 = w1 << 4;
  assign w13 = w16 - w3;
  assign w24 = w3 << 3;
  assign w21 = w24 - w3;
  assign w23 = w24 - w1;
  assign w26 = w13 << 1;
  assign w28 = w7 << 2;
  assign w18 = w9 << 1;

  assign Y[0] = w21;
  assign Y[1] = w26;
  assign Y[2] = w31;
  assign Y[3] = w28;
  assign Y[4] = w23;
  assign Y[5] = w18;
  assign Y[6] = w13;
  assign Y[7] = w8;
  assign Y[8] = w3;

endmodule //MCM_43_0

