E = 7
R1 = 5
R2 = 0.2, R3 = R2
L1 = 50e-3
L2 = 12.5e-3
C1 = 140e-6, C2 = C1

disp(' ')
fPH = 1 / (2 * pi * sqrt(L1 * C1))
fPT = ( 1 / (2 * pi * sqrt(L2 * C2))) * sqrt((L2/C2 - R2^2) / (L2 / C2 - R3^2))
disp(' ')

disp('Парраллельный контур ')
wPT = 2 * pi * fPT;
Xc2 = complex(0, 1 / (wPT * C2));
Xl2 = complex(0, wPT * L2);
Zrl = R2 + Xl2;
Zrc = R3 - Xc2;
Z = (1 / Zrl + 1 / Zrc)^-1;
I = E / Z
I1 = abs(E / Zrl)
I2 = abs(E / Zrc)
phi1 = atand(imag(Xl2) / R2)
phi2 = - atand(-imag(Xc2) / R3)

disp('Последовательный контур')
wPH = 2 * pi * fPH;
Xc1 = complex(0, 1 / (wPH * C1));
Xl1 = complex(0, wPH * L1);
Z = R1 + Xl1 - Xc1;
I0 = E / Z
Uc1 = abs(I0 * Xc1)
Ul1 = abs(I0 * Xl1)
Ur1 = abs(I0 * R1)
