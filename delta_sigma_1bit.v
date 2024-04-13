module delta_sigma_1bit #(
    parameter dac_res = 24
) (
    input                   clk_i,
    input                   dac_clk_i,
    input                   rst_i,
    input[dac_res-1:0]      din_i, 
    output                  dac_o
);

    reg[dac_res:0] dac_acc;

    always @(posedge clk_i) begin
        if(dac_clk_i) begin
            if(rst_i) begin
                dac_acc <= 0;
            end
            else begin
                dac_acc <= dac_acc[dac_res-1:0] + din_i;
            end
        end
    end

    assign dac_o = dac_acc[dac_res];

endmodule