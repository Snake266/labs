n = 5; %Кол-во измерений
x = [2 : 6];
y = [17.2, 45.5, 96.5, 175.8, 288.9];

s(1,1) = n;
s(2, 1) = sum(x);
s(1, 2) = s(2, 1);
s(2, 2) = sum(x.^2);

s(3, 1) = sum(x.^2);
s(3, 2) = sum(x.^3);
s(1, 3) = s(3, 1);
s(2, 3) = s(3, 2);
s(3, 3) = sum(x.^4);

s(4, 1) = sum(x.^3);
s(1, 4) = s(4, 1);
s(4, 2) = sum(x.^4);
s(2, 4) = s(4, 2);
s(4, 3) = sum(x.^5);
s(3, 4) = s(4, 3);
s(4, 4) = sum(x.^6)

b = [sum(y); sum(y*x'); sum(y*x'.^2); sum(y*x'.^3)]
a = s\b

y2 = a(1) + a(2)*x + a(3)*x.^2 + a(4)*x.^3
hold on; grid on;
plot(x, y, 'linestyle', 'none', 'marker', 's', 'color', 'r', 'markerfacecolor', 'r');
plot(x, y2, 'color', 'g');
legend('Тест', 'Апроксимирующая прямая')
