`timescale 10ns/10ps

module decoder38_tb;
    reg              en1;
    reg     [2:0]    add1;
    wire    [7:0]    dout1;

    localparam dly = 3;

    initial begin
        en1 = 1'b0;
        add1 = 3'd7;
        #(2*dly) en1 = 1'b1;
        #dly add1 = 3'd0;
        #dly add1 = 3'd1;
        #dly add1 = 3'd2;
        #dly add1 = 3'd3;
        #dly add1 = 3'd4;
        #dly add1 = 3'd5;
        #dly add1 = 3'd6;
        #dly add1 = 3'd7;
        #dly add1 = 3'd6;
        #dly add1 = 3'd5;
        #dly add1 = 3'd4;
        #dly add1 = 3'd3;
        #dly add1 = 3'd2;
        #dly add1 = 3'd1;
        #dly add1 = 3'd0;
    end

    decoder38 unit(
        .en(en1),
        .add(add1),
        .dout(dout1)
    );

endmodule
