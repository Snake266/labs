N = 3;
U = 4;
L = (10 * round(100 / N)) * 10^-3
C = (round(100 / N)) * 10^-6
R = 2 * sqrt(L / C)

tau = R * C
a = 1 / tau
t = 0 : 0.001 : 10 * tau;
uc = U*(1 - exp(-t/tau));
ic = U/R * exp(-t/tau);

uc_t = @(time) U*(1 - exp(-time/tau));
ic_t = @(time) U/R * exp(-time/tau);
[ic_t(0.00001), uc_t(0,00001)]
[ic_t(tau), uc_t(tau)]
[ic_t(2*tau), uc_t(2*tau)]
[ic_t(3*tau), uc_t(3*tau)]

hold on, grid on
plot(t, uc/U, 'b')
plot(t, ic/(U/R), 'r')