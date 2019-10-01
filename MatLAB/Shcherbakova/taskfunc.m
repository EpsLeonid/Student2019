function [s] = taskfunc( k, l, M, z)
%создание необходимых массивов
n = length(z);
d = zeros(1,n); 
p = zeros(1,n);
r = zeros(1,n);
s = zeros(1,n);
 
% задание начальных условий
d(1) = z(1);
p(1) = d(1);
r(1) = p(1)+M*d(1);
s(1) = r(1);
 
for i = 1 : n
    d(i) = z(i);
    
    if( i-k > 0 )
        d(i) = d(i) - z(i-k);
    end
    
     if( i-l > 0 )
        d(i) = d(i) - z(i-l);
     end
     
     if( i-l-k > 0 )
        d(i) = d(i) + z(i-k-l);
    end
     
    
    for i = 2 : n
    p(i) = p(i-1) + d(i);
    r(i) = p(i) + M*d(i);
    s(i) = s(i-1) + r(i);
    end
   
end
