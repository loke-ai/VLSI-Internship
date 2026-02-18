module fir_filter (
    input clk,
    input signed [7:0] x,
    output reg signed [15:0] y
);

    reg signed [7:0] x1, x2;

    always @(posedge clk) begin
        x2 <= x1;
        x1 <= x;
        y <= (x * 1) + (x1 * 2) + (x2 * 1);
    end

endmodule
