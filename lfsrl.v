module lfsrl (
    input i_clk,
    input i_rst,
    input [12:0] i_seed,
    output reg [12:0] o_lfsrL
);
    reg msb_lfsrL_sig;
    reg [12:0] temp;
    reg msb_lfsrL;

    always @(posedge i_clk) begin
        if (!i_rst) begin
            temp <= i_seed;
        end else begin
            temp <= {msb_lfsrL_sig, temp[12:1]};
            msb_lfsrL <= temp[12] ^ temp[3] ^ temp[2] ^ temp[0];
            temp <= {msb_lfsrL, temp[12:1]};
        end
        o_lfsrL <= temp;
        msb_lfsrL_sig <= temp[12] ^ temp[3] ^ temp[2] ^ temp[0];
    end
endmodule
