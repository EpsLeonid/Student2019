script
clc; clear; close all; format short;
%% Инициализация переменных
t = -10:100;
A = 1;
tau1 = 16;
tau2 = 5;
%% Обращение к функции
y = diff_of_exps(t, tau1, tau2, A);
%% Построение графика 
plot(t,y)
grid on; grid minor;
xlabel('t')
ylabel('y (t)')