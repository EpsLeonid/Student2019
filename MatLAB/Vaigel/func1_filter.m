function [ s ] = func1_filter( v,k,l,M )
% ��������������� ������ ��� ������� y=A*(exp(-t/t1)-exp(-t/t2)) 
% s - �������� ��������, ������� ������������� �� ��� Y
% k, l, M - ������� ��������� �������
% ������� ��� �������:
% d(n) = v(n) - v(n - K)- v(n - L)+ v(n - K - L);
% p(n) = p(n-1) + d(n);
% r(n) = p(n) + M*d(n);
% s(n) = s(n-1) + r(n);
% ����� ��������� � �������:
n = numel(v); 
% �������� �������� ����� ����������� ��� ���������� ������
[d,p,r,s] = deal(zeros(1,n)); 
% ������� deal ����������� ���������� d, p, r, s �������� ������� � ������ n 
% ������� zeros ��������� ������ ������
for i=1:n %����� d(n), ��� ������ k,l
    d(i) = v(i);
    if(i-k>= 1)
        d(i) = d(i) - v(i - k);
    end
    if(i-l >= 1)
        d(i) = d(i) - v(i - l);
    end
    if(i-l-k>= 1)
        d(i) = d(i) + v(i - l - k);
    end
end
% ������� ������ ���������
p(1) = d(1);
r(1) = p(1) + M*d(1);
s(1) = r(1);
for i=2:n
    p(i) = p(i-1) + d(i); % ����� p(n)
    r(i) = p(i) + M*d(i); % ����� r(n)
    s(i) = s(i-1) + r(i); % ����� s(n)
end
end

 