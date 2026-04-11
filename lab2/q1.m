%q1

figure;

t1 = -1:0.1:1;
g = 3*pi *sin(8* pi *t1 + 1.3).* cos((4* pi* t1) - 0.8).*exp((sin(12*pi*t1)));
subplot(3, 1, 1);
plot(t1, g);
xlim([-1 1]);
title('Step = 0.1');
xlabel('t'); ylabel('g(t)');
grid on;

t2 = -1:0.01:1;
g = 3*pi *sin(8* pi *t2 + 1.3).* cos((4* pi* t2) - 0.8).*exp((sin(12*pi*t2)));
subplot(3, 1, 2);
plot(t2, g);
xlim([-1 1]);
title('Step = 0.01');
xlabel('t'); ylabel('g(t)');
grid on;

t3=-1:0.001:1;
g = 3*pi *sin(8* pi *t3 + 1.3).* cos((4* pi* t3) - 0.8).*exp((sin(12*pi*t3)));
subplot(3, 1,3);
plot(t3, g);
xlim([-1 1]);
title('Step = 0.001');
xlabel('t'); ylabel('g(t)');
grid on;

