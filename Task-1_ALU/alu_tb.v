module alu_tb;

reg [3:0] A, B;
reg [2:0] sel;
wire [3:0] result;

alu uut (.A(A), .B(B), .sel(sel), .result(result));

initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, alu_tb);

    A = 4'd5; B = 4'd3;

    sel = 3'b000; #10;
    sel = 3'b001; #10;
    sel = 3'b010; #10;
    sel = 3'b011; #10;
    sel = 3'b100; #10;

    $finish;
end

endmodule
