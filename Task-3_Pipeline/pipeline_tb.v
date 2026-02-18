module pipeline_tb;

reg clk;

pipeline_cpu uut (.clk(clk));

always #5 clk = ~clk;

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, pipeline_tb);

    clk = 0;
    #50;
    $finish;
end

endmodule
