U = 150;
R1 = 1e3;
R2 = 1e3;
R3 = 1e3;
R4 = 1e3;
C = 1e-6;

R12 = R1 + R2;
R34 = R3 + R4;


tau = R34 * C;
t = 0 : 0.0001 : 50 * tau;

uc = U * exp(-t / tau);
ic = - U / R34 * exp(-t / tau);


hold on, grid on

plot(t, uc, 'b') 

plot(t, ic * 400, 'r')