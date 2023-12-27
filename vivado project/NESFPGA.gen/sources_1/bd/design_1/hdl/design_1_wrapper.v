//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
//Date        : Tue Dec 26 20:38:29 2023
//Host        : dantop running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (button,
    led,
    sys_clock);
  input button;
  output [3:0]led;
  input sys_clock;

  wire button;
  wire [3:0]led;
  wire sys_clock;

  design_1 design_1_i
       (.button(button),
        .led(led),
        .sys_clock(sys_clock));
endmodule
