f = @(x) sin(x);
x0 = 1/2;
syms x;

first_error = [];
second_error = [];

h = 1/2;
v = double(subs(taylor(f,x,x0), x0+h) - subs(taylor(f,x,x0), x0-h))

for h = [1/2, 1/4, 1/8, 1/16]
  df1 = (f(x0 + h) - f(x0))/h;
  df2 = (f(x0 + h) - f(x0 - h))/(2*h);

  first_error = [first_error, abs(df1 - v)];
  second_error = [second_error, abs(df2 - v)];
end

df1, df2
first_error, second_error
