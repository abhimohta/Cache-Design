module D_FF(input clk, input reset, input write, input d, output reg q);
	always @(negedge clk)
	begin
		if(reset==1) q=0; 
		else if(write==1) q=d;
	end
endmodule

//24 bit reg for tag array
module reg24bit(input clk, input reset, input we, input [23:0] d, output [23:0] q);
	D_FF td0 (clk, reset, we, d[0], q[0]);
	D_FF td1 (clk, reset, we, d[1], q[1]);
	D_FF td2 (clk, reset, we, d[2], q[2]);
	D_FF td3 (clk, reset, we, d[3], q[3]);
	D_FF td4 (clk, reset, we, d[4], q[4]);
	D_FF td5 (clk, reset, we, d[5], q[5]);
	D_FF td6 (clk, reset, we, d[6], q[6]);
	D_FF td7 (clk, reset, we, d[7], q[7]);
	D_FF td8 (clk, reset, we, d[8], q[8]);
	D_FF td9 (clk, reset, we, d[9], q[9]);
	D_FF td10 (clk, reset, we, d[10], q[10]);
	D_FF td11 (clk, reset, we, d[11], q[11]);
	D_FF td12 (clk, reset, we, d[12], q[12]);
	D_FF td13 (clk, reset, we, d[13], q[13]);
	D_FF td14 (clk, reset, we, d[14], q[14]);
	D_FF td15 (clk, reset, we, d[15], q[15]);
	D_FF td16 (clk, reset, we, d[16], q[16]);
	D_FF td17 (clk, reset, we, d[17], q[17]);
	D_FF td18 (clk, reset, we, d[18], q[18]);
	D_FF td19 (clk, reset, we, d[19], q[19]);
	D_FF td20 (clk, reset, we, d[20], q[20]);
	D_FF td21 (clk, reset, we, d[21], q[21]);
	D_FF td22 (clk, reset, we, d[22], q[22]);
	D_FF td23 (clk, reset, we, d[23], q[23]);
endmodule

//TAG Array
module regfile24(input clk, input reset, input write, input [3:0] index,  input [23:0] tagIn, output [23:0] tagOut);
	wire [15:0] we;
	wire[23:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15;
	
	decoder4to16 dectag(index, we);
	
	reg24bit tr0 (clk, reset, we[0]&write, tagIn, out0);
	reg24bit tr1 (clk, reset, we[1]&write, tagIn, out1);
	reg24bit tr2 (clk, reset, we[2]&write, tagIn, out2);
	reg24bit tr3 (clk, reset, we[3]&write, tagIn, out3);
	reg24bit tr4 (clk, reset, we[4]&write, tagIn, out4);
	reg24bit tr5 (clk, reset, we[5]&write, tagIn, out5);
	reg24bit tr6 (clk, reset, we[6]&write, tagIn, out6);
	reg24bit tr7 (clk, reset, we[7]&write, tagIn, out7);
	reg24bit tr8 (clk, reset, we[8]&write, tagIn, out8);
	reg24bit tr9 (clk, reset, we[9]&write, tagIn, out9);
	reg24bit tr10 (clk, reset, we[10]&write, tagIn, out10);
	reg24bit tr11 (clk, reset, we[11]&write, tagIn, out11);
	reg24bit tr12 (clk, reset, we[12]&write, tagIn, out12);
	reg24bit tr13 (clk, reset, we[13]&write, tagIn, out13);
	reg24bit tr14 (clk, reset, we[14]&write, tagIn, out14);
	reg24bit tr15 (clk, reset, we[15]&write, tagIn, out15);
	mux16to1_24bits muxtag (out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, index, tagOut);
endmodule

//data byte in a data block
module reg8bit(input clk, input reset, input we, input [7:0] d, output [7:0] q);
	D_FF dd0 (clk, reset, we, d[0], q[0]);
	D_FF dd1 (clk, reset, we, d[1], q[1]);
	D_FF t8d2 (clk, reset, we, d[2], q[2]);
	D_FF t8d3 (clk, reset, we, d[3], q[3]);
	D_FF t8d4 (clk, reset, we, d[4], q[4]);
	D_FF t8d5 (clk, reset, we, d[5], q[5]);
	D_FF t8d6 (clk, reset, we, d[6], q[6]);
	D_FF t8d7 (clk, reset, we, d[7], q[7]);
endmodule

//128 bit reg for data array (16bytes) output's one byte according to the offset
module reg128bit(input clk, input reset, input write, input [3:0] offset, input [127:0] d, output [7:0] q);
	wire [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15;
	reg8bit t8r0 (clk, reset, write, d[7:0], out0);
	reg8bit t8r1 (clk, reset, write, d[15:8], out1);
	reg8bit t8r2 (clk, reset, write, d[23:16], out2);
	reg8bit t8r3 (clk, reset, write, d[31:24], out3);
	reg8bit t8r4 (clk, reset, write, d[39:32], out4);
	reg8bit t8r5 (clk, reset, write, d[47:40], out5);
	reg8bit t8r6 (clk, reset, write, d[55:48], out6);
	reg8bit t8r7 (clk, reset, write, d[63:56], out7);
	reg8bit t8r8 (clk, reset, write, d[71:64], out8);
	reg8bit t8r9 (clk, reset, write, d[79:72], out9);
	reg8bit t8r10 (clk, reset, write, d[87:80], out10);
	reg8bit t8r11 (clk, reset, write, d[95:88], out11);
	reg8bit t8r12 (clk, reset, write, d[103:96], out12);
	reg8bit t8r13 (clk, reset, write, d[111:104], out13);
	reg8bit t8r14 (clk, reset, write, d[119:112], out14);
	reg8bit t8r15 (clk, reset, write, d[127:120], out15);
	mux16to1_8bit mux1(out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, offset, q);
endmodule

//Array of data blocks
module regfile128(input clk, input reset, input write, input [3:0] index, input [3:0] offset, input [127:0] dataIn, output [7:0] dataOut);
	wire [15:0] we;
	wire [7:0] out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15;
	decoder4to16 dec128tag (index, we);
	reg128bit d128r0 (clk, reset, we[0]&write, offset, dataIn, out0);
	reg128bit d128r1 (clk, reset, we[1]&write, offset, dataIn, out1);
	reg128bit d128r2 (clk, reset, we[2]&write, offset, dataIn, out2);
	reg128bit d128r3 (clk, reset, we[3]&write, offset, dataIn, out3);
	reg128bit d128r4 (clk, reset, we[4]&write, offset, dataIn, out4);
	reg128bit d128r5 (clk, reset, we[5]&write, offset, dataIn, out5);
	reg128bit d128r6 (clk, reset, we[6]&write, offset, dataIn, out6);
	reg128bit d128r7 (clk, reset, we[7]&write, offset, dataIn, out7);
	reg128bit d128r8 (clk, reset, we[8]&write, offset, dataIn, out8);
	reg128bit d128r9 (clk, reset, we[9]&write, offset, dataIn, out9);
	reg128bit d128r10 (clk, reset, we[10]&write, offset,dataIn,  out10);
	reg128bit d128r11 (clk, reset, we[11]&write, offset, dataIn, out11);
	reg128bit d128r12 (clk, reset, we[12]&write, offset, dataIn, out12);
	reg128bit d128r13 (clk, reset, we[13]&write, offset, dataIn, out13);
	reg128bit d128r14 (clk, reset, we[14]&write, offset, dataIn, out14);
	reg128bit d128r15 (clk, reset, we[15]&write, offset, dataIn, out15);
	
	mux16to1_8bit datamux (out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, index, dataOut);
endmodule

//Creating a 16 bit valid Array
module validArray(input clk, input reset, input [3:0] index, input write, input validBit, output validOut1);
	wire [15:0] validOut;
	wire [15:0] we;
	decoder4to16 dec128tag (index, we);
	D_FF v0(clk, reset, we[0] & write, validBit, validOut[0]);
	D_FF v1(clk, reset, we[1] & write, validBit, validOut[1]);
	D_FF v2(clk, reset, we[2] & write, validBit, validOut[2]);
	D_FF v3(clk, reset, we[3] & write, validBit, validOut[3]);
	D_FF v4(clk, reset, we[4] & write, validBit, validOut[4]);
	D_FF v5(clk, reset, we[5] & write, validBit, validOut[5]);
	D_FF v6(clk, reset, we[6] & write, validBit, validOut[6]);
	D_FF v7(clk, reset, we[7] & write, validBit, validOut[7]);
	D_FF v8(clk, reset, we[8] & write, validBit, validOut[8]);
	D_FF v9(clk, reset, we[9] & write, validBit, validOut[9]);
	D_FF v10(clk, reset, we[10] & write, validBit, validOut[10]);
	D_FF v11(clk, reset, we[11] & write, validBit, validOut[11]);
	D_FF v12(clk, reset, we[12] & write, validBit, validOut[12]);
	D_FF v13(clk, reset, we[13] & write, validBit, validOut[13]);
	D_FF v14(clk, reset, we[14] & write, validBit, validOut[14]);
	D_FF v15(clk, reset, we[15] & write, validBit, validOut[15]);
	mux16to1_1bit validbitmux(validOut[0],validOut[1],validOut[2],validOut[3],validOut[4],validOut[5],validOut[6],validOut[7],validOut[8],validOut[9],validOut[10],validOut[11],validOut[12],validOut[13],validOut[14],validOut[15],index,validOut1);
endmodule

module mruArray(input clk, input reset, input [3:0] index, input write, input mruIn, output mruOut);
	wire [15:0] mruOut1;
	wire [15:0] we;
	decoder4to16 mrudec(index, we);
	D_FF v0(clk, reset, we[0] & write, mruIn, mruOut1[0]);
	D_FF v1(clk, reset, we[1] & write, mruIn, mruOut1[1]);
	D_FF v2(clk, reset, we[2] & write, mruIn, mruOut1[2]);
	D_FF v3(clk, reset, we[3] & write, mruIn, mruOut1[3]);
	D_FF v4(clk, reset, we[4] & write, mruIn, mruOut1[4]);
	D_FF v5(clk, reset, we[5] & write, mruIn, mruOut1[5]);
	D_FF v6(clk, reset, we[6] & write, mruIn, mruOut1[6]);
	D_FF v7(clk, reset, we[7] & write, mruIn, mruOut1[7]);
	D_FF v8(clk, reset, we[8] & write, mruIn, mruOut1[8]);
	D_FF v9(clk, reset, we[9] & write, mruIn, mruOut1[9]);
	D_FF v10(clk, reset, we[10] & write, mruIn, mruOut1[10]);
	D_FF v11(clk, reset, we[11] & write, mruIn, mruOut1[11]);
	D_FF v12(clk, reset, we[12] & write, mruIn, mruOut1[12]);
	D_FF v13(clk, reset, we[13] & write, mruIn, mruOut1[13]);
	D_FF v14(clk, reset, we[14] & write, mruIn, mruOut1[14]);
	D_FF v15(clk, reset, we[15] & write, mruIn, mruOut1[15]);
	mux16to1_1bit mrumux(mruOut1[0],mruOut1[1],mruOut1[2],mruOut1[3],mruOut1[4],mruOut1[5],mruOut1[6],mruOut1[7],mruOut1[8],mruOut1[9],mruOut1[10],mruOut1[11],mruOut1[12],mruOut1[13],mruOut1[14],mruOut1[15],index,mruOut);
endmodule


module decoder4to16( input [3:0] destReg, output reg [15:0] decOut);
	always @ (destReg)
	begin
	case(destReg)
	4'b0000: decOut=16'b0000000000000001;
	4'b0001: decOut=16'b0000000000000010;
	4'b0010: decOut=16'b0000000000000100;
	4'b0011: decOut=16'b0000000000001000;
	4'b0100: decOut=16'b0000000000010000;
	4'b0101: decOut=16'b0000000000100000;
	4'b0110: decOut=16'b0000000001000000;
	4'b0111: decOut=16'b0000000010000000;
	4'b1000: decOut=16'b0000000100000000;
	4'b1001: decOut=16'b0000001000000000;
	4'b1010: decOut=16'b0000010000000000;
	4'b1011: decOut=16'b0000100000000000;
	4'b1100: decOut=16'b0001000000000000;
	4'b1101: decOut=16'b0010000000000000;
	4'b1110: decOut=16'b0100000000000000;
	4'b1111: decOut=16'b1000000000000000;
	endcase
	end
endmodule

module mru(input clk, input reset, input mrubit, input [3:0] index, input hitIn, input [1:0] loopIn, output reg tagOneOut, output reg tagTwoOut, output reg mruOut);

	reg mruTemp;
	always @ (loopIn)
	begin
		mruOut=mrubit;
		mruTemp=mrubit;
		tagOneOut=0;
		tagTwoOut=0;
		if(hitIn==1'b0)
		begin
			if(loopIn==2'b00)
			begin
				if(mruTemp==1'b1)
				begin
					tagOneOut=0;
					tagTwoOut=1;
				end
				else 
				begin
					tagOneOut=1;
					tagTwoOut=0;
				end
			end
			else if(loopIn==2'b01)
			begin
				if(mruTemp==1'b0)
				begin
					tagOneOut=0;
					tagTwoOut=1;
				end
				else 
				begin
					tagOneOut=1;
					tagTwoOut=0;
				end
			end
		end
		else
		begin
			if(loopIn==2'b10) //If got a hit when loop is 2 then change mrubit
			begin
				mruOut=~mrubit;
			end
		end
	end
endmodule

module tagComparator(input [23:0] tag1, input [23:0] tag2, output reg same);
	always @ (tag1 or tag2)
	begin
		if(tag1==tag2)
			same=1'b1;
		else
			same=1'b0;
	end
endmodule

module mux2to1_128bits(input [127:0] input1, input [127:0] input2, input sel, output reg [127:0] mux2to1Out);
	always@(input1 or input2 or sel)
	begin
	case(sel)
		1'b0: mux2to1Out = input1;
		1'b1: mux2to1Out = input2;
	endcase
	end
endmodule

module mux2to1_8bit(input [7:0] input1, input [7:0] input2, input sel, output reg [7:0] mux2to1Out);
	always@(input1 or input2 or sel)
	begin
	 case(sel)
		  1'b0: mux2to1Out = input1;
		  1'b1: mux2to1Out = input2;
	 endcase
	end
endmodule

module mux16to1_1bit(input input0, input input1, input input2, input input3, input input4, input input5, input input6, input input7, input input8, input input9, input input10, input input11, input input12, input input13, input input14, input input15, input [3:0] indexSel, output reg muxOut);
	always@(indexSel or input0 or input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15)
	begin
	case(indexSel)
		4'b0000: muxOut = input0;
		4'b0001: muxOut = input1;
		4'b0010: muxOut = input2;
		4'b0011: muxOut = input3;
		4'b0100: muxOut = input4;
		4'b0101: muxOut = input5;
		4'b0110: muxOut = input6;
		4'b0111: muxOut = input7;
		4'b1000: muxOut = input8;
		4'b1001: muxOut = input9;
		4'b1010: muxOut = input10;
		4'b1011: muxOut = input11;
		4'b1100: muxOut = input12;
		4'b1101: muxOut = input13;
		4'b1110: muxOut = input14;
		4'b1111: muxOut = input15;
	endcase
	end
endmodule

module mux16to1_24bits(input [23:0] input0, input [23:0] input1, input [23:0] input2, input [23:0] input3, input [23:0] input4, input [23:0] input5, input [23:0] input6, input [23:0] input7, 
					  input [23:0] input8, input [23:0] input9, input [23:0] input10, input [23:0] input11, input [23:0] input12, input [23:0] input13, input [23:0] input14, input [23:0] input15, input [3:0] indexSel, output reg [23:0] muxOut);
	always@(indexSel or input0 or input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15)
	begin
	case(indexSel)
		4'b0000: muxOut = input0;
		4'b0001: muxOut = input1;
		4'b0010: muxOut = input2;
		4'b0011: muxOut = input3;
		4'b0100: muxOut = input4;
		4'b0101: muxOut = input5;
		4'b0110: muxOut = input6;
		4'b0111: muxOut = input7;
		4'b1000: muxOut = input8;
		4'b1001: muxOut = input9;
		4'b1010: muxOut = input10;
		4'b1011: muxOut = input11;
		4'b1100: muxOut = input12;
		4'b1101: muxOut = input13;
		4'b1110: muxOut = input14;
		4'b1111: muxOut = input15;
	endcase
	end
endmodule

module mux16to1_128bits(input [127:0] input0, input [127:0] input1, input [127:0] input2, input [127:0] input3, input [127:0] input4, input [127:0] input5, input [127:0] input6, input [127:0] input7, 
					  input [127:0] input8, input [127:0] input9, input [127:0] input10, input [127:0] input11, input [127:0] input12, input [127:0] input13, input [127:0] input14, input [127:0] input15, input [3:0] indexSel, output reg [127:0] muxOut);
	always@(indexSel or input0 or input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15)
	begin
	case(indexSel)
		4'b0000: muxOut = input0;
		4'b0001: muxOut = input1;
		4'b0010: muxOut = input2;
		4'b0011: muxOut = input3;
		4'b0100: muxOut = input4;
		4'b0101: muxOut = input5;
		4'b0110: muxOut = input6;
		4'b0111: muxOut = input7;
		4'b1000: muxOut = input8;
		4'b1001: muxOut = input9;
		4'b1010: muxOut = input10;
		4'b1011: muxOut = input11;
		4'b1100: muxOut = input12;
		4'b1101: muxOut = input13;
		4'b1110: muxOut = input14;
		4'b1111: muxOut = input15;
	endcase
	end
endmodule

module mux16to1_8bit(input [7:0] input0, input [7:0] input1, input [7:0] input2, input [7:0] input3, input [7:0] input4, input [7:0] input5, input [7:0] input6, input [7:0] input7, 
					input [7:0] input8, input [7:0] input9, input [7:0] input10, input [7:0] input11, input [7:0] input12, input [7:0] input13, input [7:0] input14, input [7:0] input15, input [3:0] indexSel, output reg [7:0] muxOut);
	always@(indexSel or input0 or input1 or input2 or input3 or input4 or input5 or input6 or input7 or input8 or input9 or input10 or input11 or input12 or input13 or input14 or input15)
	begin
	case(indexSel)
		4'b0000: muxOut = input0;
		4'b0001: muxOut = input1;
		4'b0010: muxOut = input2;
		4'b0011: muxOut = input3;
		4'b0100: muxOut = input4;
		4'b0101: muxOut = input5;
		4'b0110: muxOut = input6;
		4'b0111: muxOut = input7;
		4'b1000: muxOut = input8;
		4'b1001: muxOut = input9;
		4'b1010: muxOut = input10;
		4'b1011: muxOut = input11;
		4'b1100: muxOut = input12;
		4'b1101: muxOut = input13;
		4'b1110: muxOut = input14;
		4'b1111: muxOut = input15;
	endcase
	end
endmodule

module looper(input clk, input reset, input [1:0] loopIn, output reg [1:0] loopOut);
	always@(negedge clk)
	begin
		if(reset == 1'b1) loopOut=2'b00;
		else loopOut = loopIn + 2'b01;
	end
endmodule

module decider(input hitIn, input [1:0] loopIn, input [7:0] dataIn, output reg [1:0] hit, output reg [7:0] data);
	always @ (hitIn or loopIn or dataIn)
	begin
		if(hitIn==1'b1 && (loopIn == 2'd1 || loopIn == 2'd2 || loopIn == 2'd3))
		begin
			hit=2'b01;
			data=dataIn;
		end
		else
		begin
			if(loopIn==2'b10)
			begin
				hit=2'b00;
				data=8'b10101010; //Some random miss byte
			end
			else
			begin
				hit=2'b11;
			end
		end
	end
endmodule

module fifoArray(input clk, input reset, input [3:0] index, input write, input fifoBit, output fifoOut1);
	wire [15:0] fifoOut;
	wire [15:0] we;
	decoder4to16 dec128tag (index, we);
	D_FF v0(clk, reset, we[0] & write, fifoBit, fifoOut[0]);
	D_FF v1(clk, reset, we[1] & write, fifoBit, fifoOut[1]);
	D_FF v2(clk, reset, we[2] & write, fifoBit, fifoOut[2]);
	D_FF v3(clk, reset, we[3] & write, fifoBit, fifoOut[3]);
	D_FF v4(clk, reset, we[4] & write, fifoBit, fifoOut[4]);
	D_FF v5(clk, reset, we[5] & write, fifoBit, fifoOut[5]);
	D_FF v6(clk, reset, we[6] & write, fifoBit, fifoOut[6]);
	D_FF v7(clk, reset, we[7] & write, fifoBit, fifoOut[7]);
	D_FF v8(clk, reset, we[8] & write, fifoBit, fifoOut[8]);
	D_FF v9(clk, reset, we[9] & write, fifoBit, fifoOut[9]);
	D_FF v10(clk, reset, we[10] & write, fifoBit, fifoOut[10]);
	D_FF v11(clk, reset, we[11] & write, fifoBit, fifoOut[11]);
	D_FF v12(clk, reset, we[12] & write, fifoBit, fifoOut[12]);
	D_FF v13(clk, reset, we[13] & write, fifoBit, fifoOut[13]);
	D_FF v14(clk, reset, we[14] & write, fifoBit, fifoOut[14]);
	D_FF v15(clk, reset, we[15] & write, fifoBit, fifoOut[15]);
	mux16to1_1bit validbitmux(fifoOut[0],fifoOut[1],fifoOut[2],fifoOut[3],fifoOut[4],fifoOut[5],fifoOut[6],fifoOut[7],fifoOut[8],fifoOut[9],fifoOut[10],fifoOut[11],fifoOut[12],fifoOut[13],fifoOut[14],fifoOut[15],index,fifoOut1);
endmodule


module cacheread(input clk, input reset, input cacheWrite, input [31:0] add, input[127:0] dataIn, output [1:0] hit, output [7:0] dataOut);
	wire [23:0] tagOut1,tagOut2;
	reg [23:0] tagOut,tagWrite;
	reg hitmid, validOut, validWrite=1'b0,finalMru;
	wire mruOut,tagOneOut,tagTwoOut,validOut1,validOut2,fifoOut1,finalMruWire;
	wire [7:0] dataOutmid;
	wire [7:0] dataOut1,dataOut2;
	wire [1:0] loop;
	reg [3:0] indexOne, indexTwo, offsetOne, offsetTwo;
	reg writemru=1'b0, writearr1=1'b0, writearr2=1'b0;
	reg resetloop = 1'b1;
	reg writesig=1'b0;
	reg fifoBit=1'b0;
	reg [127:0] dataWrite;
	reg write1=0;
	reg write2=0;
	mruArray mruArr( clk, reset, add[7:4], writesig|writemru, finalMru, mruOut);
	initial begin hitmid=1'b0; #25 resetloop=1'b0; end
	mru mrumain(clk, reset, mruOut, add[7:4], hitmid, loop, tagOneOut,tagTwoOut,finalMruWire);
	always @ (loop)
	begin
		if(loop==2'b00) begin hitmid=1'b0;  validOut = 1'b0; tagOut = 24'd0; end
	end
	always @ (hit)
	begin
		if(hit==2'b01 && loop== 2'b10)
			writemru = 1;
		else 
			writemru = 0;
	end
	always @ (loop)
	begin
		if(loop==2'b11)
			writemru=0;
	end
	always @ (clk)
	begin
	finalMru=finalMruWire;
		if(tagOneOut==1'b1)
			begin
				indexOne = add[7:4];
				offsetOne = add[3:0];
				tagOut = tagOut1;
				validOut = validOut1;
			end
		else if(tagTwoOut==1'b1)
			begin
				indexTwo = add[7:4];
				offsetTwo = add[3:0];
				tagOut = tagOut2;
				validOut = validOut2;
			end
		if(validOut==1'b1)
			begin
				if(tagOut==add[31:8])
					hitmid=1'b1;
				else
					hitmid=1'b0;
			end
	end
			
			
	looper loop1(clk , resetloop, loop, loop);
	
	regfile24 tagArray1(clk, reset, writesig & writearr1, indexOne, tagWrite, tagOut1);
	regfile24 tagArray2(clk, reset, writesig & writearr2, indexTwo, tagWrite, tagOut2);
	always @ (loop)
	begin
	if(tagOut1==add[31:8] && cacheWrite==1)
	begin
		indexOne=add[7:4];
		write1=1;
		dataWrite=dataIn;
	end
	else if(tagOut2==add[31:8] && cacheWrite==1)
	begin
		indexTwo=add[7:4];
		write2=1;
		dataWrite=dataIn;
	end
	else
	begin
		write1=0;
		write2=0;
	end
	end
	validArray validArrayOne(clk, reset,indexOne, writesig & writearr1, validWrite, validOut1);
	validArray validArrayTwo(clk, reset,indexTwo, writesig & writearr2, validWrite, validOut2);
	
	regfile128 dataArray1(clk, reset, (writesig & writearr1)|write1, indexOne, offsetOne , dataWrite, dataOut1);
	regfile128 dataArray2(clk, reset, (writesig & writearr2)|write2, indexTwo, offsetTwo , dataWrite, dataOut2);
	
	mux2to1_8bit m2to1_1(dataOut1, dataOut2, ~(tagOneOut&validOut)&tagOneOut, dataOutmid);
	
	decider deci1(hitmid, loop, dataOutmid, hit, dataOut);
	fifoArray fifoarr1( clk, reset, add[7:4], writesig, fifoBit, fifoOut1);
	
	always @ (hit or clk)
	begin
		if(hit==2'b00) //If its a complete miss
		begin
			//Write process begins
			writesig=1'b1;
			fifoBit=~fifoOut1;//FiFo bit represent my last write location
			tagWrite=add[31:8];
			validWrite=1'b1;
			dataWrite=dataIn;
			if(fifoBit==1'b0)
			begin
				indexOne=add[7:4];
				offsetOne=add[3:0];
				writearr1=1'b1;
				finalMru=1'b0;
			end
			else
			begin
				indexTwo=add[7:4];
				offsetTwo=add[3:0];
				writearr2=1'b1;
				finalMru=1'b1;
			end
		end
		else //If it is not a complete miss no need to write
		begin
			writesig=1'b0;
			writearr1=1'b0;
			writearr2=1'b0;
		end
	end
endmodule



module Cache_testBench;
	reg clk;
	reg reset;
	reg [31:0] add;
	reg [127:0] dataIn;
	reg cacheWrite;
	wire [7:0] dataOut;
	wire[1:0] hit;
	cacheread cRead(.clk(clk), .reset(reset), .cacheWrite(cacheWrite), .add(add), .dataIn(dataIn), .hit(hit), .dataOut(dataOut));

	always
	#5 clk=~clk;
	
	initial
	begin
		reset=1;
		clk=0;
		#20  reset=0; 
			  add=32'b000000000000000000000001_0000_0001; dataIn=128'd512; cacheWrite = 1'd0; //100 Miss
		#40 add=32'b000000000000000000000010_0000_0000; dataIn=128'd6; cacheWrite = 1'd1; //200 Miss
		#40 add=32'b000000000000000000001000_0001_0000; dataIn=128'd1024; cacheWrite = 1'd0;	//810 Miss
		#40 add=32'b000000000000000000000010_0000_0000; dataIn=128'd8; cacheWrite = 1'd1; //200 Hit and Write
		#40 add=32'b000000000000000000000001_0000_0000; dataIn=128'd8; cacheWrite = 1'd1; //100 Hit and Write
		#40 add=32'b000000000000000000001000_0001_0001; dataIn=128'd1; cacheWrite = 1'd0;	//811 Hit
		#40 add=32'b000000000000000000000001_0000_0001; dataIn=128'd18;//101 Hit
		#40 add=32'b000000000000000000001001_0101_0000; dataIn=128'd4; //950 Miss
		#40 add=32'b000000000000000000000011_0000_0000; dataIn=128'd12; //300 Miss
		#40 add=32'b000000000000000000000010_0000_0001; dataIn=128'd12; //201 Hit
		#40 add=32'b000000000000000000000111_0000_0000; dataIn=128'd24; cacheWrite=1'd1; //700 Miss and Write
		#40 add=32'b000000000000000000001000_0001_0000; dataIn=128'd2; cacheWrite=1'd0; //810 Hit
		#40 add=32'b000000000000000000001000_0101_0000; dataIn=128'd4; //850 Miss
		#40 add=32'b000000000000000000001011_0101_0000; dataIn=128'd9; //B50 Miss
		#40 add=32'b000000000000000000001111_0101_0000; dataIn=128'd8; //F50 Miss
		#40 add=32'b000000000000000000001011_0101_0000; dataIn=128'd4; //B50 Hit
		#40 add=32'b000000000000000000000111_0000_0000; dataIn=128'd4; //700 Hit
		#800 $finish; 
	end
endmodule
