% ������� 2, ���������� ��� ������� task1
t=-10:1:100;
A=1;
tau1=16;
tau2=5;
%���� ���������� ��� ������������ ������� 
k=8;
l=5;
m=16;
% ������ ������� 
y=task1(tau1,tau2,A,t);
s=task3(y,k,l,m);
% ������ ������� 
plot(t, y, 'r');
figure;
plot(t,s,'g');
