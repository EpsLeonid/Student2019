function outArray = doExp(tau1, tau2, A, t)
%Функция, которая заполняет массив значениями экспоненты.
    k = length(t);
    for i = 1:k % цикл
        if(t(i) < 0)
            outArray(i) = 0;
        else
            outArray(i) = A * (exp(-t(i)/tau1) - exp(-t(i)/tau2));
        end
    end
        