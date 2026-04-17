R = 2;
C = 1;
L = 0.5;

syms h(t);

eqn = R*C*diff(h,t,2) + diff(h,t) + (R/L)*h == 0;

Dh = diff(h, t);
cond1 = h(0) == 0.5;
cond2 = Dh(0) == 0;
hsol = dsolve(eqn, cond1, cond2);


hfunc = matlabFunction(hsol);
tvals = linspace(-10, 30, 2000);
hvals = zeros(size(tvals));

idx = tvals >= 0;

hvals(idx) = hfunc(tvals(idx));
plot(tvals, hvals)
grid on