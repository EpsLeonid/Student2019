t=-10:1:100; %������
A=1; %���������
b1=16;
b2=5;
y = Exp1(t, A, b1, b2); %����� �������

%��������� �������:
l = 6;
k = 13;
m1 = 16;
m2 = 1;

%���������� ��������
y1 = cups_like(l,k,m1,m2,y);
figure;
plot(t, y);
grid on;
%hold on;
figure;
plot(t, y1);
% hold on;
grid on;

