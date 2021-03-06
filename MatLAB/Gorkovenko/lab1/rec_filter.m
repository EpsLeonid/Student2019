function [s] = rec_filter(v,k,l,M)
%�������� ����������� ��������
n = length(v);
d = zeros(1,n); 
p = zeros(1,n);
r = zeros(1,n);
s = zeros(1,n);

% ������� ��������� �������
d(1) = v(1);
p(1) = d(1);
r(1) = p(1)+M*d(1);
s(1) = r(1);

for i = 1 : n
    d(i) = v(i);
    
    if( i-k > 0 )
        d(i) = d(i) - v(i-k);
    end
    
     if( i-l > 0 )
        d(i) = d(i) - v(i-l);
     end
     
     if( i-l-k > 0 )
        d(i) = d(i) + v(i-k-l);
    end
     
    
    for i = 2 : n
    p(i) = p(i-1) + d(i);
    r(i) = p(i) + M*d(i);
    s(i) = s(i-1) + r(i);
    end
   
end
