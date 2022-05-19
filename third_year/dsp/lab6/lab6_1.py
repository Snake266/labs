#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from numpy import exp, arange, pi, abs, angle
from scipy import signal
from scipy.fft import fft
from matplotlib.pyplot import figure, grid, stem, subplot, plot

un = [0.5, -0.5+1j, -1.5, -0.5-1j, 0.5, -0.5+1j, -1.5, -0.5-1j]
n = arange(0, 8, 1)


s21 = [un[0] + un[4], un[0] - un[4]]
s22 = [un[1] + un[5], un[1] - un[5]]
s23 = [un[2] + un[6], un[2] - un[6]]
s24 = [un[3] + un[7], un[3] - un[7]]

s41 = [s21[0]+s22[0], s21[1]-s22[1]*1j, s21[0]-s22[0], s21[1]+s22[1]*1j]
s42 = [s23[0]+s24[0], s23[1]-s23[1]*1j, s23[0]-s24[0], s23[1]+s23[1]*1j]

s8=[s41[0]+s42[0], s41[1]+(exp(-1j*pi/4))*s42[1], s41[2]+(exp(-1j*pi/2))*s42[2], \
    s41[3]+(exp(-3j*pi/4))*s42[3], s41[0]-s42[0], s41[1]-(exp(-1j*pi/4))*s42[1], \
    s41[2]-(exp(-1j*2*pi/4))*s42[2], s41[3]-(exp(-3j*pi/4))*s42[3]]

s = abs(s8)
phi = angle(s8, deg=True)

figure()
plot(n, s)
grid()

figure()
subplot(211)
grid()
stem(n,s)
subplot(212)
grid()
stem(n,phi)