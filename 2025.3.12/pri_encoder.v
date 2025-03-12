//
module pri_encoder(
oe,
addr_vec,
ena,
din_vec
);

output		reg			oe;
output		reg			[2:0] addr_vec;
input		wire		ena;
input		wire		[7:0] din_vec;

always@(*)begin//给输出oe赋值
	if(!ena) oe = 1'b0;
	else if(din_vec == 8'b0000_0000) oe = 1'b0;
	else oe = 1'b1;
end

always@(*)begin//给输出addr_vec赋值
	if(!ena) addr_vec = 8'b0000_0000;
		else begin//ena==1'b1
			if(din_vec[7] == 1'b1) addr_vec = 3'b111;
			else if(din_vec[6]) addr_vec = 3'b110;
			else if(din_vec[5]) addr_vec = 3'd101;
			else if(din_vec[4]) addr_vec = 3'b100;
			else if(din_vec[3]) addr_vec = 3'b011;
			else if(din_vec[2]) addr_vec = 3'b010;
			else if(din_vec[1]) addr_vec = 3'b001;
			else addr_vec = 3'b000;
		end
end

endmodule

