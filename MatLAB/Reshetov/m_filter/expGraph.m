%Определение параметров и заполнение функции
tau1 = 16;
tau2 = 5;
A = 1;
t = -10:1:100;
y = doExp(tau1, tau2, A, t);

%Параметры фильтра
l = 6;
k = 13;
m1 = 15;
m2 = 1;

y1 = m_filter(l, k, m1, m2, y);
figure;
plot(t, y);
grid on;
figure;
plot(t, y1);
grid on;
