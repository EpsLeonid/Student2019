tay1=16;
tay2=5;
A=1;%amplitude%
t1=-10;%t lower bound%
t2=100;%t upper bound%
dt=1;%t step%
k=6;
l=6;
M=16;
[Y,T]=genFun(tay1,tay2,A,t1,t2,dt);
S=filtrFun(k,l,M,Y,t1,t2,dt);
subplot(2,1,1);
plot(T,Y);
subplot(2,1,2);
plot(T,S);