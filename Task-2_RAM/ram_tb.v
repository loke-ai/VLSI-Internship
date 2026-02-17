module ram_tb;

reg clk;
reg we;
reg [3:0] addr;
reg [7:0] din;
wire [7:0] dout;

ram uut (.clk(clk), .we(we), .addr(addr), .din(din), .dout(dout));

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, ram_tb);

    clk = 0;
    we = 0;
    addr = 0;
    din = 0;

    #10 we = 1; addr = 4'd3; din = 8'd19;
    #10 we = 0; addr = 4'd3;

    #20 $finish;
end

endmodule
