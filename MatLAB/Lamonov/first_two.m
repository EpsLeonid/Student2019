%���������� ������� �� ������� �1 ������ 1 ��� ��������� ������� ������

%������� ������� ������
t1 = 16;
t2 = 2;
t = -10:1:100; %������ t. ��������: ���. - -10, ��� - 1, ���. - 100

k = 10;
l = 5;
M = 16;

%������ m-������� �� ����� "first_one"
y = first_one(t1,t2,t);

%������ m-������� �� ����� "first_three"
z = first_three(y,k,l,M);

%����� �������, ���������������� � "first_one" ���� �������
plot(t, y, 'r-x')
figure;
%����� ������� ���������������� ������� �� "first_three"
plot(t, z, 'b-x')