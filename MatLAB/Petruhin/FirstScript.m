%������� ����������
A=1;
t1=16;
t2=5;
tstep=1;
tmin=-10;
tmax=100;
%����������� �������
[t,y]=First(A, t1, t2, tstep, tmin, tmax);
%�������� �������
plot(t,y);
grid on;
%���������� �������� �������
xlim([tmin,tmax]);
ylim([min(y)-0.01,max(y)+0.01]);
%������������ ����
xlabel('t');
ylabel('y(t)');