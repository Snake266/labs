clc
clear all
close all

% Вводные данные
variant = 24
F = variant*1000
A = variant
N = 64
n = 1 : N - 1;

% _ts -- частота дискретизации
% _phi0 -- начальная фаза
u_n = @(_ts, _phi0) A * cos(2 * pi * F * n * _ts + _phi0);
%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%% Задание 1 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------

phi_0 = (pi * variant)/2 % начальная фаза

% находим частоту и период дискртизации
Fs = 2 * F
Ts = 1 / Fs

% Дискретные значениея сигнала
u = u_n(Ts, phi_0);
Nfft = 2^nextpow2(length(u)); % Число измерений БПФ
scompl = fft(u, Nfft); % Быстрое преобразование фурье (переход из временной области в частнотную)
s = abs(scompl);

figure('Name', 'Задание 1')
subplot(2, 2, 1)
plot(n*Ts, u);
title('Signal u(t)');
ylabel('u(n), [V]');
xlabel('time, t=nTs, [s]');

subplot(2, 2, 2)
stem(n, u);
xlabel('N');
ylabel('u(n), [V]');
title('Signal u(n)');

subplot(2, 2, 3)
f = 0 : Nfft - 1;
f = (f/(Nfft - 1)) * 1 / Ts;
stem(f,s);
title('Spectre abs(scompl(f))');
xlabel('Frequency [Hz]');
ylabel('amplitude s(f), [V]');

%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%% Задание 2 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------

phi = pi/2 * variant : pi/8 : pi/2 * (variant + 1);

figure('Name', 'Задание 2')
for i = 1 : length(phi)
  u = u_n(Ts, phi(i));
  subplot(length(phi), 2, i*2 - 1)
  plot(n*Ts, u);
  ylabel('u(n), [V]');
  xlabel('time, t=nTs, [s]');
  title('Signal u(t)');

  subplot(length(phi), 2, i*2);
  scompl = fft(u, Nfft);
  s = abs(scompl);
  stem(f, s);
  ylabel('amplitude s(f), [V]');
  xlabel('Freq [Hz]');
  title('Spectre abs(scompl(f))');
end

%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%% Задание 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------

phi_0 = pi/2; % возвращаем фазу

% уменьшаем частоту дискртизацию на 5, 10, 15, 20 процентов
Ts_95 = Ts * 0.95;
Ts_90 = Ts * 0.90;
Ts_85 = Ts * 0.85;
Ts_80 = Ts * 0.80;
Ts_xx = [Ts_95, Ts_90, Ts_85, Ts_80];

figure('Name', 'Задание 3')
for i = 1 : length(Ts_xx)
  u = u_n(Ts_xx(i), phi_0);

  subplot(length(Ts_xx), 2, 2*i-1)
  plot(n*Ts_xx(i), u)
  title(strcat('Signal u(t). Ts = ', num2str(Ts_xx(i))));
  xlabel('t, [s]')
  ylabel('u(n), [V]')

  subplot(length(Ts_xx), 2, 2*i)
  f = 0 : Nfft - 1;
  f = (f/(Nfft - 1)) * 1 / Ts_xx(i);
  scompl = fft(u, Nfft);
  s = abs(scompl);
  stem(f,s);
  title(strcat('Spectre abs(scompl(u)). Ts = ', num2str(Ts_xx(i))));
  xlabel('Frequency [Hz]');
  ylabel('amplitude s(f), [V]');
end

%-------------------------------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%% Задание 4 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%-------------------------------------------------------------------------------

% уменьшаем период дискретизации в 8 и 10 раз
Ts_div_8 = Ts / 8;
Ts_div_10 = Ts / 10;
T_div_x = [Ts_div_8, Ts_div_10];
figure('Name', 'Задание 4')
for i = 1 : length(T_div_x)
  u = u_n(T_div_x(i), phi_0);

  subplot(length(T_div_x), 2, 2*i - 1)
  plot(n*T_div_x(i), u);
  title(strcat('Signal u(t). Ts = ', num2str(T_div_x(i))));
  xlabel('t, [s]');
  ylabel('u(n), [V]');

  subplot(length(T_div_x), 2, 2*i);
  f = 0 : Nfft - 1;
  f = (f / (Nfft - 1)) * 1 / T_div_x(i);
  scompl = fft(u, Nfft);
  s = abs(scompl);
  stem(f, s);
  ylabel('amplitude');
  xlabel('Freq (Hz)');
  title(strcat('Ts = ', num2str(T_div_x(i))));
end
