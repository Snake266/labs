A = [-12, 5, 0, 0, 0;...
    6, 10, 1, 0, 0; ...
    0, 6, -10, 2, 0; ...
    0, 0, -4, -7, 1; ...
    0, 0, 0, 3, 8];
f = [1, -3, 5, 7, -3]';
n = length(A);

% Проверяем диагональное преобладание
% Если условие не будет выполнено, то возникнет ошибка
for i = 2 : n-1
  if (abs(A(i, i)) < abs(A(i, i-1)) + abs(A(i, i + 1)))
    error("Не выполнено достаточное условие");
  end
end

if (abs(A(1, 1)) < abs(A(1, 2)) && abs(A(n, n)) < abs(A(n, n-1)))
  error("Не выполнено достаточное условие");
end

%Прогоночные коэффициенты
alfa(1) = -A(1, 2)/A(1, 1);
beta(1) = f(1)/A(1,1);
for i = 2 : n-1
  alfa(i) = -A(i, i+1)/(A(i, i) + A(i, i-1)*alfa(i-1));
  beta(i) = (f(i)-A(i, i-1)*beta(i-1))/(A(i, i) + A(i, i-1)*alfa(i-1));
end
beta(n) = (f(n) - A(n, n-1) * beta(n-1))/(A(n, n) + A(n, n-1) * alfa(n-1));


%Корни
x(n) = beta(n);
for i = n-1 : -1 : 1
  x(i) = alfa(i) * x(i+1) + beta(i);
end

x
alfa, beta
