%����� ������� ��� y
function [y]=test1(t,A,T1,T2)
%t - ���������� �� x
%A - ���������
%T1,T2 - ����������
%������� ������� �������
k=length(t); %���������� ��������� ������� t
y=1:k; %������ y(k)
for i=1:k
    if (t(i)>0)
        y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));
    else
        y(i)=0;
    end
end
end