`timescale 1ns / 1ps


module Test_sequencegenerator;
       // Inputs
       reg clk;
       reg reset;
       // Outputs
       wire s3;

 // Instantiate the  Sequence Generator Test (SGT)

sequencegenerator SGT (.clk(clk), .reset(reset), .s3(s3));


 initial begin


  $dumpfile("Sequence.vcd");
	$dumpvars;

  // Initialize Inputs
  clk = 0;
  reset = 0;

  // Wait 100 ns for global reset to finish
  //#100;

  // Add stimulus here
  #10 reset = 1;
  #10 reset = 0;
  #200 $finish;
 end

 always begin
  #5 clk = ~clk;
 end

 //PRINT SEQUENCE
  always @ (posedge clk)
  $write("%b ",s3);    
endmodule 
