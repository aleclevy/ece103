t= 0: 0.001: 5-.001;
T = 5;
u = @(tau) double(tau>=0);

x = t.^3 - (1i * 2 * pi * t.^2);
x3 = repmat(x, 1, 3);

Nk = 51;

[CK] = fourier_series_exp(x,t,Nk, 0);

k = -floor(Nk/2) : floor(Nk/2);
w0 = 2*pi/T;
w=k * w0;

figure("Name", "problem 3-1; magnitude spectrum");
stem(w, abs(CK));
grid on;

figure("Name", "problem 3-2; phase spectrum");
stem(w, angle(CK) * 180/pi);
grid on;

t2 = 0: 0.001: 10-0.001;
x2 = repmat(x, 1, 2);  

x_hat = zeros(1, length(t3));
for n = 1:length(k)
    x_hat = x_hat + CK(n) * exp(1j * k(n) * w0 * t3);
end
figure('Name','Problem 3-3 - Real Part');
plot(t2, real(x2),    'b',  'LineWidth', 1.5, 'DisplayName', 'original signal');
hold on;
plot(t3, real(x_hat), 'r--','LineWidth', 1.2, 'DisplayName', 'reconstructed signal');
xlabel('t (s)');  ylabel('x(t)');
title(sprintf('Reconstruction with %d Fourier Coefficients', Nk));
legend('Location','best');
grid on;

figure('Name','Problem 3-4 - Imaginary Part');
plot(t2, imag(x2),    'b',  'LineWidth', 1.5, 'DisplayName', 'original signal');
hold on;
plot(t2, imag(x_hat), 'r--','LineWidth', 1.2, 'DisplayName', 'reconstructed signal');
xlabel('t (s)');  ylabel('x(t)');
title(sprintf('Reconstruction with %d Fourier Coefficients', Nk));
legend('Location','best');
grid on;
