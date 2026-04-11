fun  = @(t) 3*pi * sin(8*pi*t + 1.3) .* cos(4*pi*t - 0.8) .* exp(sin(12*pi*t));
fun2 = @(t) fun(t).^2;
E = integral(fun2, 0.25, 0.75);
T0 = 0.5;
P  = (1/T0) * integral(fun2, 0, T0);
fprintf('E = %.6f\n', E);
fprintf('P = %.6f\n', P);