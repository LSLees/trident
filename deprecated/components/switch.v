module TC_Switch(enable, in, out);
    parameter UUID = 0;
    parameter NAME = "";
    parameter WORD_WIDTH = 1;
    input enable;
    input [WORD_WIDTH-1:0] in;
    output [WORD_WIDTH-1:0] out;
    reg [WORD_WIDTH-1:0] outval;
    
    always @ (enable or in) begin
        case(enable)
        1'b0 : outval = {WORD_WIDTH{1'b0}};
        1'b1 : outval = in;
        endcase
    end
    assign out = outval;
endmodule
