`timescale 1ns/1ps

module gate_tb;
    reg  [3:0] a,b;
    wire [3:0] y1, y2, y3, y4, y5;

    // Instantiate the Unit Under Test (UUT)
    gate uut (
        .a(a),
        .b(b),
        .y1(y1),
        .y2(y2),
        .y3(y3),
        .y4(y4),
        .y5(y5)
    );

    initial begin
        $display("Starting simulation...");
        $display(" a    |b    |  y1  |  y2  |  y3  |  y4  |  y5  ");
        $display("------|------");

        // Test all 16 combinations (0000 ~ 1111)
        a = 4'b0000; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0001; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0010; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0011; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0100; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0101; b= 4'b0000; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0000; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0001; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0010; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0011; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0100; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);
        a = 4'b0101; b= 4'b1111; #10; $display("%b | %b| %b| %b| %b| %b| %b", a,b , y1, y2, y3, y4, y5);


        $display("Simulation finished.");
        $finish;
    end

    // For GTKWave waveform viewing
    initial begin
        $dumpfile("gate_tb.vcd");
        $dumpvars(0, gate_tb);
    end
endmodule
