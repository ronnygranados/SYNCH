module tester(
            output reg CLK,
            output reg POWER,
            output reg RESET,
            output reg SIGNAL_CHANGE,
            output reg SIGNAL_DETECT,
            output reg [9:0] PUDI,
            output reg MR_LOOPBACK,

            input wire CODE_SYNC,
            input wire RX_EVEN,
            input wire [9:0] SUDI,
            input wire GOOD_CGS
);


initial begin

    CLK = 0;
    RESET = 0;
    POWER = 0; 
    MR_LOOPBACK=1;  
    #2 
    POWER=1;
    RESET=1;
    SIGNAL_CHANGE = 1; 
    MR_LOOPBACK =0; 
    PUDI= 10'b1100000101; //K28.5  1 COMMA
    #10 $finish;
end

    
always begin
    #1 CLK = !CLK;
  end


endmodule