%модифицированный cusp - like фильтр реализован с помощью функции CuspLikeFilter
%k, l, m1, m2 - константы


function y = CuspLikeFilter(k,l,m1,m2,z)

[dk,dl,q,p,s] = deal(zeros(1,length(z)));

    for i = 1:length(z)
        dk(i)=z(i);
        dl(i) = z(i);
        
      if ((i-k)>0)
          dk(i) = z(i) - z(i-k);
      end
      
       if ((i-1)> 0)
           dl(i) = z(i) - z(i-1);
       end;
        
       if ((i-1-l)> 0)
           dl(i) = z(i-l) - z(i-1-l);
       end
    end
    
    p(1) = dk(1);
    q(1)=m2*p(1);
    s(1)=q(1)+m1*p(1);
    
      for i = 2:length(z)
        p(i) = p(i-1)+dk(i)-k*dl(i);
        q(i) = q(i-1)+m2*p(i);
        s(i) = s(i-1)+q(i)+m1*p(i);
       y(i) = s(i);    
    end
       