module Task3(d,clk,out);
input d,clk;//Входы
output reg out;// Выход
always @(posedge clk) // Для возврастающего фронта
begin
 out <=d;
 end
 endmodule
 