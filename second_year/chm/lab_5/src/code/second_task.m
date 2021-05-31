f = @(x) 1/(1 + x.^2); % интегрируемая функция
eps = 10^-6; % Погрешность
a = 0; b = 1; % границы интегрирования

x = a : 0.01 : b;
d2f = 2.*(4.*x.^2-x.^2-1)./((x.^2+1).^3); % 2-ая производная

d4f = (24.*(16.*x.^4-12.*(x.^2).*(x.^2+1)+(x.^2+1).^2))./(x.^2+1).^5; %4 производная

M2 = max(d2f);
M4 = max(d4f);

h_simpson = (2880*eps/((b - a) * M4))^(1/4); % шаг для симпсона
h_approx_s = 0.1;
x_S = 0 : 0.1 : 1;

h_trapeze = sqrt((12*eps)/((b - a) * M2));
h_approx_t = 0.01;
x_T = 0 : 0.001 : 1;

pi_s = 4*simpson(f, x_S, h_approx_s)
pi_t = 4*trapeze(f, x_T, h_approx_t)

printf('Шаг по формуле Симпсона: hS = %f, \n', h_simpson);
printf('Шаг по формуле трапеций: hT = %f, \n', h_trapeze);
printf('PI по формуле Симпсона: PI_S = %f, \n', pi_s);
printf('PI по формуле трапеций: PI_T = %f, \n', pi_t);