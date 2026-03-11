module TC_Decoder1 (select, out0, out1);
    parameter UUID = 0;
    parameter NAME = "";
    input select;
    output reg out0, out1;

    always @ (select)
    begin
        case(select)
        1'b0 : {out1, out0} =  2'b01;
        1'b1 : {out1, out0} =  2'b10;
        endcase
    end 
endmodule
