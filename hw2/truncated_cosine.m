x = linspace(-3, 3);
y = cos(x);
y(y<0) = 0;
plot(x, y)