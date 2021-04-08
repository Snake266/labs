E = 7;
R = 5;
L = 50e-3;
C = 140e-6;


for f = [30, 90]
    Xl = complex(0, 2 * pi * f * L);
    Xc = complex(0, -1/(2 * pi * f * C));
    Z = R + Xl + Xc;
    
    I0 = E / Z;
    Ur = I0 * R;
    Ul = I0 * Xl;
    Uc = I0 * Xc;
    
    figure
    hold on, grid on
    compass(I0 * 6, 'r')
    compass(Ur, 'g')
    compass(Ul, 'b')
    compass(Uc, 'y')
    title(strcat(num2str(f), 'Гц'))
    legend('I0', 'Ur', 'Ul', 'Uc')
end