f = @(x) sin(x)
x0 = 1/2;
df = @(x) cos(x)

n = 100;
h = 1./[2 : n];
dff = (f(x0 + h) - f(x0))./h
eps = abs(df(x0) - dff)
hold on, grid on
plot([2:n], eps)
