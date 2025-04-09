//
`timescale 10ns/10ps
module counter_tb;
reg  arstn;          // 异步复位（低有效）
reg  LTn;             // 同步置数
reg  Upn_down;        // 计数方向 0:加 1:减
reg  clk;            // 时钟
reg [3:0] Load;     // 同步加载数据
wire oe;             // 输出有效信号
wire [3:0] dout;     // 计数器输出

parameter period = 10;

initial begin
    arstn= 1'b0;
    clk = 1'b0;
    LTn = 1'b1;
    Load = 4'd7;
    Upn_down = 1'b1;

    #(13*period) arstn = 1'b1;
    Upn_down = 1'b0;
    #(25*period) LTn = 1'b0;
    #period LTn = 1'b1;
    Upn_down = 1'b1;
end

always #(period/2) clk = ~clk;

counter unit (
.arstn(arstn),
.LTn(LTn),
.Upn_down(Upn_down),
.clk(clk),
.Load(Load),
.oe(oe),
.dout(dout)
);

endmodule