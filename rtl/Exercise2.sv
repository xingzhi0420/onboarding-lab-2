/**
  @brief A fibonacci linear feedback shift register module

  @input clk    clock
  @input nReset active-low reset
  @input init   initial value following a reset
  @output out   current output
*/
module Exercise2 (
    input clk,
    input nReset,
    input [15:0] init,
    output logic [15:0] out
);
reg [15:0] state;
always @(posedge clk) begin
  if(~nReset) begin
    state <= init;
  end else begin
    state<={state[14:0],state[15] ^ state[13] ^ state[12] ^ state[10]};
  end
end
assign out=state;
endmodule
