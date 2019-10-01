%% ������� ����������: Y = f_exp(t, t1, t2, A);
% t - ������ ����� ������������� �� ��� X.
% Y - �������� ������ ����� ������������� �� ��� Y.
% ������ �������� ������� Y ��� t >= 0 ����������� �� �������: 
% Y(i) = A * ( exp(-t(i)/t1) - exp(-t(i)/t2) ).
% ��� t < 0 �������� ������� ����� 0.
% ����������� Y ��������� � �������� t.
% t1, t2 � ���������� �������. (t1, t2 > 0)
% A � ��������� �������. (A>0)
%% 
function massY = f_exp (t, t1, t2, A) 
    n = numel(t);
    massY = zeros(1,n);     
    for i=1:n
        if(t(i)>0)
            massY(i) = A * ( exp(-t(i)/t1) - exp(-t(i)/t2) );
        end
    end    
end