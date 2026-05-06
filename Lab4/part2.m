t = -5 : 0.001: 5-0.001;

u = @(tau) double(tau>=0);

x = 0.6 * (u(t+2) - (cos(pi * t) + 1) (u(t+1) - u(t-1)) - u(t-2));

t3 = -5: 10: 15;
x3 = repmat(x, 1, 3);

figure("problem 2");
plot(t3, x3);
xlabel('Time (s)');
ylabel('Amplitude');
title('Signal x3 over Time');
grid on;

Nk = 51;

[CK] = fourier_series_exp(x,t,Nk, 0);

k = -floor(Nk/2) : floor(Nk/2);
w0 = 2*pi/T;
w=k * w0;

figure("problem 2-2; magnitude spectrum");
stem(w, abs(CK));
grid on;

figure("problem 2-2; phase spectrum");
stem(w, angle(CK) * 180/pi);
grid on;

x_hat = zeros(1, length(t3));
for n = 1:length(k)
    x_hat = x_hat + Ck(n) * exp(1j * k(n) * w0 * t3);
end
x_hat = real(x_hat);

figure('Name','Problem 2 — Reconstructed Signal');
plot(t3, x3,    'b',  'LineWidth', 1.5, 'DisplayName', 'original signal');
hold on;
plot(t3, x_hat, 'r--','LineWidth', 1.2, 'DisplayName', 'reconstructed signal');
xlabel('t (s)');  ylabel('x(t)');
title(sprintf('Reconstruction with %d Fourier Coefficients', Nk));
legend('Location','best');
grid on;

       