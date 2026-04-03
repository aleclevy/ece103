%q1
x = linspace(1,100);
y = x(2:2:end);
display(x);
display(y);
%q2
row = 1;
col = 1;
final = [];
for t = 0.0:0.1:0.4
    row = 1;
    for f =[10 15 20]
        final(row,col) = 3*cos((2*pi*f*t) + 0.1); 
        row= row + 1;
    end
    col = col + 1;
end
display(final);

%q3
t = 0;
while((exp(1.2) *cos(35* t) < 10) && (t^3 < 10) )
    t=t+.01;
end
fprintf('w=30: %f\n',t);
t=0;
while((exp(1.2) *cos(40* t) < 10) && (t^3 < 10) )
    t=t+.01;
end
fprintf('w=40: %f\n',t)
t=0;
while((exp(1.2) *cos(45* t) < 10) && (t^3 < 10) )
    t=t+.01;
end
fprintf('w=45: %f\n', t);

%q4
result4 = [];
for(t=linspace(0,1,15))
    result4(end+1) = (4 * cos((2 * pi * t) + 0.2)) + (3 * sin((pi^2) * t));
end
display(result4);

%q5
f1 = 0.2;
f2 = 0.425;
t = 0:0.1:10;

s1 = sin(2 * pi * f1 * t);
s2 = sin((2 * pi * f2 * t) + 0.4);
s3 = s1 + s2;

plot(t, s1);
hold on
plot(t, s2);
hold on
plot(t, s3);
ylabel('s1, s2, s3');
xlabel('t');
legend('s1 = sin(2 * pi * f1 * t)','s2 = sin((2 * pi * f2 * t) + 0.4)', 's3 = s1 + s2');
hold off

%q6

function z = MySinc(x)
    if x == 0
        z = 1;
    else
        z = sin(x)/x;
    end
end

figure(2);
x=linspace(-2*pi, 2*pi);
y=MySinc(x);
y2=sinc(x);
plot(x, y,  "r:");
hold on
plot(x, y2);
xlabel('x');
ylabel('sinc');
legend('MySinc', 'matlab sinc')
hold off

