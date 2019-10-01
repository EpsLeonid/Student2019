%Filter for function varianta 10
function [ s ] = Filter( v )
%UNTITLED Summary of this function goes here
% parametry k,l,M dlya trapeceidal'nogo fil'tra 
k=10
l=6
M=16
%sozdanie massivov
d = []
p = [0]
r = [0]
s = [0]
%leigth - kol-vo peremennih massiva v
for i=1:length(v)
    disp(i)
       if (i>1)
        d(i) = v(i)
       end
       
    if (i>l)
        d(i) = v(i)-v(i-l)
    end
%po hody usloviy if otsekautsia (zanul) lihnie elementi    
     if (i>k)
       d(i) = v(i)-v(i-k)-v(i-l)
     end
    
    if (i>k+l)
    d(i) = v(i)-v(i-k)-v(i-l)+v(i-k-l)
    end 
%formuli iz zadania (i podgliad v stat)
  if (i>1)
     p(i)=d(i)+p(i-1)
     r(i)=p(i)+M*d(i)
     s(i)=r(i)+s(i-1)
  end
    
    if(i==1)
        d(i) = v(i)
        p(i)=d(i) 
        r(i)=p(i)+M*d(i)
        s(i)=r(i)
    end
%s-vihodnoi argument otklad po osi Y    
end
    end
