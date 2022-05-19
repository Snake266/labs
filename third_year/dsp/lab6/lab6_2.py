#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May 19 19:07:54 2022

@author: georgii
"""

from numpy import arange, cos, pi, abs, angle
from scipy.fft import fft
from scipy import signal
from matplotlib.pyplot import figure, plot, grid, \
xlabel, ylabel, stem, subplot, close, tight_layout, legend

def gen_un(Tk, n):
    return cos(2*pi*n/Tk)

def compute_task(Tk, n):
    tmp = gen_un(Tk, n)
    scompl = fft(tmp)
    s = abs(scompl)
    phi = angle(scompl, deg=True)
    return tmp, s, phi

def plot_un(un, s, n):
    subplot(211)
    plot(n, un)
    xlabel('Отсчеты времени')
    ylabel('Отсчеты сигнала')
    grid()
    subplot(212)
    stem(n, s)
    xlabel('Нормированная частота')
    ylabel('Амплитуда')
    grid()

close('all')
N = 64
n = arange(0, N, 1)
Tks = [16, 15.5, 11]
for Tk in Tks:
    un, s, phi = compute_task(Tk, n)
    figure(num="T={}".format(Tk))
    plot_un(un, s, n)
    tight_layout()

un_initial = gen_un(11, n) #Tk=1 -- растекание спектра наиболее заметно
w = signal.windows.hamming(64)
un = un * w
scompl = fft(un)
s = abs(scompl)
scompl_initial = fft(un_initial)
s_initial = abs(scompl_initial)
figure('Окно Хэмминга')
subplot(211)
plot(n, un_initial, 'b', label='initial signal')
plot(n, un, 'r', label='after hamming')
grid()
legend()
subplot(212)
stem(n, s_initial, linefmt='C0-',label='initial signal')
stem(n, s, linefmt='red',markerfmt='rD', label='after hamming')
grid()
legend()
