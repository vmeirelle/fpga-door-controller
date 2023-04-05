//Lock Controller Module
//This module implements a simple lock controller that requires the user to enter a two-digit access code to unlock the system.
//The user inputs the access code serially using two input bits (a and b) and a dedicated enter signal. 
//If the correct access code is entered, the system outputs a signal (out) to unlock the door. 
//If the access code is incorrect, the system sets an error signal (err). 
//The system can be reset at any time using a dedicated reset signal (rst).
// This code was developed by @vmeirelle for educational purposes.
// Feel free to use and modify this code for your own projects. If you found this code helpful, please consider giving credit to the original author.


module controller ( input clk, rst, a, b, enter, output out, output err, output reg [2:0] out_e);
  
 //Definition of possible states
  localparam [2:0] S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100;

  //Definition of registers for current state and next state
  reg [2:0] curr;
  reg [2:0] next;
  

  //Logic for the next state
  always @ (*) begin
    	 if (curr==S0) 
           next = {a,b}==2'b01 ? S3 : S1;
    else if (curr==S1)
  		 next = S2;
    else if (curr==S2)
    	next = S2; 
    else if (curr==S3)
      next = {a,b}==2'b11 ? S4 : S2;
    else if (curr==S4)
   		next = S0; 
  end
  
  //Update of the current state
  always @ (posedge clk or posedge rst) begin
    if (rst)
      curr <= S0;
    else if(enter) 
      curr <= next; 
  end

  //Combinational logic for output signals
  assign out = curr==S4 ? 1 : 0;  
  assign err = curr==S2 ? 1 : 0;  
  
  
 //Output of the current state (used for visualization purposes)
  always @ (curr) begin  
    case(curr)  
      S0    : out_e = 0;      
      S1    : out_e = 1;
      S2    : out_e = 2;
      S3    : out_e = 3;
      S4    : out_e = 4;      
    endcase  
  end  

endmodule
