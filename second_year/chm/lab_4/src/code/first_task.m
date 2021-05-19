warning('off', 'OctSymPy:sym:rationalapprox')
f = @(x) sin(x);
x0 = 1/2;

syms x
h = 0.5;

v = double(subs(taylor(f,x,x0), x0+h) - subs(taylor(f,x,x0), x0-h))


for eps = [10^-3, 10^-6]
  df = 1;
  while abs(v-df) >= 10^-3
    df = (f(x0+h) - f(x0-h))/(2*h);
    h = h/2;
  end
  df
end