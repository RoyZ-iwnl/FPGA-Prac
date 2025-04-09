module counter (
    arstn,
    LTn,
    Upn_down,
    clk,
    Load,
    oe,
    dout
);
input wire arstn;          // 异步复位（低有效）
input wire LTn;             // 同步置数
input wire Upn_down;        // 计数方向 0:加 1:减
input wire clk;            // 时钟
input wire [3:0] Load;     // 同步加载数据
output reg oe;             // 输出有效信号
output reg [3:0] dout;     // 计数器输出


// 计数器核心逻辑
always @(negedge arstn,posedge clk) begin
    if(~arstn) begin
        dout <= 4'd0;
        oe <= 1'b0;
    end
    else if (~LTn) begin 
        dout <= Load;
        oe <= 1'b1;
    end
    else if (~Upn_down) begin 
        dout <= dout + 4'b1;
        oe <= 1'b1;
    end
    else begin
        dout <= dout - 4'b1;
        oe <= 1'b1; 
    end
end

endmodule