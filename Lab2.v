module Lab2(X,clock,reset,F);

input clock;
input reset;
input X;
output reg F;

parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;

reg [2:0] cs, ns;

always @(posedge clock) begin
	if(reset==1) begin
		cs <= s0;
	end
	else begin
		cs <= ns; 
	end
end

always @(cs,X) begin
	case (cs)
		s0:begin
		if (X == 1'b1)
			ns <= s1;
		else
			ns <= s0;
		end
		s1:begin
		if (X == 1'b1)
			ns <= s1;
		else
			ns <= s2;
		end
		s2:begin
		if (X == 1'b1)
			ns <= s1;
		else
			ns <= s3;
		end
		s3:begin
		if (X == 1'b1)
			ns <= s4;
		else
			ns <= s0;
		end
		s4:begin
		if (X == 1'b1)
			ns <= s1;
		else
			ns <= s0;
		end
		default: ns <= s0;
	endcase
		if (cs == s4) begin
		F <= 1'b1;
		end
		else begin
		F <= 1'b0;
		end
end





endmodule
