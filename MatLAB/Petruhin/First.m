function[t,y] = First(A, t1, t2, tstep, tmin, tmax)%���������� ������
t=tmin:tstep:tmax;%���������� ������ t
y(1:length(t))=0;%���������� ������ y, ��������� ��� ������ ������� t
for n=1:1:((tmax-tmin)/tstep)+1%������ ���� �� 1 �� (tmax-tmin)/tstep � ����� 1
    if(t(n)<0)%������� �� ������������� ����� ��� t
        y(n)=0;
    end
    if(t(n)>=0)%���������� ������������� ����� ��� t
        y(n)=A*(exp(-t(n)./t1) - exp(-t(n)./t2));
    end
end
end
    
    
