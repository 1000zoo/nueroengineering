clear; clc; close all;
x = linspace(-2*pi, pi);
y = model_fun(x, 0.5*pi);
plot(x, y)