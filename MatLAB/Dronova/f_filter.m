%% Функция фильтра: s = f_Filter(v, K, L, M);
% s - выходной массив чисел откладываемых по оси Y.
% v - массив значений функции сигнала в области t. 
% K, L, M - константы соответствующие выбранному фильтру.
% Тип фильтра — трапецеидальный.
% Расчет выполняется по формулам:
% d(n) = v(n) - v(n - K)- v(n - L)+ v(n - K - L);
% p(n) = p(n-1) + d(n);
% r(n) = p(n) + M*d(n);
% s(n) = s(n-1) + r(n);
% Для значений массива s выполняется нормировка по максимуму сигнала v.
% isDebug - флаг отладки. При значении true будет включен режим 
% отладки, в котором будет выполнено построение графиков 
% функций d, p и r в области debugT на каждом этапе вычислений. 
% После каждого построения графика вызывается pause();
%% 
function s = f_filter (v, K, L, M, isDebug, debugT) 
    n = numel(v);
    [d, p, r, s] = deal(1:n);
    % Функция d(n)
    for i=1:n
        % d(n) = 0: n<0
        d(i) = v(i);
        if(i-K >= 1)
           d(i) = d(i) - v(i - K);
        end        
        if(i-L >= 1)
           d(i) = d(i) - v(i - L);
        end
        if(i-L-K >= 1)
           d(i) = d(i) + v(i - L - K);
        end
    end  
       
    % Функции p, r и s
    % p(n)=0, s(n)=0 : n<0
    p(1) = d(1);
    r(1) = p(1) + M*d(1);
    s(1) = r(1);
    for i=2:n
        p(i) = p(i-1) + d(i);
        r(i) = p(i) + M*d(i);
        s(i) = s(i-1) + r(i);
    end 
    
    % Найдем максимумы массивов v и s и нормализуем s
    maxV = max(v);
    maxS = max(s);
    for i=1:n
        s(i) = maxV * s(i) / maxS;
    end
    
    % debug
    if(isDebug)        
        plot(debugT, d, 'b-', 'LineWidth', 2);
        graphSettings('Function d');
        pause();
        plot(debugT, p, 'b-', 'LineWidth', 2);
        graphSettings('Function p');
        pause();
        plot(debugT, r, 'b-', 'LineWidth', 2);
        graphSettings('Function r');
        pause();
    end
end

function graphSettings(name)
    grid on;
    title(name);
    xlabel('Time'); 
    ylabel('Signal');
end