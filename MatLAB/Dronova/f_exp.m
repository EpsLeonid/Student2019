function [y,t]=f(A, t1, t2, t0, tmax, ts)
%t-ось x
%y-ось у
%Строим от t0 до tmax с шагом ts
t=t0:ts:tmax;
%Алгоритм смещения элементов вектора с шагом -1
for i=length(t): -1:1 
    if t(i)<0
        y(i)=0;
    else
        y=A*(exp(-t/t1)-exp(-t/t2));
    end
end

