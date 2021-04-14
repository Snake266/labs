f = @(x) sin(pi*x);
i = [0,1,2,3,4];
t1 = i/4;
t2 = [0,1/6,1/3,1/2];
warning('off', 'OctSymPy:sym:rationalapprox')
syms x
for i = 1 : length(t1)
	li = 1;
	for j = 1 : length(t1)
		if(j ~= i)
			li = li * (x - t1(j))/(t1(i) - t1(j));
		end
	end
	Li(i) = f(t1(i)) * li;
end
	
pol = @(x_) eval(subs(sum(Li), x_));

pol(t2)

hold on, grid on;
rx_f = [0 : 0.001 : 1];
rx_p = [0 : 0.1 : 1];
plot(rx_f, f(rx_f), 'k', rx_p, pol(rx_p), 'r')

A = 1;
for i = 1 : length(t2)
	A = A * (x - t1(i));
end
w = @(x_) subs(A, x_);
df = @(x_) pi*cos(pi*x_);
n = length(t2);
for i = 1 : n;
	err_t(i) = abs(df(t2(i))/factorial(n+1)*w(t2(i)));

	err_e(i) = abs(f(t2(i))) - pol(t2(2));
end
err_t = eval(err_t)
err_e

