/*
   This file was generated automatically by the Mojo IDE version B1.3.5.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module alu_14 (
    input [5:0] alufn,
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] alu,
    output reg z,
    output reg v,
    output reg n
  );
  
  
  
  wire [8-1:0] M_compare_cmp;
  reg [6-1:0] M_compare_alufn;
  reg [1-1:0] M_compare_z;
  reg [1-1:0] M_compare_v;
  reg [1-1:0] M_compare_n;
  compare_25 compare (
    .alufn(M_compare_alufn),
    .z(M_compare_z),
    .v(M_compare_v),
    .n(M_compare_n),
    .cmp(M_compare_cmp)
  );
  
  wire [8-1:0] M_boolean_bool;
  reg [8-1:0] M_boolean_a;
  reg [8-1:0] M_boolean_b;
  reg [6-1:0] M_boolean_alufn;
  boolean_26 boolean (
    .a(M_boolean_a),
    .b(M_boolean_b),
    .alufn(M_boolean_alufn),
    .bool(M_boolean_bool)
  );
  
  wire [8-1:0] M_shift_out;
  reg [8-1:0] M_shift_a;
  reg [8-1:0] M_shift_b;
  reg [6-1:0] M_shift_alufn;
  shifter_27 shift (
    .a(M_shift_a),
    .b(M_shift_b),
    .alufn(M_shift_alufn),
    .out(M_shift_out)
  );
  
  wire [8-1:0] M_add_sum1;
  wire [1-1:0] M_add_z;
  wire [1-1:0] M_add_v;
  wire [1-1:0] M_add_n;
  reg [8-1:0] M_add_alufn;
  reg [8-1:0] M_add_a;
  reg [8-1:0] M_add_b;
  adder_28 add (
    .alufn(M_add_alufn),
    .a(M_add_a),
    .b(M_add_b),
    .sum1(M_add_sum1),
    .z(M_add_z),
    .v(M_add_v),
    .n(M_add_n)
  );
  
  always @* begin
    M_add_a = a;
    M_add_b = b;
    M_add_alufn = alufn;
    M_compare_alufn = alufn;
    M_compare_v = M_add_v;
    M_compare_n = M_add_n;
    M_compare_z = M_add_z;
    M_boolean_a = a;
    M_boolean_b = b;
    M_boolean_alufn = alufn;
    M_shift_a = a;
    M_shift_b = b;
    M_shift_alufn = alufn;
    
    case (alufn[4+1-:2])
      2'h0: begin
        alu = M_add_sum1;
      end
      2'h1: begin
        alu = M_boolean_bool;
      end
      2'h2: begin
        alu = M_shift_out;
      end
      2'h3: begin
        alu = M_compare_cmp;
      end
      default: begin
        alu = 8'h00;
      end
    endcase
    v = M_add_v;
    n = M_add_n;
    z = M_add_z;
  end
endmodule
