f = @(x) sin(pi * x);

i = [0 : 4];
t1 = i/4;
t2 = [0, 1/6, 1/3, 1/2];

fi = @(i,x) f(t1(i)) + (f(t1(i+1)) - f(t1(i))) / (t1(i+1)-t1(i)) * (x - t1(i));

y = [
fi(1, t2(1)), f(t2(1))
fi(1, t2(2)), f(t2(2))
fi(2, t2(3)), f(t2(3))
fi(3, t2(4)), f(t2(4))
]

hold on, grid on
x = 0:0.001:1;
plot(x,f(x),'k')
plot(t1,f(t1),'r')
plot(t2,y,'b*')
