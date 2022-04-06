clear; clc; close all;

addpath("BCT/2019_03_03_BCT")
A = importdata('connectivity.txt');
[Ci, Q] = modularity_und(A);
n = max(Ci);
idx = [find(Ci==1); find(Ci==2); find(Ci==3); find(Ci==4)];
imagesc(A(idx, idx))
colorbar
axis equal; axis tight