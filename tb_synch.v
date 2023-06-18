`include "tester.v"
`include "synch.v"


module tb_synch;

    wire CLK;
    wire POWER;
    wire RESET;
    wire SIGNAL_CHANGE;
    wire SIGNAL_DETECT;
    wire [9:0] PUDI;
    wire MR_LOOPBACK;

    wire CODE_SYNC;
    wire RX_EVEN;
    wire [9:0] SUDI;
    wire GOOD_CGS;

    synchronization I0 (.CLK(CLK), 
                        .POWER(POWER),
                        .RESET(RESET),
                        .SIGNAL_CHANGE(SIGNAL_CHANGE),
                        .SIGNAL_DETECT(SIGNAL_DETECT),
                        .PUDI(PUDI),
                        .MR_LOOPBACK(MR_LOOPBACK),
                        .CODE_SYNC(CODE_SYNC),
                        .RX_EVEN(RX_EVEN),
                        .SUDI(SUDI),
                        .GOOD_CGS(GOOD_CGS)
                        );

    tester I2 (         .CLK(CLK), 
                        .POWER(POWER),
                        .RESET(RESET),
                        .SIGNAL_CHANGE(SIGNAL_CHANGE),
                        .SIGNAL_DETECT(SIGNAL_DETECT),
                        .PUDI(PUDI),
                        .MR_LOOPBACK(MR_LOOPBACK),
                        .CODE_SYNC(CODE_SYNC),
                        .RX_EVEN(RX_EVEN),
                        .SUDI(SUDI),
                        .GOOD_CGS(GOOD_CGS)
                        );

    initial begin
        $dumpfile("synch.vcd");
        $dumpvars(-1, I0);
    end

endmodule