function [y,t] = func1(A, t1, t2, t_step, t_max, t0)
%�������, ������� ���������� ������ ����� � ������ ������ �������� �������
%   A - ���������
% t1, t2 - �����, ������� ���������
% y - �������� ��������, ������������� �� ��� �
% t - �������� ��������, ������������� �� ��� �
% t0=-10 - ��������� ��������
% t_max=100 - ������������ ��������
%t_step=1 - ���
t=t0:t_step:t_max;
for i = length(t):-1:1 %������� ������������� ������������ ��������, ����� � ����� �� ������� ������ �������
    if t(i)<0
        y(i)=0;
    else 
        y=A*(exp(-t./t1) - exp(-t./t2));
    end
end
end

