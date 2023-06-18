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

localparam comma1 = 6'b110000;
localparam comma2 = 6'b001111;

// -----------------------------------------------

/* Según el diagrama del standart, 
   la sincronización cuenta con 13 estados 
   (Figura 36-9)
*/


parameter IDLE = 0;
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

integer estado = IDLE; // Estado inicial

// -----------------------------------------------

always @(negedge CLK) begin

    case (estado)
        IDLE: begin
          if (POWER==1'b1 || RESET==1'b1 || (SIGNAL_CHANGE==1'b1 && MR_LOOPBACK==1'b0 && PUDI)) begin
            $display("Next State: LOSS_OF_SYNC");
            estado = estado + 1;
          end
        end

        LOSS_OF_SYNC: begin
            CODE_SYNC <= 0;
            RX_EVEN <= !RX_EVEN;
            SUDI[9:0] = PUDI[9:0];

            if ((PUDI && SIGNAL_DETECT==1'b0 && MR_LOOPBACK==1'b0) || PUDI[9:4]!=comma1) begin
                estado = LOSS_OF_SYNC;
            end

            if ((SIGNAL_DETECT==1 || MR_LOOPBACK==1) && PUDI[9:4]==comma1) begin
                estado = COMMA_DETECT_1
            end
            $display("Current State: LOSS_OF_SYNC");
        end
    endcase
end

endmodule