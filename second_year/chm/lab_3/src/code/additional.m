t_sin = [0, 1, 2, 3, 4]/4;
f_sin = sin(pi*t_sin);
x_sin = 0: 0.01 : 1;
y_sin = interp1(t_sin, f_sin, x_sin);
hold on, grid on
plot(x_sin, y_sin);
