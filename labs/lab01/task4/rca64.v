// rca64.v
// A plain 64-bit ripple-carry adder.

module rca64(

  input  [63:0] a,
  input  [63:0] b,
  input         cin,
  output [63:0] sum,
  output        cout

);

  // c[i] is the carry going INTO bit i.
  // c[0] = cin
  // c[64] = final carry-out

  wire [64:0] c;

  assign c[0] = cin;

  genvar i;

  generate
    for (i = 0; i < 64; i = i + 1) begin : gen_fa

      FA_Gate FA (
        .a(a[i]),
        .b(b[i]),
        .cin(c[i]),
        .sum(sum[i]),
        .cout(c[i+1])
      );

    end
  endgenerate

  assign cout = c[64];

endmodule
