%% Установка констант для f_exp
xMin = -1;
xMax = 298;
x = xMin:xMax;
t = 5;
t1 = 16;
t2 = 5;
A = 1;

%% Установка констант для f_filter
K = 9;
L = 5;
M = 16;

%% Установка экрана и натроек текста
figure('Units', 'normalized', 'OuterPosition', [0 0 1 1]);
set(0,'DefaultAxesFontSize',14,'DefaultAxesFontName','Times New Roman');

%% Вычисления
y = f_exp(x, t1, t2, A);
y2 = f_filter(y, K, L, M, false, x);
maxY = max(y);

%% Построение графиков в разных плоскостях
%% draw f_exp
subplot(1, 2, 1);
plot(x, y, 'b-', 'LineWidth', 2);
f_graph_settings('Function Exp', true, 'Time', 'Signal', xMin, xMax, 0, maxY);

%% Построение f_filter
subplot(1, 2, 2);
plot(x, y2, 'b-', 'LineWidth', 2);
f_graph_settings('Function Filter', true, 'Time', 'Signal', xMin, xMax, 0, maxY);
pause();

close();