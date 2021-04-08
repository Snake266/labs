A = [-1 1 0 1 0 0;
0 1 -1 0 0 1;
0 0 0 -1 1 1;
20 35 55 0 0 0;
0 -35 0 45 0 110;
0 0 -55 0 45 -110]

B = [0 0 0 3.6 0 0]'

detA = det(A);

answers = zeros(1, length(A));

for i = 1 : 1 : length(A)
  t = A;
  t(:, i) = B;
  answers(i) = det(t)/detA;
endfor

answers
