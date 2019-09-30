function  s  = resp_of_tri_filter(v, k, l, M)
%RESP_OF_TRI_FILTER Треугольный фильтр с параметрами k, l, M
%   s - реакция фильтра на входной сигнал
%   v - входной сигнал
%   k, l - значения сдвига
%   M - множитель 
N = length(v);
%% Рассчёт вектора d
v_k = [zeros(1, k) v(1:end-k)];
v_l = [zeros(1, l) v(1:end-l)];
v_k_l = [zeros(1, l+k) v(1:end-l-k)];
d = v - v_k - v_l + v_k_l;
%% Расчет вектора p
p = d(1);
for n = 2:N
    p (n) = p(n-1) + d(n);
end
%% Расчёт вектора r
r = p + M*d;
%% Расчёт вектора s
s = r(1);
for n = 2:N
    s(n) = s (n-1) + r(n);
end
