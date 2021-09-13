for h = [1/5, 1/20, 1/100] % шаг
    x = 0 : h : 1; % промежуток, на котором будет искаться решение
    n = length(x);
    y = zeros(1, n);
    y(1) = 1;
    
    % Метод Эйлера
    for i = 1 : n - 1
        y(i + 1) = y(i) + h*x(i)^2;
    end
    
    % Построение графиков
    figure()
    hold on, grid on;
    plot(x, y, 'r')
    plot(x, arrayfun(@(x) x.^3/3+1, x), 'b')
    title(sprintf('Шаг равен %f', h));
    legend('Численное решение ОДУ методом Эйлера', 'Аналитическое решение ОДУ')
end