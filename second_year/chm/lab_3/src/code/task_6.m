warning('off', 'OctSymPy:sym:rationalapprox')
f = @(x) 1./(1+25.*x.^2);

a = 10;
t1 = linspace(-5, 5, a);

n = length(t1);
syms x
for i = 1 : n
  P = 1;
  for j = 1 : n
    if (i ~= j)
      P = P * (x-t1(j))/(t1(i)-t1(j));
    end
  end
  Li(i) = f(t1(i)) * P;
end
pol = @(x_) eval(subs(sum(Li), x_));

hold on, grid on
x = -5 : 0.01 : 5;
plot(x, f(x), 'k', 'linewidth', 1.5, x, pol(x), 'r', 'linewidth', 2)
xlim([-5, 5])
delta = abs(f(4.5) - pol(4.5))
