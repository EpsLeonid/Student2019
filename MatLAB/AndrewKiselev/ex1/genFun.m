function [Y,T] = genFun(tay1,tay2,A,tMin,tMax,dt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i=1:dt:tMax-tMin+1
    T(i)=i+tMin-1;
    if (T(i)>0)
        Y(i)=A*(exp(-T(i)/tay1)-exp(-T(i)/tay2));
    else
        Y(i)=0;
    end
end
end

