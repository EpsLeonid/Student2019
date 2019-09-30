function [s]=task3(v,k,l,m)
% количество эллементов n
n=length(v);
[d,p,r,s]=deal(zeros(1,n)); % zeros задает массив 
% deal присваивает переменным [d,p,r,s] результат функции zeros
% Задается преобразование формулы для каждой переменной 
d(n)
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

% Нормируем результирующий график треугольного фильра 
mV=max(v);
mS=max(s);
for i=1:n
s(i)=mV*s(i)/mS;
end
end
