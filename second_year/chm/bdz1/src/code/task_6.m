n = 2;
k = [0 : n];
xk = pi * cosd(pi * (2*k-1)/(2*n))
hold on, grid on
xlim([xk(1) - 0.01, xk(3) + 0.01])
line([xk(1) - 0.02, xk(3) + 0.02], [0, 0], 'color', 'k')
plot(xk, 0, 'r*')
