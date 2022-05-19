pkg load signal

N = 512;
n = 0 : 1 : N;
T = 1;
t = 0 : T : N*T;;
f0 = 0.03;
f1 = 0.06;
t1 = N * T;

uin = chirp(t, f0, t1, f1, 'linear');
h = uin(N-n+1);
uou = fftfilt(h, uin);

figure()
subplot(3, 1, 1)
stem(uin);
title('ВХОДНОЙ СИГНАЛ')
xlabel('Нормированная частота')	
ylabel('Амплитуда')
grid on

subplot(3, 1, 2)
stem(h);
title('ИМПУЛЬСНАЯ ХАРАКТЕРИСТИКА')
xlabel('Отсчеты времени')
ylabel('Амплитуда')
grid on

subplot(3,1,3)
stem(uou)
title(' ВЫХОДНОЙ СИГНАЛ')
xlabel('Отсчеты времени')
ylabel('Отсчеты сигнала')
grid on

uin = cos(2 * pi * f1 * n * T);
h = uin(N-n+1);
uou = fftfilt(h, uin);

figure()
subplot(3, 1, 1)
stem(uin);
title('ВХОДНОЙ СИГНАЛ')
xlabel('Нормированная частота')	
ylabel('Амплитуда')
grid on

subplot(3, 1, 2)
stem(h);
title('ИМПУЛЬСНАЯ ХАРАКТЕРИСТИКА')
xlabel('Отсчеты времени')
ylabel('Амплитуда')
grid on

subplot(3,1,3)
stem(uou)
title(' ВЫХОДНОЙ СИГНАЛ')
xlabel('Отсчеты времени')
ylabel('Отсчеты сигнала')
grid on
