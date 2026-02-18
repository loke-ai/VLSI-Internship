module fir_tb;

reg clk;
reg signed [7:0] x;
wire signed [15:0] y;

fir_filter uut (.clk(clk), .x(x), .y(y));

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, fir_tb);

    clk = 0;
    x = 0;

    #10 x = 8'd1;
    #10 x = 8'd2;
    #10 x = 8'd3;
    #10 x = 8'd4;
    #10 x = 8'd5;

    #30 $finish;
end

endmodule
