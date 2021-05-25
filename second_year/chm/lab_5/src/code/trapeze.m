function I = trapeze(f, x, h)
  I = 0;
  for i = 2 : length(x)
    I = I + (h/2)*(f(x(i)) + f(x(i-1)));
  end
end
