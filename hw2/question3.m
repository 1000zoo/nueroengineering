clear; clc; close all;
addpath("libraries")

d = generate_raster_data(2);
data = d(:,:,:,1);
x = (0:8)*45;
rates = zeros(9,10);
max_ = 0;
for i = 1:8
    rate = sum(data(100:size(data,1),:,i)) / 100;
    rates(i, :) = rate;
    if max_ < max(rate)
        theta = i;
        max_ = max(rate);
    end
end
rates(9, :) = rates(1, :);

figure(1); hold on
plot(x, rates, '.')
parameter=zeros(2,1);
firing = sum(sum(rates));
fun = @(param) sum(sum((model_fun(param, theta) - firing).^2));
parameter=fmincon(fun, [1, 0], [], [], [], [], [0,-2*pi],[2,2*pi]);
if parameter(2)<0
   parameter(2)=parameter(2)+2*pi;
end
plot(x, model_fun(x, theta-1)/norm(parameter))
xticks([0 45 90 135 180 225 270 315 360])
xlabel("direction")
% x = linspace(-3, 3);
% y = zeros(2, 1);
% y = fmincon(@(x) model_fun(x, 0), [1,0], [], [], [], [], [0,-2*pi], [2,2*pi]);
% plot(x,y)