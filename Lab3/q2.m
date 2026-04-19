%q2
close all
clear all
clc
clf  % clear figure

% signal: x, impulse response: h
x1 = @(time) 5 * (time >=0 & time < 10);
x2 = @(time) 2*x1(time-10);
xlinear_comb = @(time) x1(time) + 2*x1(time-10);

h = @(time) (time>=0 & time<1);

% we need two time variables 'tau' and 't'
% 'tau' will be the variable for integration : resolution of 'tau' will 
                        % determine error limit of numerical integration
% 't' will be the variable for introducing time delay h(t-tau) : will
                        % determine the resolution of output signal y(t)
% the result will be in terms of time variable 't'
% y(t)=Integration (x(tau)*h(t-tau))*dtau, with limits of tau=-inf to +inf

dtau = 0.1;   % time step of tau (time), smaller value will improve the 
              % shape of signal 'x' and 'h'

tau = -10:dtau:40;  % 'tau' should cover time scale from -inf to 
                  % +inf, however, we are taking a range that
                  % specifies non-zero region of 'x' and 'h'
                
dT=0.5;   % step for variable 't': will define time resolution of 
          % output signal 'y'
          
% has to be careful while chooseing the limits for 't'
% y(t) will have non-zero value from min(non_zero_x)+min(non_zero_h)+ to
% max(non_zero_x)+ max(non_zero_h)
t = -10:dT:40;  % time variable for the time delay and output signal
y1 = NaN(1, length (t)); % Pre-allocate memory with NaN (Not a Number)
y2 = NaN(1, length (t));
y3 = NaN(1, length (t));
y4 = NaN(1, length (t));

                        % will help during debugging 


for ii=1:length(t)  % evaluating integration of x(tau)*h(t-tau)
                    % for a specific time delay

    y1(ii) =trapz(tau, h(t(ii)-tau).*x1(tau));
    y2(ii) =trapz(tau, h(t(ii)-tau).*x2(tau));
    y3(ii) =y1(ii) + y2(ii);
    y4(ii) =trapz(tau, h(t(ii)-tau).*xlinear_comb(tau));
end
                           % h(t-tau)
                           
    
  
% plotting in fancy way, good to know what the code does, but not a  
%  necessary requirment

    subplot (411)
    plot (t, y1, 'k', t (ii), y1(ii), 'ok');
    xlabel ('t'); ylabel ('y(t) = \int x(\tau)h(t-\tau) d\tau');
    axis ([tau(1) tau(end) -1.0 6.0]); grid;
    drawnow;
    
    subplot (412)
    plot (t, y2, 'k', t (ii), y2(ii), 'ok');
    xlabel ('t'); ylabel ('y(t) = \int x(\tau)h(t-\tau) d\tau');
    axis ([tau(1) tau(end) -1.0 11.0]); grid;
    drawnow;

    subplot (413)
    plot (t, y3, 'k', t (ii), y3(ii), 'ok');
    xlabel ('t'); ylabel ('y(t) = \int x(\tau)h(t-\tau) d\tau');
    axis ([tau(1) tau(end) -1.0 16.0]); grid;
    drawnow;

    subplot (414)
    plot (t, y4, 'k', t (ii), y4(ii), 'ok');
    xlabel ('t'); ylabel ('y(t) = \int x(\tau)h(t-\tau) d\tau');
    axis ([tau(1) tau(end) -1.0 16.0]); grid;
    drawnow;

