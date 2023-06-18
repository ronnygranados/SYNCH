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

// -----------------------------------------------

/* Según el diagrama del standart, 
   la sincronización cuenta con 13 estados 
   (Figura 36-9)
*/
parameter LOSS_OF_SYNC = 1;
parameter COMMA_DETECT_1 = 2;
parameter ACCQUIRE_SYNC_1 = 3;
parameter COMMA_DETECT_2 = 4;
parameter ACCQUIRE_SYNC_2 = 5;
parameter COMMA_DETECT_3 = 6;

parameter SYNC_ACQUIRED_1 = 7;
parameter SYNC_ACQUIRED_2 = 8;
parameter SYNC_ACQUIRED_3 = 9;
parameter SYNC_ACQUIRED_4 = 10;

parameter SYNC_ACQUIRED_2A = 11;
parameter SYNC_ACQUIRED_3A = 12;
parameter SYNC_ACQUIRED_4A = 13;

parameter estado = LOSS_OF_SYNC; // Estado inicial

// -----------------------------------------------

always @(negedge CLK) begin
    /*if (POWER || RESET || (SIGNAL_CHANGE && ~MR_LOOPBACK && PUDI)) begin
        $display("Full detection of signals");
    end*/

    if (POWER) begin
        $display("Full detection of signals");
    end
end

endmodule