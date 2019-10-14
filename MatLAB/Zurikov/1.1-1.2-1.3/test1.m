%введём функцию для y
function [y]=test1(t,A,T1,T2)
%t - координата по x
%A - амплитуда
%T1,T2 - постоянные
%зададим условия функции
k=length(t); %количество элементов массива t
y=1:k; %вектор y(k)
for i=1:k
    if (t(i)>0)
        y(i)=A*(exp(-t(i)/T1)-exp(-t(i)/T2));
    else
        y(i)=0;
    end
end
end