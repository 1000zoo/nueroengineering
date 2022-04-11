function y = model_fun(param, x)

y = cos(param - x);
y(y<0) = 0;
% y(param+75*pi < x) = 0;
% y(param-75*pi > x) = 0;
end

