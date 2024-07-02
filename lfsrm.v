module lfsrm (
    input i_clk,
    input i_rst,
    input [6:0] i_seed,
    output reg [6:0] o_lfsrM
);
    reg msb_lfsrM;
    reg [6:0] temp;

    always @(posedge i_clk) begin
        if (!i_rst) begin
            temp <= i_seed;
        end else begin
            temp <= {msb_lfsrM, temp[6:1]};
        end
        o_lfsrM <= temp;
        msb_lfsrM <= temp[6] ^ temp[0];
    end
endmodule
