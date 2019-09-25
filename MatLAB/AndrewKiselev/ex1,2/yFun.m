function [y] = yFun(t,A,tay1,tay2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    if (t>0)
        y=A*(exp(-t/tay1)-exp(-t/tay2));
    else
        y=0;
    end
end

