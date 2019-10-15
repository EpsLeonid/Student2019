import ABC_parameter::WIDTH; // подключение файла с параметрами

module ABC 
(
// task 2.2
input wire  A,
input wire  B,
output wire C,

//task 2.3 and 2.4,  необходима, чтобы привести выходные значения в определенное состояние лог. 0 
input reset,


//task 2.3
input      d,
           clk,
output reg out,

//task 2.4
input  [WIDTH-1:0]     a,
                       b,
			              c,
output reg [2*WIDTH-1:0] DATA_OUT
);

//task 2.2 
assign C = A*B;
reg [2*WIDTH-1:0] mul;
reg [2*WIDTH-1:0] add;

// task 2.3 D-триггер
always @(posedge clk)
begin
if (reset==1)
out <=0;
else
out <=d;
end

always @(posedge clk)
begin
if (reset == 1)
	begin
	mul <= 0;
	add <= 0;
	end
else
	begin
	mul <= a*b;
	add <= c;
	end
end


// task 2.4 8-разрядный регистр
always @(posedge clk)
begin
if (reset == 1)
DATA_OUT <= 0;
else
DATA_OUT <= mul+add;
end

endmodule
