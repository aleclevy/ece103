syms t;
x = @(t) piecewise((t < -5) & (t > 10), 0, ( t >= -5) & (t < 5),-2 * abs(t) + 10, (t >= 5) & (t < 10), 10);

fplot(x(t));
xlim([-10 15]);
xlabel('t'); ylabel('x(t)');
title('x(t)');
ylim([-35 15]);
grid on;

figure;

subplot(2, 2, 1);
fplot(x(t+2));
xlim([-10 15]);
xlabel('t'); ylabel('x(t+2)');
title('x(t+2)');
ylim([-35 15]);
grid on;

subplot(2,2,2);
fplot(x(t-3));
xlim([-10 15]);
xlabel('t'); ylabel('x(t-3)');
title('x(t-3)');
ylim([-35 15]);
grid on;

subplot(2,2,3);
fplot(x(-t));
xlim([-10 15]);
xlabel('t'); ylabel('x(-t)');
title('x(-t)');
ylim([-35 15]);
grid on;

subplot(2,2,4);
fplot(-3*x(-t+4));
xlim([-10 15]);
xlabel('t'); ylabel('-3*x(-t+4)');
title('-3*x(-t+4)');
ylim([-35 15]);
grid on;