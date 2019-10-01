%Построение графика трапецеидального фильтра

function [s] = first_three (v, k, l, M)

%Задание массивов
[d] = 0;
[p] = 0;
[r] = 0;
[s] = 0;

%d(n) = v(n)-v(n-k)-v(n-l)+v(n-k-l)
for i = 1:length(v) 
    d(i)=v(i);
    if(i-k>=1)
        d(i)=d(i)-v(i-k); 
    end
    if (i-l>=1)
        d(i)=d(i)-v(i-l);
    end
    if(i-l-k>=1)
        d(i)=d(i)+v(i-l-k);
    end
end
    
%Определение первых элементов массива 
p(1) = d(1);
r(1) = p(1) + M*d(1);
s(1) = r(1);

%Заполнение массивов p, r и s
for  i = 2:length(v)
        p(i) = p(i-1)+d(i);
        r(i) = p(i)+M*d(i);
        s(i) = s(i-1)+r(i);    
end
end

