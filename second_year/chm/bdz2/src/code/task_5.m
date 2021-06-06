A = [-9, 5, 7; -2, -8, -6; -5, 2, 9];
f = [-5.3; 7.2; -3.4];
delta_f = 0.6;

A_inf = max(sum(abs(A), 2))

A_inv_inf = max(sum(abs(inv(A)), 2))

muA = A_inf * A_inv_inf


f_inf = max(f)

answer = muA * delta_f/f_inf