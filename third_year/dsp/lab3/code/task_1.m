clc;
clear all;
close all;

is_octave = exist('OCTAVE_VERSION', 'builtin') ~= 0;

if(is_octave)
    pkg load signal
end

variant = 24;
b_0 = variant;
b_1 = variant + 1;
b_2 = variant -1;
b_3 = variant + 2;

b = [b_0, b_1, b_2, b_3];
a = [1];
x = [1, zeros(1, 7)];
y_filter_one = filter(b, a, x);

figure
subplot(2, 1, 1);
stem(x);
title('Входной сигнал x(n)');
xlabel('Номер отсчета, n');
ylabel('Временные отсчеты, n');
grid on

subplot(2, 1, 2);
stem(y_filter_one);
title('Выходной сигнал, y(n)');
ylabel('Временные отсчеты, n');
xlabel('Номер отсчета, n');
grid on

y_impz = impz(b, a);

figure
stem(y_impz);
title('Имульсная характеристика ДЛС, h(n)');
xlabel('Номер отсчета, n');
ylabel('Отсчеты имульсной характеристики, h(n)');
grid on

x = [1 ones(1, 15)];
y_filter_step = filter(b, a, x);

figure
subplot(2, 1, 1)
stem(x)
title('Входной сигнал x(n) - единичная ступенька');
xlabel('Номер отсчета, n');
ylabel('Временные отсчеты, n');
grid on

subplot(2, 1, 2);
stem(y_filter_step);
title('Выходной сигнал y(n) - переходная характеристика');
xlabel('Номер отсчета, n');
ylabel('Временные отсчеты, n');
grid on

figure
freqz(b, a);

figure
zplane(b, a);
[hz, hp, ht] = zplane(b, a);
