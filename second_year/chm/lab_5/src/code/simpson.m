function I = simpson(f, x, h)
  I = 0;
  for i = 2 : length(x)
    I = I+(h/6)*(f(x(i-1))+4*f(x(i)-h/2)+f(x(i)));
  end
end
