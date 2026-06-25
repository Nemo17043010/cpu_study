`timescale 1ns/1ps

module sillyfunction_tb;
    reg a, b, c;
    wire y;

    // Instantiate the Unit Under Test (UUT)
    sillyfunction uut (
        .a(a),
        .b(b),
        .c(c),
        .y(y)
    );

    initial begin
        $display("Starting simulation...");
        $display("a b c | y");
        $display("------|--");

        // Test all combinations
        a = 0; b = 0; c = 0; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 0; b = 0; c = 1; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 0; b = 1; c = 0; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 0; b = 1; c = 1; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 1; b = 0; c = 0; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 1; b = 0; c = 1; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 1; b = 1; c = 0; #10; $display("%b %b %b | %b", a, b, c, y);
        a = 1; b = 1; c = 1; #10; $display("%b %b %b | %b", a, b, c, y);
        
        $display("Simulation finished.");
        $finish;
    end

    // For GTKWave waveform viewing
    initial begin
        $dumpfile("sillyfunction_tb.vcd");
        $dumpvars(0, sillyfunction_tb);
    end
endmodule
