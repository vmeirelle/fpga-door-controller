// Testbench for the controller module

module controller_tb();

  // Inputs and outputs
  reg clk = 0;
  reg rst = 0;
  reg enter;
  reg [1:0] ab;
  wire out, err;
  wire [2:0] curr;
  
  // Instantiate the controller module
  controller dut (.clk(clk),.rst(rst), .a(ab[1]), .b(ab[0]), .enter(enter), .out(out), .out_e(curr), .err(err));
  
  // Generate clock signal
  always #5 clk = ~clk;
  
  // Test cases
  initial begin
    
    // Test case 1 - Sucess
    rst = 1; #10 rst = 0;		//RST
    ab = 2'b01; enter = 1; #10 		//KEY1
    enter = 0; #10			//RELEASE ENTER
    ab = 2'b11; enter = 1; 		//KEY2
    #10 enter = 0; #10
    $display("Test case 1: a2:%d, b2:%d, out:%d, clk:%d, rst:%d, curr:%d, err:%d", ab[1], ab[0], out, clk, rst, curr, err);
    
    // Test case 2 - Failing in password 1
    rst = 1; #10 rst = 0;		//RST
    ab = 2'b00; enter = 1; #10 		//KEY1
    enter = 0; #10			//RELEASE ENTER
    ab = 2'b11; enter = 1; 		//KEY2
    #10 enter = 0; #10
    $display("Test case 2: a2:%d, b2:%d, out:%d, clk:%d, rst:%d, curr:%d, err:%d", ab[1], ab[0], out, clk, rst, curr, err);
    
    // Test case 3 - Failing in password 2
    rst = 1; #10 rst = 0;		//RST
    ab = 2'b01; enter = 1; #10 		//KEY1
    enter = 0; #10			//RELEASE ENTER
    ab = 2'b00; enter = 1; 		//KEY2
    #10 enter = 0; #10			
    $display("Test case 3: a2:%d, b2:%d, out:%d, clk:%d, rst:%d, curr:%d, err:%d", ab[1], ab[0], out, clk, rst, curr, err);
    
    // Test case 4 - Keep failing 3 times
    rst = 1; #10 rst = 0;		//RST
    ab = 2'b01; enter = 1; #10 		//KEY1
    enter = 0; #10			//RELEASE ENTER
    ab = 2'b01; enter = 1; 		//KEY2	
    #10 enter = 0; #10			//RELEASE ENTER
    ab = 2'b11; enter = 1; 		//KEY3
    #10 enter = 0; #10
    $display("Test case 4: a2:%d, b2:%d, out:%d, clk:%d, rst:%d, curr:%d, err:%d", ab[1], ab[0], out, clk, rst, curr, err);
    
    // Test case 5 - Sucess
    rst = 1; #10 rst = 0;		//RST
    ab = 2'b01; enter = 1; #10 		//KEY1
    enter = 0; #10			//RELEASE ENTER
    ab = 2'b11; enter = 1; 		//KEY2
    #10 enter = 0; #10			
    $display("Test case 5: a2:%d, b2:%d, out:%d, clk:%d, rst:%d, curr:%d, err:%d", ab[1], ab[0], out, clk, rst, curr, err);
    
  end
  
endmodule
