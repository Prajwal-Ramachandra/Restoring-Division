module testbench_16bit;
reg clk;
reg [15:0] dividend;
reg [15:0] divisor;
wire [15:0] quotient;
wire [15:0] remainder;
restoring_division_16bit RD_16bit(
.dividend(dividend),
.divisor(divisor),
.quotient(quotient),
.remainder(remainder),
.clk(clk)
);
initial begin
$dumpfile("dump.vcd");
$dumpvars(0, testbench_16bit);
clk = 0;
dividend = 16'b0;
divisor = 16'b0;
#10;
clk = 1;
#5 clk = 0;
#5 clk = 1;
#5 clk = 0;
dividend = 16'b1010110101101101;
divisor = 16'b0011100100111001;
#10;
repeat (16) begin
#5 clk = ~clk;
end
$display("At the end of 16th cycle:");
$display("Dividend: %b", dividend);
$display("Divisor: %b", divisor);
$display("Quotient: %b", quotient);
$display("Remainder: %b", remainder);
#50;
$finish;
end
always #5 clk = ~clk;
endmodule
