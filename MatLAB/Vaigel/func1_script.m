%% ��������� ��� ������� y=A*(exp(-t/t1)-exp(-t/t2))
t1=16;
t2=5;
A=1;
t_step=1;
t_max=100; 
t0=-10;
%% ���������� ��� �������
k=8;
l=5;
M=16;
%% ����� �������
[y, t]=func1(A, t1, t2, t_step, t_max, t0);
[s]=func1_filter(y, k, l, M);
%% ���������� �������
subplot(1,2,1);
plot(t,y);
grid on;
title('�������');
xlim([t0,t_max]);
xlabel('t');
ylabel('y(t)');
subplot(1,2,2);
plot(t,s);
grid on;
title('��������������� ������');
xlabel('t');
ylabel('s(t)');
xlim([t0,t_max]);