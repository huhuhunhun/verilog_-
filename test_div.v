`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/08/06 22:53:28
// Design Name: 
// Module Name: test_div
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module test_div(
    input clk,
    input rst_n,
    output clk_out
    );
  parameter N=62;
  reg[31:0] cnt1;
  reg clk_p;
  reg clk_n;
  always@(posedge clk or posedge rst_n)
  begin    
    if(!rst_n)
        cnt1<=0;
    else if(cnt1==2*N)
        cnt1<=0;
    else
        cnt1<=cnt1+1;
   end
always@(posedge clk or posedge rst_n)
begin
    if(!rst_n)
        clk_p<=0;
    else if(cnt1==2*N) clk_p<=1;
    else if(cnt1==N) clk_p<=0;
 end
 
 always@(negedge clk or posedge rst_n)
 begin
    if(!rst_n)  clk_n<=0;
    else if(cnt1==0) clk_n<=0;
    else if(cnt1==N) clk_n<=1;
  end
  
  assign clk_out=clk_p&clk_n;
    
endmodule
