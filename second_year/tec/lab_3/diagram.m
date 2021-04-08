I0 = 1.4;
E = 7;

figure
hold on, grid on;
compass(I0, 'r');
compass(E, 'b');
legend('I0', 'U');
title('Последовательный контур');

I = 0.03;
figure
hold on, grid on;
compass(I*60, 'r');
compass(E, 'b');
legend('I', 'U');
title('Парраллельный контур')