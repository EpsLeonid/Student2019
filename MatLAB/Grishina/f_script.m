t1 = 16;
t2 = 5;
A = 1; 
tstep = 1;
t0 = -10;
tmax = 100;
t=t0:tstep:tmax;
[y] = f(t1, t2, A,t)

plot(t,y)
grid on;
