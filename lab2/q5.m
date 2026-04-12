%p1
N = 51;
delta = 0.04;
t = 0 : 0.001 : 200;
y = zeros(size(t));
for n = 1:N
    y = y + 10 * cos(2 * pi * (159 + (n-1)*delta) * t);
end
figure
subplot(2, 1, 1);
plot(t, y);

%p2
N = 101;
delta = 0.02;
y = zeros(size(t));
for n = 1:N
    y = y + 10 * cos(2 * pi * (159 + (n-1)*delta) * t);
end
subplot(2, 1, 2);
plot(t, y);