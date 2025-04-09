`timescale 10ns/10ps

module mux8to1_tb;
    reg en;
    reg [7:0] D;
    reg [2:0] addy;
    wire valid;
    wire dout;

    localparam dly = 3;

    mux8to1 uut (
        .en(en),
        .D(D),
        .addy(addy),
        .valid(valid),
        .dout(dout)
    );

    initial begin
        // 初始化信�?
        en = 1'b0;
        addy = 3'd0;
        D = 8'b10101010; // 测试数据

        // 2*dly 后使�?
        #(2*dly) en = 1'b1;

        // 测试不同的地�?输入
        #dly addy = 3'd0;
        #dly addy = 3'd1;
        #dly addy = 3'd2;
        #dly addy = 3'd3;
        #dly addy = 3'd4;
        #dly addy = 3'd5;
        #dly addy = 3'd6;
        #dly addy = 3'd7;

        // 测试 valid 信号
        #dly en = 1'b0;
        #dly addy = 3'd3;

        // 重新使能
        #dly en = 1'b1;
        #dly addy = 3'd5;

        // 结束仿真
        #dly $stop;
    end

endmodule
