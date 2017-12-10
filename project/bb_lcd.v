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

  // counter for the 1st digit
  wire [3:0] cnta;
  BB_DEC_CNT cnt10a( .dout( cnta ), .clk( op_clk ), .rst ( rst ) );
  assign led[7:4] = ~cnta;

endmodule

// BB_DEC_CNT - simple decimal (0-9) counter
module BB_DEC_CNT(dout, clk, rst);
 output [3:0] dout; // output, binary counter data: 0 to 9
 input  clk;       // clock to increment counter
 input  rst;       // asynchronous reset to 0

 reg [3:0] dout; // data output is register variable

 always @(posedge clk or posedge rst)
 begin
   if ( rst ) 
     dout <= 4'd0;
   else
   begin
     if ( dout == 9 )
       dout <= 4'd0;
     else
       dout <= dout + 1;
   end
 end
endmodule

// BB_BC_TO_SEG7 -  decored from 4-bit BCD number (0-9) to 7-bits 7segment digit
// Digits in segout[6:0]:
//             bit 0
//           ---------
//          |         |
//    bit 5 |         | bit 1
//          |  bit 6  |
//           ---------
//          |         |
//    bit 4 |         | bit 2
//          |  bit 3  |
//           ---------
//

module BB_BCD_TO_SEG7(segout,bcdin);
 output [6:0] segout;
 input  [3:0] bcdin;

 reg [6:0] segout;

 always @( bcdin )
 begin
  case ( bcdin )
    4'b0000: segout = 7'b0111111; // 0
    4'b0001: segout = 7'b0000110; // 1
    4'b0010: segout = 7'b1011011; // 2
    4'b0011: segout = 7'b1001111; // 3
    4'b0100: segout = 7'b1100110; // 4
    4'b0101: segout = 7'b1101101; // 5
    4'b0110: segout = 7'b1111101; // 6
    4'b0111: segout = 7'b0000111; // 7
    4'b1000: segout = 7'b1111111; // 8
    4'b1001: segout = 7'b1101111; // 9
    default: segout = 7'b0111001; // E (as error)
  endcase
 end
endmodule

