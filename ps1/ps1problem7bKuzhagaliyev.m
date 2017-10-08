n = 100;

% Generating A
A = zeros(n);
for i = 1:n
    for j = 1:n
        A(i,j) = i * n - (n - j);
    end
end

% Generating b
b = (1:n)';

% Since we want the first (n - rank(A)) = 2 components to be zero, we're
% only interested in the last 2 columns of the matrix:
B = A(:, n-1:n);

% Calculating the last 2 values for x:
x0 = pinv(B)*b;

% Placing the values into x:
x = zeros(n, 1);
x(n-1) = x0(1);
x(n) = x0(2);

A * x