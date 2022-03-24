clc;
clear all;
close all;

% Для определения где запускается
is_octave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

% для rectpuls требуется дополнительный пакет signal
% у него в зависимостях есть пакет control
% чтобы все работало в octave:
% pkg install -forge control signal
if(is_octave)
    pkg load signal
end

variant = 24; % Вариант

tau = variant * 10^-6; % Длительность импульса
t_max = 3 * tau; % длительность наблюдения
Fs = 10e6;
Ts = 1/Fs;


t = -(t_max/2) : Ts : (t_max/2);
u = rectpuls(t, tau);

subplot(2, 2, 1);
hold on; grid on;
plot(t, u);
title('Signal u(n)');
xlabel('time, [s]')
ylabel('u(n), [V]');
ylim([-0.1, 1.1]);

Nfft = 2^nextpow2(length(u));
scompl = fft(u, Nfft);
s = abs(scompl);
f = 0 : Nfft - 1;
f = (f/(Nfft - 1)) * Fs;

subplot(2, 2, 2);
hold on; grid on;
stem(f, s);
title('Spectre abs(scompl(f))');
xlabel('Number, n');
ylabel('amplitude s(f), [V]')

subplot(2, 2, 3);
hold on; grid on;
plot(f, s);
