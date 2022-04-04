clear; clc; close all;

addpath("BCT/2019_03_03_BCT")
A = importdata('connectivity.txt');
[Ci, Q] = modularity_und(A);
imagesc(Q);
colorbar
axis equal; axis tight