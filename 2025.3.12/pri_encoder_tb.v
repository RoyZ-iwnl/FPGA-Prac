//
`timescale 10ns/10ps
module pri_encoder_tb;
    wire            oe;
    wire    [2:0]   addr_vec;
    reg             ena;
    reg     [7:0]   din_vec;

    // parameter
    localparam      dly = 5,
                    period = 3;

    initial begin
        ena = 1'b0;
        din_vec = 8'b0000_0000;
        #dly ena = 1'b1;   // 使能信号开启

        #period din_vec = 8'b0000_0000; // 无输入，oe应为0
        #period din_vec = 8'b0000_0001; // 最低优先级
        #period din_vec = 8'b0000_0010; // 001
        #period din_vec = 8'b0000_0100; // 010
        #period din_vec = 8'b0000_1000; // 011
        #period din_vec = 8'b0001_0000; // 100
        #period din_vec = 8'b0010_0000; // 101
        #period din_vec = 8'b0100_0000; // 110
        #period din_vec = 8'b1000_0000; // 最高优先级 111

    end

    pri_encoder unit(
        .oe(oe),
        .addr_vec(addr_vec),
        .ena(ena),
        .din_vec(din_vec)
    );

endmodule
