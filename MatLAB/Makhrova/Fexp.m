function [y] = Fexp(tau1, tau2, A, t) %����� ������� 
     j=length(t);%������ �����
    y = 1:j;
    for i=1:j
        if t(i)<0
            y(i)=0;
     else
            y(i) = A * (exp(-t(i)/tau1) - exp(-t(i)/tau2));
        end
    end
        