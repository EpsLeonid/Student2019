function [ y,t ] = task (A, t1, t2, t_i, t0, t_max)
%�������, ������������ ������ ����� � �������� �� ������
%   A-���������
%   t1, t2 - ����� 
%   t_i-�����
%   t0, t_max - ��������� ��������
%   y,t - ��������, ������������� �� ����
t=t0:t_i:t_max;
for i = length(t): -1: 1
    if t(i)<0
        y(i)=0;
    else
        y=A*(exp(-t./t1)-exp(-t./t2));
   
end
end
