function y = Fexp(tau1, tau2, A, t) %задаём функцию 
    k = length(t); %длинна масса 
    for n = 1:k
    if(t(n) < 0)
    y(n) = 0;
        else
            y(n) = A * (exp(-t(n)/tau1) - exp(-t(n)/tau2));
        end
    end
        