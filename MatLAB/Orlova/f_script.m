%%������� 
A=1;   
t1=16;
t2=5;
t0=-10;
tmax=100;
ts=1;
%%������
k=10;
l=5;
M=16;
%%�������
[y,t]=f(A, t1, t2, t0, tmax, ts);
[s] = f_filter(y,k,l,M);
%%�����
plot(t,y);
grid on;
figure;
plot(t,s);
grid on;