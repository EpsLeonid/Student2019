function S = filtrFun(k,l,M,Y,tMin,tMax,dt)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    for i=1:dt:tMax-tMin+1
        if(i>l)
            yl=Y(i-l);
        else
            yl=0;
        end
        
        if(i>k)
            yk=Y(i-k);
        else
            yk=0;
        end
        if(i>k+l)
            ykl=Y(i-k);
        else
            ykl=0;
        end
        d(i)=Y(i)-yl-yk-ykl;
        
        if(i>1)
            pl=p(i-1);
        else
            pl=0;
        end
        
        p(i)=pl+d(i);
        r(i)=p(i)+M*d(i);
        if(i>1)
            sl=S(i-1);
        else
            sl=0;
        end
        S(i)=sl+r(i);
    end
end

