%%��������� ������� 
A=1;   
t1=16;
t2=5;
ts=1; %%���
t0=-10;
tmax=100;
%%��������� �������
k=9;
l=5;
M=16;
%%���� ������� 
[y,t]=f(A,t1,t2,ts,t0,tmax);
[s]=f_filter(y,k,l,M);
%%���������� ��������
plot(t,y);
grid on;
figure;
plot(t,s);
grid on;