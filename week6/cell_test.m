close all; clc; clear;
c = cell(2,4);
ceil(3.12);

k1 = [1 2 3 4 5];
k2 = [4 5 6 7 8];
k = horzcat(k1, k2)

k3 = 1:400;
k4 = 801:900;
k5 = horzcat(k3, k4)
idx = randperm(500);
k5(:) = k5(idx);
k5