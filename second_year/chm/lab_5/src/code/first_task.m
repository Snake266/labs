f = @(x) x.^3; % Функция
a = 0; b = 1; % Границы
x = linspace(0, 1, 10); % Промежуток
h = x(2) - x(1); % Шаг разбиения
re = 1/4;
M2_f = 6; %max|f''(x)|, [x(i-1),x(i)]

simpson(f, x, h)
trapeze(f, x, h)
teor_eps_trapeze = M2_f * (b - a) * h^2/12
eps_simpson = abs(simpson(f, x, h) - re)
eps_trapeze = abs(trapeze(f, x, h) - re)

%Погрешности:
Q = @(x)x.^2;
L = @(x)x/2;
disp('Ошибка для квадратичной функции:')
abs(simpson(Q, x, h) - 1/3)
disp('Ошибка для линейной функции:')
abs(simpson(L, x, h) - 1/4)
