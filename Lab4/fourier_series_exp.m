function [Ck]=fourier_series_exp(x,t,Nk,p)

% Ck = exponential fourier series cofficient  
% x = single period of a signal
% t = time corrosponding to 'x'
% Nk = (optional input) number of exponential terms
% p = plotting option ; p=0, no plots, p = 1 plot Ck vs k and reconstructed signal  
% dT = t(2)-t(1) = temporal resolution of signal (x)
% T = peiod of signal 'x'
% w0= angular frequency of signal 'x' 


    dT=t(2)-t(1);
    T= dT*length(t);
    w0=2*pi/T;   

    % Check the number of inputs, 'nargin' returns number of input arguments 
    if nargin <2
        error('Not enough input argument!')
    elseif nargin == 2
        Nk=101;   % you can set any default value you like 
        p=0;      % not plots
    elseif nargin ==3
        p=0;      % not plots
    end
    k=-floor(Nk/2):floor(Nk/2); % if Nk=11, k=-5:5; if Nk=12, k=-6:6


    %% evaluate Ck
        %
        % % % write this code segment
        %

    Ck = zeros(1, length(k));
    for n = 1:length(k)
        Ck(n) = (dT/T) * sum(x .* exp(-1j * k(n) * w0 * t));
    end
    %% plot spectrum and reconstructed signal     
    if p==1
        % plot abs(Ck) vs k and angle(Ck) vs k
        %
        % % % write this code segment
        %
        figure;
        subplot(2,1,1);
        w0k = w0 * k;
        stem(w0k, abs(Ck));
        grid on;

        subplot(2,1,2);
        stem(w0k, angle(Ck)*180/pi);
        grid on;
       
        % plot 3 cycles of the signal 'x' and the reconstructed signal
        %
        % % % write this code segment
        %
        t3 = t(1) : dT : t(1) + 3*T - dT;
 
        x_hat = zeros(1, length(t3));
        for n = 1:length(k)
            x_hat = x_hat + Ck(n) * exp(1j * k(n) * w0 * t3);
        end
 
        x3 = repmat(x, 1, 3);
 
        figure;
        plot(t3, x3, 'b', 'LineWidth', 1.5, 'DisplayName', 'original signal');
        hold on;
        plot(t3, x_hat, 'r--', 'LineWidth', 1.2, ...
             'DisplayName', sprintf('reconstructed signal (Nk=%d)', Nk));
        xlabel('t (s)');
        ylabel('x(t)');
        title(sprintf('Approximation with %d terms', Nk));
        legend('Location', 'best');
        grid on;
    end
     
end