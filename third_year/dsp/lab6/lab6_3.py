#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May 19 20:12:40 2022

@author: georgii
"""

from numpy import arange, pi, abs, angle, exp
from scipy.fft import fft
from scipy.constants import speed_of_light
from matplotlib.pyplot import figure, grid, xlabel, ylabel, \
    stem, subplot, close, tight_layout

close('all')

f = 1.7e9
Vrmax = 5400/3.6 # m/s
Vrmin = 10 # m/s

vs = [1000, 1500, 10, 0] # m/s

fDmax = (2 * Vrmax * f)/speed_of_light
fDmin = (2 * Vrmin)/speed_of_light

Fsl = 2 * fDmax
t = arange(0, (1/fDmin), Fsl)
n = t * Fsl
for v in vs:
    fd = (2 * v * f)/speed_of_light
    un = exp(2 * pi * fd * t * 1j)
    scompl = fft(un)
    s = abs(scompl)
    phi = angle(scompl, deg=True)

    figure(num='Vr={}'.format(v))
    subplot(211)
    grid()
    stem(n, un)
    xlabel('Отсчеты времени')
    ylabel('Отсчеты сигнала')
    subplot(212)
    stem(n, s)
    xlabel('Нормированная частота')
    ylabel('Амплитуда')
    tight_layout()
