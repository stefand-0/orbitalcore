#mdodule core(
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
  typedef enum logic [1:0] {
    FETCH = 2'b00,
    EXECUTE = 2'b01,
    IDLE = 2'b10
} state_t;
  state_t state;
  always_ff @ (posedge clk or negedge rstn) begin
    if (!rstn) begin
      state <= FETCH;
      iwsreg <= 4'h0;
      iwswe <= 1'b0;
      for(int i = 0; i < 4; i++) begin
        regs[i] <= 4'h0;  
      end     
    end else begin
      case (state)
        FETCH: begin
          state <= EXECUTE;
        end
        EXECUTE: begin
          state <= FETCH; 
        end
        default: state <= FETCH;
      endcase
    end
  end
endmodule
