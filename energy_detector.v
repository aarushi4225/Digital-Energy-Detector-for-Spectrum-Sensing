`timescale 1ns / 1ps

module energy_detector
#(
    parameter wl        = 16,
    parameter nSample   = 1000,
    parameter wl_sample = (2 * wl) + 1,
    parameter th        = (2 * wl) + 1 + $clog2(nSample)
)
(
    input clk,
    input rst,
    input en,
    input signed [wl-1:0] rxRe,
    input signed [wl-1:0] rxIm,
    input signed [th-1:0] thresh,
    output reg detected
);

    reg signed [th-1:0]        acc;
    reg [$clog2(nSample)-1:0]  count;

    wire signed [wl_sample-1:0] energy_sample;

    assign energy_sample = (rxRe * rxRe) + (rxIm * rxIm);

    always @(posedge clk) begin
        if (rst) begin
            acc      <= 0;
            count    <= 0;
            detected <= 0;
        end
        else if (en) begin
            acc   <= acc + energy_sample;
            count <= count + 1;

            if (count == nSample - 1) begin
                if (acc + energy_sample > thresh) begin
                    detected <= 1;
                    #500;
                    $finish; end
                else
                    # 200 detected <= 0;

                acc   <= 0;
                count <= 0;
            end
            else begin
                detected <= 0;
            end
        end
        else begin
            detected <= 0;
        end
    end

endmodule
