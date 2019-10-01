%������� Exp1 �������� ����������� ������� �����
%�������������� ������� y=0 ���� t<0 � y=A*(exp(-t/b1)-exp(-t/b2))
function Graph = Exp1(t, A, b1, b2) 
    for n=1:length(t)
    if (t(n)<0)
        Graph(n)=0;
    else
        Graph(n)=A*(exp(-t(n)/b1)-exp(-t(n)/b2));
    end
    end
    