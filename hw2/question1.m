clear; clc; close all;
addpath("libraries")

% N = 2
% trials = 10 (default)
% sigma = 0.1 (default)
% theta (default)
data = generate_raster_data(2);
d1 = data(:,:,:,1);
figure(1);
raster_plot(d1);