U = 150;
R1 = 1e3;
R2 = 1e3;
R3 = 1e3;
R4 = 1e3;
C = 1e-6;

R12 = R1 + R2;
R34 = R3 + R4;

function draw_line(x1, x2, y1, y2, color, span = 10)
    if(exist('color') == 1)
        plot(linspace(x1, x2, span), linspace(y1, y2, span), color);
    else
        printf('Color is not defined');
    endif
endfunction

tau = R34 * C;
t = 0 : 0.0001 : 50 * tau;

uc = U * exp(-t / tau);
ic = - U / R34 * exp(-t / tau);


hold on, grid on

# Были добавлены некоторые коэф.-ты для лучшего отображения графика
uc_scaled = uc / 20;
ic_scaled = ic * 120;
plot(t, uc_scaled, 'b') 
draw_line(-0.1, 0, U/20, U/20, 'b')

plot(t, ic_scaled, 'r')
draw_line(-0.1, 0, 0, 0, 'r')
draw_line(0, 0, 0, ic_scaled(1), 'r')

