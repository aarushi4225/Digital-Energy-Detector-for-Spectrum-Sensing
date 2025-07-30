`timescale 1ns / 1ps

module energy_detector_tb;
  parameter wl = 16;
  parameter nSample = 1000;
  parameter th_width = (2 * wl) + 1 + $clog2(nSample);

  reg clk;
  reg en;
  reg rst;
  reg signed [wl-1:0] rxRe_tb;
  reg signed [wl-1:0] rxIm_tb;
  reg signed [th_width-1:0] th_tb;

  wire detected;

  reg signed [wl-1:0] re_arr [0: nSample-1];
  reg signed [wl-1:0] im_arr [0: nSample-1];
  reg signed [th_width-1:0] threshold_mem [0:0];

  energy_detector #(
    .wl(wl),
    .nSample(nSample),
    .th(th_width)
  ) dut1 (
    .clk(clk),
    .rst(rst),
    .en(en),
    .rxRe(rxRe_tb),
    .rxIm(rxIm_tb),
    .thresh(th_tb),
    .detected(detected)
  );

  initial clk = 0;
  always #5 clk = ~clk;

  integer i;
  initial begin
    rst = 1;
    en = 0;
    rxRe_tb = 0;
    rxIm_tb = 0;
    th_tb = 0;

    $readmemh("Re_hex.txt", re_arr);
    $readmemh("Im_hex.txt", im_arr);
    $readmemh("th_hex.txt", threshold_mem);
    th_tb = threshold_mem[0];

    #20 rst = 0;
    #10 en = 1;

    rxRe_tb = re_arr[0];
    rxIm_tb = im_arr[0];
    #10;

    for (i = 1; i < nSample; i = i + 1) begin
      rxRe_tb = re_arr[i];
      rxIm_tb = im_arr[i];
      #10;
    end

    en = 0;
    #20;
//    $finish;
  end

  initial begin
    $monitor("Time: %0t | clk: %b | rst: %b | en: %b | rxRe: %h | rxIm: %h | acc: %h | count: %d | detected: %b",
             $time, clk, rst, en, rxRe_tb, rxIm_tb, dut1.acc, dut1.count, detected);
  end

endmodule
