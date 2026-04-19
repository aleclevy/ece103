%q4 p1
M= 100;
B = 20;
K = 1;

syms y(t);

eqn = M*diff(y,t,2) + B*diff(y,t) + K*y == 0;

Dy = diff(y, t);
cond1 = y(0) == 0;
cond2 = Dy(0) == 1/M;
ysol = dsolve(eqn, cond1, cond2);


hfunc = matlabFunction(ysol);
tvals = linspace(-10, 300, 2000);
hvals = zeros(size(tvals));

idx = tvals >= 0;

hvals(idx) = hfunc(tvals(idx));
plot(tvals, hvals)
grid on
hold on

%q4 p2
M= 100;
B = 0.2;
K = 1;

syms y(t);

eqn = M*diff(y,t,2) + B*diff(y,t) + K*y == 0;

Dy = diff(y, t);
cond1 = y(0) == 0;
cond2 = Dy(0) == 1/M;
ysol = dsolve(eqn, cond1, cond2);


hfunc = matlabFunction(ysol);
tvals = linspace(-10, 300, 2000);
hvals = zeros(size(tvals));

idx = tvals >= 0;
figure
hvals(idx) = hfunc(tvals(idx));
plot(tvals, hvals)
grid on
hold on
