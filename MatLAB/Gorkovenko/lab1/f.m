function y=f(t,t1,t2)
A= 1; %���������
y=0.*(t<0) + A*(exp(-t/t1)-exp(-t/t2)).*(t>=0); %������� �������
end
