%����������� ������
L = 90e-3;
C = 140e-6;

%������� ��� ������
Xl = [];
Xc = [];
f = [30, 40, 50, 60, 80, 100, 120];

for i = 1 : length(f)
 Xl(i) = 2 * pi * f(i) * L;
 Xc(i) = 1 / (2 * pi * f(i) * C);
endfor

%������� �� ����� ����������� ��������
Xl
Xc

%������ �����������
x = 40 : 0.1 : 60;
Xla = 2 * pi * x * L;
Xca = 1 ./ (2 * pi .* x * C);
%������� ������ ��� ������� Xla � Xca ���������� �������� �� 0.05
intersection = find(abs(Xla - Xca) <= 0.05)


hold on, grid on
%������ �������
plot(f, Xl, "r; Xl;", "linewidth", 4, f, Xc, "b; Xc;","linewidth", 4)

%������� ����� �����������
%���� ����� find ������ ��� �������, �� �� ������� ������
plot(x(intersection(1)), Xla(intersection(1)), "k;Intersection;", "markersize", 20)

printf("����� �����������: y = %d\t x = %d",x(intersection(1)), Xla(intersection(1)))