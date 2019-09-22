function[t,y] = First(A, t1, t2, tstep, tmin, tmax)%озаглавили ункцию
t=tmin:tstep:tmax;%обозначили массив t
y(1:length(t))=0;%обозначили массив y, установив ему размер массива t
for n=1:1:((tmax-tmin)/tstep)+1%начали цикл от 1 до (tmax-tmin)/tstep с шагом 1
    if(t(n)<0)%условие на отрицательную часть оси t
        y(n)=0;
    end
    if(t(n)>=0)%заполнение положительной части оси t
        y(n)=A*(exp(-t(n)./t1) - exp(-t(n)./t2));
    end
end
end
    
    
