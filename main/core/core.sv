module core(
  // Clock and reset ins
  input logic clk,
  input logic rstn,
  // instructions
  output logic [15:0] imemaddr,
  input logic [15:0] instr,
  // iws plus periph
  output logic [15:0] iwsreg,
  output logic iwswe
);
  logic [3:0] regs [0:3];
  always_ff @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
    end
  end
endmodule
