function S = filtrFun(k,l,M,v,tMin,tMax,dt)
%Òğåóãîëüíûé ôèëüòğ 
%d(n)=v(n)-v(n-k)-v(n-l)+v(n-k-l),
%p(n)=p(n-1)+d(n),
%r(n)=p(n)+M*d(n),
%s(n)=s(n-1)+r(n),
%
    for i=1:dt:tMax-tMin+1
        if(i>l)
            vl=v(i-l);%vl - v(n-l)
        else
            vl=0;
        end
        
        if(i>k)
            vk=v(i-k);%vk - v(n-k)
        else
            vk=0;
        end
        
        if(i>k+l)
            vkl=v(i-k-l);%vkl - v(n-k-l)
        else
            vkl=0;
        end
        d(i)=v(i)-vl-vk+vkl;
        
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

