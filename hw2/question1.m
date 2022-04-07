clear; clc; close all;
addpath("libraries")

data = generate_raster_data(2);
d1 = data(:,:,:,1);
raster_plot(d1)
size(data)
size(d1)

% for i = 1:size(data,4)
%     d = data(:,:,:,i);
%     figure(i)
%     raster_plot(d);
% end