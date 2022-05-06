#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri May  6 00:48:53 2022

@author: georgii
"""

from scipy import signal
import matplotlib.pyplot as plt
import numpy as np
fpp = 8e6
Cbit = 64e3
Vr = 3600
f = 3.4e9
Rp = 0.3
c = 3e8
Rs = 40
FS = 64e6

dfp_p = 4 * Cbit / 2 + (2 * Vr)/c * f

f_p1 = fpp-dfp_p/2
f_p2 = fpp+dfp_p/2
f_p = [f_p1/(FS/2), f_p2/(FS/2)]
f_s= [(f_p1-dfp_p)/(FS/2), (f_p2 + dfp_p)/(FS/2)]

n, Wn = signal.ellipord(f_p, f_s, Rp, Rs); 

b, a = signal.ellip(n, Rp, Rs, 1, 'lowpass', analog=True);
w,h = signal.freqs(b, a, worN=np.arange(0, np.pi, 0.01))

plt.figure()
plt.subplot(2,1,1)
plt.plot(w, 20* np.log10(np.abs(h)))
plt.title('Analog prototype filter') 
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Magnitude, В')
plt.subplot(2,1,2)
plt.plot(w, np.unwrap(np.angle(h)))
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Phase, rad')

w0 = 2 * np.pi * np.sqrt(f_p1 * f_p2)
Bw = 2 * np.pi * (f_p2 - f_p1)
b_new, a_new = signal.lp2bp(b, a, w0, Bw)
w_new = np.arange(w0-2*Bw, w0+2*Bw, Bw/1000)
w, h = signal.freqs(b_new, a_new, worN=w_new)

plt.figure()
plt.subplot(2,1,1)
plt.plot(w, 20 * np.log10(np.abs(h)))
plt.title('Analog prototype filter') 
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Magnitude, В')
plt.subplot(2,1,2)
plt.plot(w, np.unwrap(np.angle(h)))
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Phase, rad')

bz, az = signal.bilinear(b_new, a_new, FS)
w_z, h_z = signal.freqz(bz, az, fs=FS)
plt.figure()
plt.subplot(2, 1, 1)
plt.plot(w_z, 20*np.log10(np.abs(h_z)))
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Magnitude, В')
plt.subplot(2,1,2)
plt.plot(w_z, np.unwrap(np.angle(h_z)))
plt.xlabel('Frequency, rad/s') 
plt.ylabel('Phase, rad')
