% Problem 4: Principal component analysis
clc;
load pca_data;
[m, n] = size(X);

% Plotting the original data
scatter(X(1, :), X(2, :), '.g');
hold on;
title('Problem 4');

% a) Finding the covariance matrix
centroid = mean(X, 2);
Xm0 = zeros(m, n);
Xm0(1, :) = X(1, :) - centroid(1);
Xm0(2, :) = X(2, :) - centroid(2);
C = 1/n * Xm0 * (Xm0');
fprintf('Covariance matrix of X:\n');
disp(C);

% b) Finding and plotting principal components
[V, D] = eig(C);
syms t
x = centroid(1) + t * V(1, 1);
y = centroid(2) + t * V(2, 1);
fplot(x, y, '-k');
x = centroid(1) + t * V(1, 2);
y = centroid(2) + t * V(2, 2);
fplot(x, y, '-k');

% c) Finding the covariance of the transform matrix
Y = inv(V) * X;
centroidY = mean(Y, 2);
Ym0 = zeros(m, n);
Ym0(1, :) = Y(1, :) - centroidY(1);
Ym0(2, :) = Y(2, :) - centroidY(2);
Cy = 1/n * Ym0 * (Ym0');
fprintf('Covariance matrix of Y:\n');
disp(Cy)

% d) Comparing Matlabs `pca()` to my result. 
Vm = pca(X');
fprintf('Matlab pca():\n');
disp(Vm)
fprintf('My components:\n');
disp(V)
% Indeed, upon inspection of output values one can notice that Matlab's
% components are equal to mine.