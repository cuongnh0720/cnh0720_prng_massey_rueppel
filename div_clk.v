module div_clk (
    input i_clk,
    output reg o_clk
);
    parameter n = 8;
    reg [3:0] d1hz_r = 1;  // Adjust the width of the register according to the value of n
    reg [3:0] d1hz_n;

    // Register
    always @(negedge i_clk) begin
        d1hz_r <= d1hz_n;
    end

    // Next state logic
    always @* begin
        if (d1hz_r == n)
            d1hz_n = 1;
        else
            d1hz_n = d1hz_r + 1;
    end

    // Output logic
    always @* begin
        if (d1hz_r == n / 2)
            o_clk = 1;
        else
            o_clk = 0;
    end
endmodule
