// states for state machine
`define DISABLED 1'b0
`define WORKING 1'b1


// Keycodes
`define KEYCODE_W 8'h1d
`define KEYCODE_S 8'h1b
`define KEYCODE_X 8'h22
`define KEYCODE_E 8'h24
`define KEYCODE_D 8'h23
`define KEYCODE_C 8'h21

`define KEYCODE_KP_1 8'h69
`define KEYCODE_KP_2 8'h72
`define KEYCODE_KP_3 8'h7a
`define KEYCODE_KP_4 8'h6b
`define KEYCODE_KP_5 8'h73
`define KEYCODE_KP_6 8'h74
`define KEYCODE_KP_7 8'h6c

//Notes and freq:
//C   D   E   F   G    A   B
//65  73  82  87  98  110 123
`define freq_c 65
`define freq_d 73
`define freq_e 82
`define freq_f 87
`define freq_g 98
`define freq_a 110
`define freq_b 123

//Frequencies with extra bits
`define freq_b_c 20'd65
`define freq_b_d 20'd73
`define freq_b_e 20'd82
`define freq_b_f 20'd87
`define freq_b_g 20'd98
`define freq_b_a 20'd110
`define freq_b_b 20'd123
