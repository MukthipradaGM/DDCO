module seq_gen(input wire load, clk, output wire [3:0] out);
tff g1(clk,out[0],1,out[0]);
tff g2(clk,out[1],1,out[1]);
tff g3(clk,out[2],1,out[2]);
tff g4(clk,out[3],1,out[3]);
endmodule

module sequencegenerator(input clk, reset,output s3);
 
     reg s1, s2, s3;
     wire s0;
 
     assign s0 = s1 ^ s3;
     //using bitwise exclusive exclusive or to finding the value of s0

     // STATE MACHINE
     always @ (posedge clk or reset)

     begin 
          // INITIAL STATE SHOULDN'T BE 000 => 100
          //here 000 initial input leads to sequence of 000...
          //so depending on the input here we can generate the 
          //required sequence that we wanted
          //here input is 100


          if(reset) begin//@beginning the input should be 100
               s1 <= 1;
               s2 <= 0;
               s3 <= 0;
          end 
          else begin   //else moving the sequence 
               s1 <= s0;
               s2 <= s1;
               s3 <= s2;
          end
     end
     //returing the output s3 every time

endmodule 