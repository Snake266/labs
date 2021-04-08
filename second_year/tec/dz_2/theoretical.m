#Входные данные
E = 273.014;
f = 50;
w = 2 * pi * f;
T = 1 / f;
R1 = 100;
R2 = 115.5;
L = 640e-3;

#Расчет сопротивлений
Xl = complex(0, w * L);
Zrl = (R2 * Xl) / (R2 + Xl);
Z = Zrl + R1;

#Расчет токов и напряжений
I = E / Z;
Ur1 = I * R1;
Ur2 = E - Ur1;
Ir = Ur2 / (R2);
Ul = E - Ur1;
Il = Ul / (Xl);

disp('Расчет токов и напряжений')
printf('Значения тока на R1:\n\tI_comp = %s\n\tI_rms = %d\n', num2str(I), abs(I));
printf('Значение тока на R2:\n\tI_comp = %s\n\tI_rms = %d\n', num2str(Ir), abs(Ir));
printf('Значение тока на L:\n\tI_comp = %s\n\tI_rms = %d\n', num2str(Il), abs(Il));
printf('Значение напряжения на R1:\n\tU_comp = %s\n\tU_rms = %d\n', num2str(Ur1), abs(Ur1));
printf('Значение напряжения на R2:\n\tU_comp = %s\n\tU_rms = %d\n', num2str(Ur2), abs(Ur2));
printf('Значение напряжения на L:\n\tU_comp = %s\n\tU_rms = %d\n', num2str(Ul), abs(Ul));

#Расчет мощностьей
P_source = E * I;
P_source_a = real(P_source);
P_source_r = imag(P_source);

P_consumer = Ul*Il + Ur2 * Ir + Ur1 * I;
P_consumer_a = real(P_consumer);
P_consumer_r = imag(P_consumer);

disp('Расчет мощностей')
printf('Мощность источника:\n\tW_compl = %s\n\tW_active = %d\n\tW_reactive = %d\n',
 num2str(P_source), P_source_a, P_source_r); 
printf('Мощность потребителей:\n\tW_comp = %s\n\tW_active = %d\n\tW_reactive = %d\n',
num2str(P_consumer), P_source_a, P_source_r);

figure
hold on, grid on
compass(Ir, 'r')
compass(Il, 'g')
compass(I, 'b')
title('Векторная диаграмма токов', 'fontsize', 14)
legend('Ir', 'Il', 'I')

figure
hold on, grid on
compass(E, 'r')
compass(Ul, 'g')
compass(Ur2, 'b')
compass(Ur1, 'm')
title('Векторная диаграмма напряжений', 'fontsize', 14)
legend('E', 'Ul', 'Ur2', 'Ur1')

t = 0 : 0.01 : 2;

figure
title('График тока и напряжения на R1 и R2', 'fontsize', 14)
hold on, grid on

It_R1 = abs(I) * sqrt(2) * sind(w * t + rad2deg(angle(I)));
Ut_R1 = abs(Ur1) * sqrt(2) * sind(w * t + rad2deg(angle(Ur1)));

plot(t, It_R1 * 50, 'r')
plot(t, Ut_R1, 'b')
legend('I', 'U')


figure
title('График тока и напряжения на катушке индуктивности', 'fontsize', 14)
hold on, grid on

It_L = abs(Il) * sqrt(2) * sind(w * t + rad2deg(angle(Il)));
Ut_L = abs(Ul) * sqrt(2) * sind(w * t + rad2deg(angle(Ul)));

plot(t, It_L * 100, 'r')
plot(t, Ut_L, 'b')
legend('I', 'U')

figure
hold on, grid on
title('График Q, P, S', 'fontsize', 14)
Ut = E * sqrt(2) * sind(w * t);
S = Ut .* It_R1;
P = S * cosd(rad2deg(angle(I)));
Q = S * sind(rad2deg(angle(I)));

plot(t, Q)
plot(t, P)
plot(t, S)
legend('Q', 'P', 'S')