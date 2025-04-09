//
module decoder38(
    input    wire    en,
    input    wire    [2:0] add,
    output   reg     [7:0] dout
);

always @(*) begin
    if (!en) 
        dout = 8'b1111_1111; // en等于0
    else 
        case (add) // 对应8种情况
            3'b000: dout = 8'b1111_1110;
            3'b001: dout = 8'b1111_1101;
            3'b010: dout = 8'b1111_1011;
            3'b011: dout = 8'b1111_0111;
            3'b100: dout = 8'b1110_1111;
            3'b101: dout = 8'b1101_1111;
            3'b110: dout = 8'b1011_1111;
            3'b111: dout = 8'b0111_1111; // 修正重复的 case
            default: dout = 8'b1111_1111;
        endcase
end

endmodule
