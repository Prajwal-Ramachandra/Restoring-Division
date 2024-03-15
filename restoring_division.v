module restoring_division_16bit(
input wire [15:0] dividend,
input wire [15:0] divisor,
output reg [15:0] quotient,
output reg [15:0] remainder,
input wire clk
);
reg [15:0] D;
reg [15:0] M;
reg [15:0] Q;
reg [15:0] A;
reg [7:0] count;
always @(*) begin
D = {1'b0, dividend};
M = {1'b0, divisor};
Q = 16'b0;
A = 16'b0;
count = 8'b0;
end
always @(posedge clk) begin
if (count < 16) begin
A = {A, D[15]};
A = A - M;
if (A[15] == 1) begin
Q[0] <= 1'b0;
A = A + M;
end else begin
Q[0] <= 1'b1;
end
Q = Q << 1;
D = D << 1;
count = count + 1;
end
end
always @(posedge clk) begin
quotient <= Q;
remainder <= A;
end
endmodule
