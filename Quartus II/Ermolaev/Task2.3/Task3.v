module Task3(d,clk,out);
input d,clk;//�����
output reg out;// �����
always @(posedge clk) // ��� �������������� ������
begin
 out <=d;
 end
 endmodule
 