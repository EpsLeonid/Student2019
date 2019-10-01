function outArray = m_filter(l, k, m1, m2, y)
%функция фильтра
    [dk, dl, p, q, s] = deal(zeros(1, length(y))); %определение параметров фильтра
    for n = 1:length(y) %заполнение массивов для первых двух параметров
        dk(n) = y(n);
        dl(n) = y(n);
        if(n - k > 0)
            dk(n) = y(n) - y(n - k);
        end
        if(n - 1 > 0)
            dl(n) = y(n) - y(n - 1);
        end
        if(n - 1 - l > 0)
            dl(n) = y(n - l) - y(n - l - 1);
        end
    end
    
    %Задаём первые первые элементы для рекурсивной формулы
    p(1) = dk(1);
    q(1) = m2 * p(1);
    s(1) = q(1) + m1 * p(1);
    
    for n = 2:length(y) %заполнение параметров с помощью рекурсивной формулы
       p(n) = p(n - 1) + dk(n) - k * dl(n);
       q(n) = q(n - 1) + m2 * p(n);
       s(n) = s(n - 1) + q(n) + m1 * p(n);
       outArray(n) = s(n);
    end
end
   