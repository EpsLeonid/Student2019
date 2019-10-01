k = 7;
l = 7;
M = 16;
d(n) = u(n)-u(n-k)-u(n-l)+u(n-k-l);
p(n) = p(n-1)+d(n);
r(n) = p(n)+M*d(n);
s(n) = s(n-1)+r(n);
