tau1 = 16; %����������� ���������� 
tau2 = 5;
A = 1;
t = -10:1:100; %��������� ������� 
y1 = Fexp(tau1, tau2, A, t); %������ �������

l = 6; %��������� �������
k = 13;
m1 = 15;
m2 = 1;

y2 = filter(l, k, m1, m2, y1);
plot(t, y1, 'b');%������ ������
figure;
plot(t, y2, 'r');

