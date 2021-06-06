f = @(x) sin(x).*sinh(x);
disp('x_i:')
h = 2/4;
a = 1; b = 3;
x = a : h : b
S = h * sum(f(x)(1:end-1))
