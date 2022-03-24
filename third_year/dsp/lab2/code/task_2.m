clc;
clear all;
close all;

% Для определения где запускается
is_octave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

% для rectpuls в Octave требуется дополнительный пакет signal
% у него в зависимостях есть пакет control
% чтобы все работало в octave:
% pkg install -forge control signal
if(is_octave)
    pkg load signal
end

variant = 24; % Вариант
tau = variant * 10^-6; % Длительность импульса
t_max = 10 * tau;
quantity = 4;

Fs = 10e6;
Ts = 1/Fs;

wave_duration = variant * 10^-6;
delay = variant * 2 * 10^-6;
wave = wave_duration + delay;


t = 0 : Ts : quantity/(1/wave);
d = 0: wave : quantity/(1/wave);

x = tripuls(t, tau, -1);
u = pulstran(t, d, x, Fs);

Nfft = 2^nextpow2(length(u));
scompl = fft(u, Nfft);
s = abs(scompl);
phi = 180/pi * angle(scompl);
phi = unwrap(phi);
f = 0 : Nfft -1;
f = (f/(Nfft-1))*Fs;

figure
subplot(2, 2, 1)
hold on; grid on;
plot(t, u)
title('Signal u(n)')
ylabel('amplitude u(n), [V]')
xlabel('time, [s]')
subplot(2, 2, 2)
hold on; grid on;
plot(f, s)
title('Spectre abs(scompl(f))')
subplot(2, 2, 3)
hold on; grid on;
stem(f, s)
