script
clc; clear; close all; format short;
%% ������������� ����������
t = -10:100; % ��������� ������
A = 1; % ����������� ��������� �������� �������
tau1 = 16; % ���������� ������� 1 �������� ������� 
tau2 = 5; % ���������� ������� 2 �������� ������� 
k = 7; % ����� 1 �������
l = 7; % ����� 2 ������� 
M = 16; % ��������� �������
%% ��������� � ��������
y = diff_of_exps(t, tau1, tau2, A); % ������ �������� �������
s = resp_of_tri_filter(y, k, l, M); % ������ ������� �������
%% ���������� ������� 
yyaxis left
plot(t, y) % ������� ������
grid on; grid minor;
xlabel('t')
ylabel('y (t)')
yyaxis right
plot (t, s) % �������� ������
ylabel('s(t)')

