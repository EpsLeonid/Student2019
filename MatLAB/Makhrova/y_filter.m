function y = filter(l, k, m1, m2, v)%функция фильтра
   %задам значения параметров
   dk = 0;
   dl = 0;
   p = 0;
   q = 0;
   s = 0;
    
for n = 1:length(v)%заполнение массивов для dl, dk
        dk(n) = v(n);
        dl(n) = v(n);
        if(n - k > 0)
            dk(n) = v(n) - v(n - k);
        end
        if(n - 1 > 0)
            dl(n) = v(n) - v(n - 1);
        end
        if(n - 1 - l > 0)
            dl(n) = v(n - l) - v(n - l - 1);
        end
    end
    
    p(1) = dk(1);
    q(1) = m2 * p(1);
    s(1) = q(1) + m1 * p(1);
    
for n = 2:length(v)%заполнение массивов для p, q, s
       p(n) = p(n - 1) + dk(n) - k * dl(n);
       q(n) = q(n - 1) + m2 * p(n);
       s(n) = s(n - 1) + q(n) + m1 * p(n);
       y(n) = s(n);
    end
end
   