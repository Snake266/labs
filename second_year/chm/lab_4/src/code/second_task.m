f = @(x) sin(x);
x0 = 1/2;
syms x;

R1 = [];
R2 = [];

h = 1/2;
v = double(subs(taylor(f,x,x0), x0+h) - subs(taylor(f,x,x0), x0-h))
n = 10;
h = 1 ./ [2 : n];

for hi = h
  df1 = (f(x0 + hi) - f(x0))/hi;
  df2 = (f(x0 + hi) - f(x0 - hi))/(2*hi);

  R1 = [R1, abs(df1 - v)];
  R2 = [R2, abs(df2 - v)];
end

hold on, grid on;
plot(h, R1, '-*b', h, R2, '-*r')
legend('R1', 'R2')
df1, df2
R1, R2
