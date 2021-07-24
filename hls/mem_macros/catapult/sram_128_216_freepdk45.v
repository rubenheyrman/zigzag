// OpenRAM SRAM model
// Words: 216
// Word size: 128

module sram_128_216_freepdk45(
// Port 0: RW
    clk0,csb0,web0,addr0,din0,dout0,
// Port 1: RW
    clk1,csb1,web1,addr1,din1,dout1
  );

  parameter DATA_WIDTH = 128 ;
  parameter ADDR_WIDTH = 8 ;
  parameter RAM_DEPTH = 1 << ADDR_WIDTH;
  // FIXME: This delay is arbitrary.
  parameter DELAY = 3 ;

  reg [DATA_WIDTH-1:0]    mem [0:RAM_DEPTH-1];

  input  clk0; // clock
  input   csb0; // active low chip select
  input  web0; // active low write control
  input [ADDR_WIDTH-1:0]  addr0;
  input [DATA_WIDTH-1:0]  din0;
  output [DATA_WIDTH-1:0] dout0;
  input  clk1; // clock
  input   csb1; // active low chip select
  input  web1; // active low write control
  input [ADDR_WIDTH-1:0]  addr1;
  input [DATA_WIDTH-1:0]  din1;
  output [DATA_WIDTH-1:0] dout1;

  reg  csb0_reg;
  reg  web0_reg;
  reg [ADDR_WIDTH-1:0]  addr0_reg;
  reg [DATA_WIDTH-1:0]  din0_reg;
  reg [DATA_WIDTH-1:0]  dout0;

  // All inputs are registers
  always @(posedge clk0)
  begin
    csb0_reg = csb0;
    web0_reg = web0;
    addr0_reg = addr0;
    if (!csb1 && !web1 && !csb0 && web0 && (addr1 == addr0))
         $display($time," WARNING: Writing and reading addr1=%b and addr0=%b simultaneously!",addr1,addr0);
    din0_reg = din0;
    dout0 = 128'bx;
    if ( !csb0_reg && web0_reg ) 
      $display($time," Reading %m addr0=%b dout0=%b",addr0_reg,mem[addr0_reg]);
    if ( !csb0_reg && !web0_reg )
      $display($time," Writing %m addr0=%b din0=%b",addr0_reg,din0_reg);
  end

  reg  csb1_reg;
  reg  web1_reg;
  reg [ADDR_WIDTH-1:0]  addr1_reg;
  reg [DATA_WIDTH-1:0]  din1_reg;
  reg [DATA_WIDTH-1:0]  dout1;

  // All inputs are registers
  always @(posedge clk1)
  begin
    csb1_reg = csb1;
    web1_reg = web1;
    addr1_reg = addr1;
    if (!csb0 && !web0 && !csb1 && web1 && (addr0 == addr1))
         $display($time," WARNING: Writing and reading addr0=%b and addr1=%b simultaneously!",addr0,addr1);
    din1_reg = din1;
    dout1 = 128'bx;
    if ( !csb1_reg && web1_reg ) 
      $display($time," Reading %m addr1=%b dout1=%b",addr1_reg,mem[addr1_reg]);
    if ( !csb1_reg && !web1_reg )
      $display($time," Writing %m addr1=%b din1=%b",addr1_reg,din1_reg);
  end

  // Memory Write Block Port 0
  // Write Operation : When web0 = 0, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_WRITE0
    if ( !csb0_reg && !web0_reg )
        mem[addr0_reg] = din0_reg;
  end

  // Memory Read Block Port 0
  // Read Operation : When web0 = 1, csb0 = 0
  always @ (negedge clk0)
  begin : MEM_READ0
    if (!csb0_reg && web0_reg)
       dout0 <= #(DELAY) mem[addr0_reg];
  end

  // Memory Write Block Port 1
  // Write Operation : When web1 = 0, csb1 = 0
  always @ (negedge clk1)
  begin : MEM_WRITE1
    if ( !csb1_reg && !web1_reg )
        mem[addr1_reg] = din1_reg;
  end

  // Memory Read Block Port 1
  // Read Operation : When web1 = 1, csb1 = 0
  always @ (negedge clk1)
  begin : MEM_READ1
    if (!csb1_reg && web1_reg)
       dout1 <= #(DELAY) mem[addr1_reg];
  end

endmodule
