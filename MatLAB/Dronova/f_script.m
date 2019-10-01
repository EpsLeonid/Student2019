%%Параметры функции 
A=1;   
t1=16;
t2=5;
ts=1; %%Шаг
t0=-10;
tmax=100;
%%Параметры фильтра
k=9;
l=5;
M=16;
%%Ввод функции 
[y,t]=f(A,t1,t2,ts,t0,tmax);
[s]=f_filter(y,k,l,M);
%%Построение графиков
plot(t,y);
grid on;
figure;
plot(t,s);
grid on;