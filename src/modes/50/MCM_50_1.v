/*------------------------------------------------------------------------------
 * This code was generated by Spiral Multiplier Block Generator, www.spiral.net
 * Copyright (c) 2006, Carnegie Mellon University
 * All rights reserved.
 * The code is distributed under a BSD style license
 * (see http://www.opensource.org/licenses/bsd-license.php)
 *------------------------------------------------------------------------------ */

module MCM_50_1 (
    X,
    Y
);

  // Port mode declarations:
  input  unsigned  [7:0] X;
  output signed  [15:0] Y;

  //Multipliers:

  wire signed [15:0]
    w1,
    w64;

  assign w1 = X;
  assign w64 = w1 << 6;

  assign Y = w64;

endmodule //MCM_50_1

