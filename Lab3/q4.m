%q4
M= 100;
B = 20;
K = 1;

syms y(t);

eqn = M*diff(y,t,2) + B*diff(y,t) + K*y == 0;

Dy = diff(h, t);
cond1 = y(0) == 0.5;
cond2 = Dy(0) == 0;
ysol = dsolve(eqn, cond1, cond2);


hfunc = matlabFunction(hsol);
tvals = linspace(-10, 30, 2000);
hvals = zeros(size(tvals));

idx = tvals >= 0;

hvals(idx) = hfunc(tvals(idx));
plot(tvals, hvals)
grid on