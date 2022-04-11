clear; clc; close all;
addpath("libraries")

% N = 2
% trials = 10 (default)
% sigma = 0.1 (default)
% theta (default)
d = generate_raster_data(2);
data = d(:,:,:,1);
x = (0:8)*45;
rates = zeros(9,10);
for i = 1:8
    rate = sum(data(100:size(data,1),:,i)) / 100;
    rates(i, :) = rate;
end
rates(9, :) = rates(1, :);
figure(1); hold on
plot(x, rates, '.')
xticks([0 45 90 135 180 225 270 315 360])
xlabel("direction")
% figure(2); hold on
% raster_plot(data)