syms t;
x = @(t) t * exp(-0.15 * t);

fplot(x(t));
xlim([-20 20]);
xlabel('t'); ylabel('x(t)');
title('x(t)');
ylim([-35 15]);
grid on;

figure;
xe = (x(t) + x(-t)) /2;
fplot(xe);
xlim([-20 20]);
xlabel('t'); ylabel('xe()');
title('xe(t)');
ylim([-35 15]);
grid on;

figure;
xo = (x(t) - x(-t)) /2;

fplot(xo);
xlim([-20 20]);
xlabel('t'); ylabel('xo()');
title('xo(t)');
ylim([-35 15]);
grid on;

figure;

fplot(xo+xe);
xlim([-20 20]);
xlabel('t'); ylabel('xe() + xo()');
title('xe(t) + xo(t)');
ylim([-35 15]);
grid on;
