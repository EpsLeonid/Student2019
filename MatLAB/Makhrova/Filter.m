function m = Filter(l, k, m1, m2, y)%функция фильтра
  
    [dk, dl, p, q, m, s] = deal(zeros(1, length(y)));  %задам значения параметров
  
    for n = 1:length(y)%заполнение массивов для dl, dk
        dk(n) = y(n);
        dl(n) = y(n);
        if(n - k > 0)
            dk(n) = y(n) - y(n - k);
        end
        if(n - 1 > 0)
            dl(n) = y(n) - y(n - 1);
        end
        if(n - l - 1 > 0)
            dl(n) = y(n - l) - y(n - l - 1 );
        end
    end
    
    p(l) = dk(l); %задам первые элементы 
    q(l) = m2 * p(l);
    s(l) = q(l) + m1 * p(l);
    
   for n = 2:length(y)%заполнение массивов для p, q, s
       p(n) = p(n - 1) + dk(n) - k * dl(n);
       q(n) = q(n - 1) + m2 * p(n);
       s(n) = s(n - 1) + q(n) + m1 * p(n);
       m(n) = s(n);
    end
end
   