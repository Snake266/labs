clear all
close all
Q = 5;
f = 1.7e9;
Vrmax = 5400/3.6; # m/s
Vrmin = 10; # m/s
c = 3e8;
vs = [1000, 1500, 10, 0]; # m/s

fdmax = (2 * Vrmax * f)/c;
fdmin = (2 * Vrmin * f)/c;

Fsl = fdmax/2;
taui=1/(Fsl*Q)
T=taui/2
N=1/(fdmin*T)
t=0:T:1/fdmin;
n=t/T;
d=(0:(Fsl/fdmin))' *1/Fsl;
un1=pulstran(t,d,'tripuls',2*taui);

for v = vs
    fd = 2 * v * f/c;
    un = un1 .* exp( j * 2 * pi * fd * t);
    scompl = fft(un);
    s = abs(scompl);
    %figure(sprintf('Vr = %d', v))
    figure()
    subplot(2, 1, 1)
    stem(n,un)
    title(' ВХОДНОЙ СИГНАЛ')
    xlabel('Отсчеты времени')
    ylabel('Отсчеты сигнала')
    grid on
    subplot(2,1,2)
    stem(n, s);
    title('АМПЛИТУДНЫЙ СПЕКТР')
    xlabel('Нормированная частота')
    ylabel('Амплитуда')
    grid on

end
