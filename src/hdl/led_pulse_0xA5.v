//NetFPGA 1G CML project to flas the LEDs in sequence 0xA, 0x5, 0xA, ...
//Used for sanity check for programming or put into BPI Flash as indicator bitfile did not take
//Doug Summerville, Binghamton University

//Pulse frequency is MULT/DIV Hz
`define PULSE_FREQ_MULT 12
`define PULSE_FREQ_DVSR 10

`define CLOCK_FREQ_MHz 10 //after clocking module
`define TOP ((`CLOCK_FREQ_MHz*1000000*`PULSE_FREQ_DVSR/2)/(`PULSE_FREQ_MULT))
`define COUNTER_BITS ($clog2(`TOP))

module led_pulse_0xA5(
    input system_clk_p,
    input system_clk_n,
    output reg [3:0] led
);

reg [`COUNTER_BITS-1:0] counter;
wire clk_10MHz;
wire resetn;

clk_wiz_0 clk_wiz 
 (
    .clk_10MHz(clk_10MHz),
    .locked(resetn),
    .clk_in1_p(system_clk_p),
    .clk_in1_n(system_clk_n)
 );

always @(posedge clk_10MHz) 
    if( resetn == 1'b0 ) 
        begin
        counter<=0;
        led<=4'hA;
        end
    else if( counter != `TOP )
        counter <= counter +1;
    else 
        begin
        counter <= 0;
        led <= ~led;
        end

endmodule
