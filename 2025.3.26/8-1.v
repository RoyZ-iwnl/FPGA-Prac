module mux8to1 (
en,
D,
addy,
valid,
dout
);
input wire en;          // 使能信号
input wire [7:0] D;        // 8 路输入数据
input wire [2:0] addy;     // 3 位地址选择
output reg valid;          // 有效信号
output reg dout;           // 输出数据

always @(*) begin
    if (en) begin
        valid = 1'b1;
        case (addy)
            3'b000: dout = D[0];
            3'b001: dout = D[1];
            3'b010: dout = D[2];
            3'b011: dout = D[3];
            3'b100: dout = D[4];
            3'b101: dout = D[5];
            3'b110: dout = D[6];
            3'b111: dout = D[7];
            default: dout = 1'b0;
        endcase
    end else begin
        valid = 1'b0;
        dout = 1'b0;
    end
end

endmodule
