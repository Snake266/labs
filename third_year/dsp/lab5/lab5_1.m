pkg load signal;
close all;
clear all;
format long g;

fpp = 8e6;
Cbit = 256e3;
Vr = 3600;
f = 4.2e9;
Rp = 0.2;
c = 3e8;
Rs = 30;
FS = 64e6;

dfp_p = 4 * Cbit / 2 + (2 * Vr)/c * f;

f_p1 = fpp-dfp_p/2;
f_p2 = fpp+dfp_p/2;
f_p = [f_p1/(FS/2), f_p2/(FS/2)];
f_s= [(f_p1-dfp_p)/(FS/2), (f_p2 + dfp_p)/(FS/2)];


[n, Wn] = cheb1ord(f_p, f_s, Rp, Rs);

[z, p, k] = cheby1(n, Rs, Wn);
[b, a] = zp2tf(z, p, k);
[h, w] = freqz(b, a);
figure('name', 'Фильтр Чебышева первого рода')
freqz(b, a)


[n, Wn] = cheb2ord(f_p, f_s, Rp, Rs);
[z, p, k] = cheby2(n, Rs, Wn);
[b, a] = zp2tf(z, p, k);
[h, w] = freqz(b, a);
figure('name', 'Фильтр Чебышева второго рода')
freqz(b, a)


[n, Wn] = buttord(f_p, f_s, Rp, Rs);
[z, p, k] = butter(n, Wn);
[b, a] = zp2tf(z, p, k);
[h, w] = freqz(b, a);
figure('name', 'Фильтр Баттерворта')
freqz(b, a)


[n, Wn] = ellipord(f_p, f_s, Rp, Rs);
[z, p, k] = ellip(n, Rp, Rs, Wn);
[b, a] = zp2tf(z, p, k);
[h, w] = freqz(b, a);
figure('name', 'Эллиптический фильтр')
freqz(b, a);