/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_7_9 (
    X,
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0]
    Y1,
    Y2,
    Y3,
    Y4,
    Y5,
    Y6;

  wire [15:0] Y [0:5];

  assign Y1 = Y[0];
  assign Y2 = Y[1];
  assign Y3 = Y[2];
  assign Y4 = Y[3];
  assign Y5 = Y[4];
  assign Y6 = Y[5];

  //Multipliers:

  wire signed [15:0]
    w1,
    w4,
    w3,
    w16,
    w15,
    w24,
    w21,
    w25,
    w12,
    w30;

  assign w1 = X;
  assign w4 = w1 << 2;
  assign w3 = w4 - w1;
  assign w16 = w1 << 4;
  assign w15 = w16 - w1;
  assign w24 = w3 << 3;
  assign w21 = w24 - w3;
  assign w25 = w1 + w24;
  assign w12 = w3 << 2;
  assign w30 = w15 << 1;

  assign Y[0] = w3;
  assign Y[1] = w12;
  assign Y[2] = w21;
  assign Y[3] = w30;
  assign Y[4] = w25;
  assign Y[5] = w16;

endmodule //MCM_7_9

