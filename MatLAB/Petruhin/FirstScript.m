%������� ����������
A=1;
t1=16;
t2=5;
tstep=1;
tmin=-10;
tmax=100;
K=7;
L=7;
M=16;
%����������� �������
[t,y]=First(A, t1, t2, tstep, tmin, tmax);
[s]=FirstFilt(K,L,M,y);
%�������� �������
subplot(1,2,1);
plot(t,y);
grid on;
%���������� �������� �������
xlim([tmin,tmax]);
ylim([min(y)-0.01*max(y),max(y)+0.01*max(y)]);
%������������ ����
xlabel('t');
ylabel('y(t)');
%��� ������� �������
subplot(1,2,2);
plot(t,s);
grid on;
xlim([tmin,tmax]);
ylim([min(s)-0.01*max(s),max(s)+0.01*max(s)]);
xlabel('t');
ylabel('s(t)');
