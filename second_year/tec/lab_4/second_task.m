N = 3;
U = 4;
L = (10 * round(100 / N)) * 10^-3;
C = (round(100 / N)) * 10^-6;
Rcr = 2 * sqrt(L / C);
R = ([0.1 0.125 0.15 0.175 0.2])*Rcr;

a = R / (2 * L)
w0 = 1 / sqrt(L * C);
wc = sqrt(w0^2 - a.^2)
Tsv = (2 * pi)./ wc
i = @(t, ri) (U / (wc(ri) * L)) * e.^(-a(ri) * t) .* sin(wc(ri) * t);

hold on, grid on
t = 0:0.001:0.1;
for k = 1:length(R)
plot(t, i(t,k), 'DisplayName', strcat('R=', num2str(R(k)), ' Ом.'))
Im = [max(i(t,k)) max(i(1/a(k):0.001:0.1,k))]
end
legend show
title('Ток после коммутации в RLC-контуре') 