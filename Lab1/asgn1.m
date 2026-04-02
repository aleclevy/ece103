%q1
x = linspace(1,100);
y = x(2:2:end);

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

%q3
while()