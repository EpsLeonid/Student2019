function y = Exp1(t, A, b1, b2)
    for i=1:length(t)
    if t(i)<0
        y(i)=0;
    else
        y(i)=A*(exp(-t(i)/b1)-exp(-t(i)/b2));
    end
    end
    