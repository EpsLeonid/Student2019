%переменные для функции test1
t=-10:1:100;
A=1;
T1=16;
T2=5;
y=test1(t,A,T1,T2);
subplot(2,1,1);
plot (t,y);
%переменные для фильтра
k=6;
l=6;
m=16;
s=test2(k,l,m,y);
subplot(2,1,2);
plot (t,s);