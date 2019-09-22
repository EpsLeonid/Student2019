function outArray = doExp(tau1, tau2, A, t)
    k = length(t);
    for i = 1:k
        if(t(i) < 0)
            outArray(i) = 0;
        else
            outArray(i) = A * (exp(-t(i)/tau1) - exp(-t(i)/tau2));
        end
    end
        