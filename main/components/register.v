module TC_Register (clk, rst, load, save, save_value, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter WORD_WIDTH = 1;
    input clk;
    input rst;
    input load;
    input save;
    input [WORD_WIDTH-1:0] save_value;
    output reg [WORD_WIDTH-1:0] out;

    reg [WORD_WIDTH-1:0] value;
    reg reset;
    
    initial begin
        out = {WORD_WIDTH{1'b0}};
        value = {WORD_WIDTH{1'b0}};
    end
    
    always @ (negedge load or posedge load) begin
        if (load)
            out <= value;
        else
            out <= {WORD_WIDTH{1'b0}};
        reset <= rst;
    end
    always @ (negedge clk) begin
        if (reset)
            value <= {WORD_WIDTH{1'b0}};
        else if (save)
            value <= save_value;
    end
endmodule
