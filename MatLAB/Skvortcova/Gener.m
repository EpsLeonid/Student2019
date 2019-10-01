%file function generate massiv chisel dlia grafika po formule nije
function [ Data, t ] = Gener(t_n,t_k,A,tau1,tau2 )

%tau1=16 %znachenie tau odin iz dano
%tau2=5 %znachenie tau dva iz dano
%t_n=-10 %znachenie nachala predela iz dano
%t_k=100 %konechnoe znachenie predela iz dano

%zadanie massivov
Data = []
t = []
%predeli iz hidera
for i = t_n:t_k
    A=1; %amplituda iz dano
if (i<0)
    y=0
else
    %function iz zadania
    y=A*(exp(-i/tau1)-exp(-i/tau2))

end
%zapolnenie massivov(vihodnie dannie), i-t_n+1 ltkftn massiv ot 0, a ne ot
%-10
Data (i-t_n+1) = y
t (i-t_n+1) = i
end
end

