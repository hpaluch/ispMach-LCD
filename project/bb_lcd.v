// ispMACH 4256ZE Breakout Board (BB) with dumb LCD
// Status: only RESET LEDs implemented
module bb_lcd (led,nrst);
  output [7:0] led;
  input nrst;

  // remember: LED's are inverted (on when output is logical 0)
  assign led[0] = nrst;  // PIN 71, LED D1, ON when RESET 
  assign led[1] = ~nrst; // PIN 70, LED D2, ON when Not RESET
  assign led[7:2] = 6'b111111; // LED D3-D8, OFF

endmodule