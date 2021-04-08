clear

f = 10e3;
T = 1/f;
dt = 34e-6;
phi_dt = 180 - 360 * dt / T

R2 = 10;
C = 1e-6;
Xc = 1 / (2 * pi * f * C);
phi_Xc = atand(Xc / R2)

U = 8;
I = 427e-3;
P = 1.8;
phi_UI = acosd(P / (U * I))

phi = phi_dt;

Z = U / I
R = Z * cosd(phi)
X = Z * sind(phi)
Xc
