%%известные данные 
A=1;   
t1=16;
t2=5;
t0=-10;
tmax=100;
ts=1;
%%Функция
[y,t]=f(A, t1, t2, t0, tmax, ts);
%%вывод
plot(t,y);
grid on;