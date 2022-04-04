clear; clc;

addpath("BCT/2019_03_03_BCT")
A = importdata('connectivity.txt');
imagesc(A);
axis equal; axis tight