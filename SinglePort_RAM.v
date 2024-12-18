module single_port_ram(
  input [7:0] data, // input data
  input [5:0] addr, // address
  input we,         // write enable
  input clk,        // clock
  output [7:0] q    // output data
);
  
  reg [7:0] ram [63:0];  // 8x64 bit RAM
  reg [5:0] addr_reg;    // address register
 
  always @(posedge clk) begin
    if (we)
      ram[addr] <= data; // Write data to RAM
    else
      addr_reg <= addr;  // Capture address
  end
 
  assign q = ram[addr_reg]; // Output data from RAM
  
endmodule
