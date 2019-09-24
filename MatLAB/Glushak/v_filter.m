function [s]=v_filter(v,k,l,m)
%Фильтр для функции y=A*(exp(-t/t1)-exp(-t/t2))
%Фильтр-трапециадальный
%Формулы расчета фильтра
%d(n)=v(n)-v(n-k)-v(n-l)+v(n-k-l)
%p(n)=p(n-1)+d(n)
%r(n)=p(n)+M*d(n)
%s(n)=s(n-1)+r(n)
%s-выходной аргумент
%k,l,m-параметры: k=8, l=5, m=16
n=length(v);%n-количество элементов
[d,p,r,s]=deal(zeros(1,n));%zeros задает массив с нулями
%deal присваивает переменным d,p,r,s результат функции zeros
%Формулы для расчета задают рекурсивную формулу
%Для каждого n-k, n-l, n-k-l свое преобразование формулы d(n)
for i=1:n
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
p(1)=d(1);
r(1)=p(1)+m*d(1);
s(1)=r(1);
for i=2:n
    p(i)=p(i-1)+d(i);
    r(i)=p(i)+m*d(i);
    s(i)=s(i-1)+r(i);
end
%%Нормировка графика фильтра
mV=max(v);
mS=max(s);
for i=1:n
    s(i)=mV*s(i)/mS;
end
end