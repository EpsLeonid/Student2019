t = [-10 : 1 : 100 ];
plot(t,f(t,16,5));
grid on;
t_max = max(t);
t_min = min(t);
xlim([t_min,t_max]);