module d_trigger
(
	input clk,	// ������� clock
	input d,	// d ���� ��������
	output out // ����� ��������
);

// �� ��������� ������ clk ���������� ������� ������ d �� ����� out
always_ff @(posedge clk)
	out <= d;
endmodule