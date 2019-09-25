function [Y,T] = genFun(tay1,tay2,A,tMin,tMax,dt)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
for i=1:dt:tMax-tMin+1
    T(i)=i+tMin-1;
    Y(i)=yFun(T(i),A,tay1,tay2);
end
end

