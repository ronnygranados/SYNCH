module synchronization(
                       input CLK,
                       input POWER,
                       input RESET,
                       input SIGNAL_CHANGE,
                       input SIGNAL_DETECT,
                       input [9:0] PUDI,
                       input MR_LOOPBACK,

                       output reg CODE_SYNC,
                       output reg RX_EVEN,
                       output reg [9:0] SUDI,
                       output reg GOOD_CGS
);

endmodule