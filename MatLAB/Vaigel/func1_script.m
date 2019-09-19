%% Константы для функции y=A*(exp(-t/t1)-exp(-t/t2))
t1=16;
t2=5;
A=1;
t_step=1;
t_max=100; 
t0=-10;
%% Вызов функций
[ y, t ] = func1(A, t1, t2, t_step, t_max, t0);
%% Построение графика
plot(t,y);
grid on;
xlim([-10,100]);
xlabel('t');
ylabel('y(t)');