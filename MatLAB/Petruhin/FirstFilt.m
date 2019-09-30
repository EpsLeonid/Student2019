function[s] = FirstFilt(K, L, M, u)%озаглавили функцию
[dkl,p,r,s,u0,u1,u2,u3] = deal(zeros(1,numel(u)));%создали массивы
for i=1:1:length(u)%запустили главный цикл
    u0(i)=u(i);%начали считать элементы dkl
    if(i-K>0)
        u1(i)=u(i-K);
    end
    if(i-L>0)
        u2(i)=u(i-L);
    end
    if(i-K-L>0)
        u3(i)=u(i-K-L);
    end
    dkl(i)=u0(i)-u1(i)-u2(i)+u3(i);%завершили рассчет dkl, начинаем считать жлементы s
    if(i-1>0)
    p(i)=p(i-1)+dkl(i);
    end
    r(i)=p(i)+M*dkl(i);
    if(i-1>0)
    s(i)=s(i-1)+r(i);%рассчет s окончен
    end 
end
end