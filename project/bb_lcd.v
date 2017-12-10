// ispMACH 4256ZE Breakout Board (BB) with dumb LCD
// Status: only RESET LEDs implemented
module bb_lcd (led,nrst);
  output [7:0] led;
  input nrst;

  // clocks taken from Pico Dev board source (see i2c_peri_demo_revC1.v)
  wire osc_clk;  // clock 5MHz
  wire osc_sclk; // "slow clock" 5kHz
  reg [11:0] slow_clk; 

  assign rst = ~nrst; // positive RESET (active on logical 1)

  // remember: LED's are inverted (on when output is logical 0)
  assign led[0] = nrst;  // PIN 71, LED D1, ON when RESET 
  assign led[1] = ~nrst; // PIN 70, LED D2, ON when Not RESET
  assign led[7:4] = 4'b1111; // LED D5-D8, OFF

  defparam I1.TIMER_DIV = "1024";
  OSCTIMER I1 (.DYNOSCDIS(1'b0), .TIMERRES(1'b0), .OSCOUT(osc_clk), .TIMEROUT(osc_sclk));

  // taken from Pico Dev board source (see i2c_peri_demo_revC1.v)
  always @(posedge osc_sclk or posedge rst)
	if (rst)
		slow_clk <= 12'b0; // async reset
	else
		slow_clk <= slow_clk + 1; // synced by rising osc_sclk
		
  assign display_clk = slow_clk[5]; // 5000 / 2^5 = 5000 / 32 ~= 156 Hz for LCD display
  assign op_clk = slow_clk[11];	    // 5000 / 2^11 = 5000 / 2048 ~= 2.5 Hz for counting digits

  assign led[3] = ~op_clk; // positive op_clk
  assign led[2] = op_clk;  // negative op_clk


endmodule
