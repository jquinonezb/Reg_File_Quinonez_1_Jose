module Register_File_TB;
parameter N_tb = 32;
reg clk_tb = 0;
reg reset_tb;
reg RegWrite_tb;
reg [4:0] Write_Register_tb;
reg [4:0] Read_Register_1_tb;
reg [4:0] Read_Register_2_tb;
reg [N_tb-1:0] Write_Data_tb;
wire [N_tb-1:0] Read_Data_1_tb;
wire [N_tb-1:0] Read_Data_2_tb;
  
  
Register_File UUT
(
	.clk(clk_tb),
	.reset(reset_tb),
	.Reg_Write_i(RegWrite_tb),
	.Write_Register_i(Write_Register_tb),
	.Read_Register_1_i(Read_Register_1_tb),
	.Read_Register_2_i(Read_Register_2_tb),
	.Write_Data_i(Write_Data_tb),
	.Read_Data_1_i(Read_Data_1_tb),
	.Read_Data_2_i(Read_Data_2_tb)

);
/*********************************************************/
initial // Clock generator
  begin
    forever #2 clk_tb = !clk_tb;
  end
/*********************************************************/
initial begin // reset generator
	#0 reset_tb = 0;
	#5 reset_tb = 1;
end
initial begin
	#0 RegWrite_tb = 0;
	#5 RegWrite_tb = 1;
	#30 RegWrite_tb = 0;
	#25 RegWrite_tb = 1;
end


initial begin
	#0 Read_Register_1_tb = 0;
	#4 Read_Register_1_tb = 0;
	#25 Read_Register_1_tb = 1;
	#60 Read_Register_1_tb = 3;
	#30 Read_Register_1_tb = 10;
	#30 Read_Register_1_tb = 12;

end


initial begin
	#0 Read_Register_2_tb = 0;
	#4 Read_Register_2_tb = 0;
	#60 Read_Register_2_tb = 2;
	#50 Read_Register_2_tb = 4;
	#30 Read_Register_2_tb = 1;
	#30 Read_Register_2_tb = 3;

end

initial begin
	#0 Write_Register_tb = 0;
	#4 Write_Register_tb = 0;
	#50 Write_Register_tb = 1;
	#25 Write_Register_tb = 2;
	#25 Write_Register_tb = 3;
	#25 Write_Register_tb = 4;

end
initial begin // reset generator
	#0 Write_Data_tb = 3;
	#4 Write_Data_tb = 3;
	#50 Write_Data_tb = 5;
	#25 Write_Data_tb = 15;
	#25 Write_Data_tb = 25;
	#25 Write_Data_tb = 50;
end

endmodule

