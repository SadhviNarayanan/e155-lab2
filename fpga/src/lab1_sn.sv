// E155, Lab 1 Code to control led's and connect to a seven segment display

// Name: Sadhvi Narayanan
// Email: sanarayanan@g.hmc.edu
// Date: 08/27/2025


// top level module to initialize the led's including the 2.4Hz one, and instantiate the seven segment display module
module lab1_sn(
	 input logic reset,
	 input logic [3:0] s,
	 output logic [2:0] led,
	 output logic [6:0] seg
);

   logic int_osc;
   logic [23:0] counter;
   logic led_signal;
   logic [3:0] s_bar;
   
   assign s_bar = ~s;
  
  // led [1:0] assignments
   assign led[0] = s_bar[1] ^ s_bar[0];
   assign led[1] = s_bar[3] & s_bar[2];
   
   // Internal high-speed oscillator
   HSOSC #(.CLKHF_DIV(2'b01)) 
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
  
   // Counter
   always_ff @(posedge int_osc, negedge reset) begin
     if(reset == 0) begin
		 counter <= 0;
		 led_signal <= 0;
     end else if (counter == 5000000) begin
		 counter <= 0;
		 led_signal <= ~led_signal;
	end else begin
		counter <= counter + 1;
	end
   end
  
   // Assign led[2] output
   assign led[2] = led_signal;
   
   seven_segment seven_segment_decoder(s_bar, seg);
  
endmodule
