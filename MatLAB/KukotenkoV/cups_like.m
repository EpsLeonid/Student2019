function Graph=cups_like(l,k,m1,m2,y)
[dk, dl, p, q, s]=deal(zeros(1,length(y)));
for i=1:length(y)
    dk(i) = y(i);
    dl(i) = y(i);
    if(i-k >0)
        dk(i)=y(i)-y(i-k);
    end
    if(i - 1 > 0)
            dl(i) = y(i) - y(i - 1);
    end
    if(i - 1 - l > 0)
            dl(i) = y(i - l) - y(i - l - 1);
    end
    end
p(1)=dk(1);
q(1)=m2*p(1);
s(1)=q(1)+m1*p(1);
for i=2:length(y)
    p(i)=p(i-1)+dk(i)- k * dl(i);
    q(i)=q(i-1)+m2*p(i);
    s(i)=s(i-1)+q(i)+m1*p(i);
    Graph(i)=s(i);
end

end 