f = @(x) sin(x).*sinh(x);
disp('x_i:')
h = 2/12;
a = 1; b = 3;
x = a : h : b
S = h * sum(f(x))
