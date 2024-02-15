module b2ss(
	input [4:0] mo,
	output reg [6:0] ssi
);

	reg [6:0] seg_arr [31:0];
	
	initial begin
		seg_arr[0]  = 7'h3F; //0111111
		seg_arr[1]  = 7'h06; //0000110
		seg_arr[2]  = 7'h5B; //1011011
		seg_arr[3]  = 7'h4F; //1001111
		seg_arr[4]  = 7'h66; //1100110
		seg_arr[5]  = 7'h6D; //1101101
		seg_arr[6]  = 7'h7D; //1111101
		seg_arr[7]  = 7'h07; //0000111
		seg_arr[8]  = 7'h7F; //1111111
		seg_arr[9]  = 7'h6F; //1101111
		
		seg_arr[10] = 7'h77; //1110111
		seg_arr[11] = 7'h7C; //1111100
		seg_arr[12] = 7'h39; //0111001
		seg_arr[13] = 7'h5E; //1011110
		seg_arr[14] = 7'h79; //1111001
		seg_arr[15] = 7'h71; //1110001
		
		//H
		seg_arr[16] = 7'h76; //1110110
		//П
		seg_arr[17] = 7'h37; //0110111
		//U
		seg_arr[18] = 7'h3E; //0111110
		//n
		seg_arr[19] = 7'h54; //1010100
		//Г
		seg_arr[20] = 7'h31; //0110001
		//Р
		seg_arr[21] = 7'h73; //1110011 
		//L
		seg_arr[22] = 7'h38; //0111000
		//G
		seg_arr[23] = 7'h3D; //0111101
		//Y
		seg_arr[24] = 7'h6E; //1101110
		//space
		seg_arr[30] = 7'h00;
	end
	always @*
		ssi = seg_arr[mo];
endmodule