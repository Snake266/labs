#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu May 19 20:40:53 2022

@author: georgii
"""

from numpy import arange, cos, pi, abs, angle, transpose
from scipy.fft import fft
from scipy.constants import speed_of_light
from scipy import signal
from matplotlib.pyplot import figure, plot, grid, \
xlabel, ylabel, stem, subplot, close, tight_layout, legend

Q = 5
f = 1.7e9
Vrmax = 5400/3.6 # m/s
Vrmin = 10 # m/s

vs = [1000, 1500, 10, 0] # m/s

fDmax = (2 * Vrmax * f)/speed_of_light
fDmin = (2 * Vrmin * f)/speed_of_light

Fsl = fDmax/2
taui = 1/(Fsl*Q)
T = taui/2
N = 1/(fDmin*T)

t = arange(0, T, 1/fDmin)
n = t/T
d = transpose(arange(0, Fsl/fDmin)) * 1/Fsl;
plot(t, signal.sawtooth(taui))
# for v in vs:
#     fd = (2 * v * f)/speed_of_light
