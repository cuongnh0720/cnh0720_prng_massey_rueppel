module xorg
(
    input wire [6:0] keystream_and,
    output reg keystream_xor
);

integer i;
reg temp;

always @(*) begin
    temp = keystream_and[0];
    for (i = 1; i < 7; i = i + 1) begin
        temp = temp ^ keystream_and[i];
    end
    keystream_xor = temp;
end

endmodule
