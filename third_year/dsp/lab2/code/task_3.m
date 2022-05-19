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
t_n = variant * 10^-6;
tau = t_n/2;
Fs = 10e6;
Ts = 1/Fs;
t = -tau-1e-6 : Ts : tau+1e-6;
u = rectpuls(t,  t_n);

f0 = 5/variant * 10^6;
u = u .* sin(2 * pi * f0 * t);
Nfft = 2^nextpow2(length(u));
scompl = fft(u, Nfft);
s = abs(scompl)
f= 0 : Nfft -1;
f = (f/(Nfft-1))*Fs;

figure
subplot(3, 1, 1)
plot(t, u)
title('Signal u(n)')
ylabel('amplitude u(n), [V]')
xlabel('time, [s]')
subplot(3, 1, 2)
plot(f, s)
title('Spectre abs(scompl(f))')
ylabel('amplitude s(f), [V]')
xlabel('Number, n')
subplot(3, 1, 3)
stem(f, s)
